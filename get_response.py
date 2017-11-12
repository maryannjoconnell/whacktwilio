import os
import io
import enchant
import re

#constants
MAIN_COMMAND = "recycle"
ZIP_CODE = "00000"


def get_response(message):
    response = "Not sure what you mean. Use the " + MAIN_COMMAND + " command, followed by your zip code and what you want to recycle."

    if message.startswith(MAIN_COMMAND):
        message = message.split(' ', 1)[1] ##remove command from string
        ZIP_CODE = message.split()[0] ##store zip code
        if len(ZIP_CODE) == 5 and ZIP_CODE.isdigit(): ##checking zip code is valid
            message = message.split(' ', 1)[1]  ##remove zip code
            response = "Checking if " + message + " can be recycled in " + ZIP_CODE + "..."
        ##TODO: figure out if recyclable!!!
        else:
            response = "Please input a valid zip code (5 digit postal code)"
    return response

def get_responsev2(message):
    foundZip = False
    foundItem = False
    itemTable = ""
    itemColumn = ""
    zipcode = "00000"
    item = ""
    suggestedItem = ""
    foundSuggestion = False
    unknownWords = []

    if message:
        # do not process input exceeding 140 characters
        if len(message) < 160:
            message_arr = message.split(" ")
            if message_arr:
                # loop through array checking for matching single word item and zipcode
                for i in range(len(message_arr)):
                    word = message_arr[i]
                    if not foundZip and len(word) == 5 and word.isdigit():
                        foundZip = True
                        zipcode = word
                    elif not foundItem and word.isalpha():
                        # check our list of items
                        foundItem, itemTable, itemColumn = item_found(word)

                        if not foundItem :
                            # record unknown words
                            unknownWords.append(word)
                        else:
                            foundItem = True
                            item = word

                    if foundZip and (foundItem or foundSuggestion):
                        break

                # skip looking for item if we did not find a zipcode
                if not foundItem and foundZip:
                    # loop through array checking for matching double word item
                    for i in range(len(message_arr) - 1):
                        word1 = message_arr[i]
                        word2 = message_arr[i+1]
                        word = word1 + word2

                        if word.isalpha():
                            # check our list of items
                            foundItem, itemTable, itemColumn = item_found(word)
                            if (foundItem) :
                                item = word
                                break

                    # if we still didn't find a valid item, look for suggestions if any unknown words were records
                    if not foundItem and len(unknownWords) > 0:
                            for i in range(len(unknownWords)):
                                word = unknownWords[i]
                                suggestedItem = check_dictionary(word)
                                if suggestedItem:
                                    foundSuggestion = True
                                    break

    if foundZip:
        # if we have zip code
        city_id = checkZipcode(zipcode)
        if city_id:
            if foundItem:
                if itemTable and itemColumn:
                    #result = lookupItem(itemTable, itemColumn, city_id)
                    result = lookupItem(itemTable, itemColumn, city_id)

                    if result and result == 1:
                        return item + " can be recycled curbside in " + zipcode + "!"

                # found item that can't be recycled curbside
                return item + " not recyclable curbside - visit earth911 to search for other options: http://search.earth911.com/?what=" + item + "&where=" + zipcode + "&list_filter=all&max_distance=25"
            elif foundSuggestion:
                response = "We didn't get that. Did you mean to ask about " + suggestedItem + "? "
                result = lookupItem(itemTable, itemColumn, city_id)

                if result:
                    response = response + item + " can be recycled curbside in " + zipcode + "!"
                    return response
                else:
                    #if not allowed
                    return suggestedItem + " not recyclable curbside - visit earth911 to search for other options: http://search.earth911.com/?what=" + item + "&where=" + zipcode + "&list_filter=all&max_distance=25"

            # fallback to I'm feeling lucky results
            response = "Feeling lucky? https://www.google.com/search?btnI=1&q=recycling%20" + zipcode
    elif foundItem:
        response = "Try entering \"" + item + "\" followed by your zip code."
    else:
        response = "Not sure what you mean. Enter your zip code and what you want to recycle."

    return response


def item_found(item):
    with io.open('items.tsv', 'r') as file:
        for line in file:
            line = line.strip() #preprocess line
            line_arr = re.split(r'\t+', line)
            if line_arr:
                dictionary_item = line_arr[0]
            if item.lower() == dictionary_item.lower():
                if len(line_arr) == 3:
                    return True, line_arr[1].strip(), line_arr[2].strip()
                else :
                    return True, "", ""

    return False, "", ""

def check_dictionary(word):
    foundSuggestion = False
    # Get US Dictionary
    dictionary = enchant.Dict("en_US")
    validEnglish = dictionary.check(word)
    if not validEnglish:
        suggestions = dictionary.suggest(word)
        for j in range(len(suggestions)):
            suggestion = suggestions[j]
            # take the first possible suggestion that is in our list, if any
            foundSuggestion = item_found(suggestion)
            if (foundSuggestion) :
                return suggestion

    return ""

from app import checkZipcode,lookupItem
