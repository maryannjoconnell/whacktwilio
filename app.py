from flask import Flask, request, redirect
from flaskext.mysql import MySQL
from twilio.twiml.messaging_response import MessagingResponse
from get_response import get_responsev2


app = Flask(__name__)

mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'Whack'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)

cursor = mysql.connect().cursor()

def checkZipcode(zipcode):
    cursor.execute("SELECT city_id FROM postalcode WHERE postalcode = %s", [zipcode])
    row = cursor.fetchone()
    if row:
        return row[0]
    else:
        return None

def lookupItem(tablename, columnname, city_id):
    tablenames = ["plastic", "glass", "metal", "battery", "bulb", "paper", "electronic"]
    print "did we get here??"
    if tablename in tablenames:
      print "we made it in"
      print "SELECT" + columnname + " FROM "+tablename
      cursor.execute("SELECT %s FROM %s WHERE city_id = %s", [columnname, tablename, city_id])
      row = cursor.fetchone()
      if row:
        print "we made it out"
        print row[0]
        return row[0]
      else:
        return None

@app.route("/")
def home():
    return "Text (442)44GREEN for recycling info near you!"

@app.route('/sms', methods=['POST'])
def sms():
    number = request.form['From']
    message_body = request.form['Body']

    msg = get_responsev2(message_body)
    resp = MessagingResponse()
    resp.message(msg)
    return str(resp)


if __name__ == "__main__":
    app.run(debug=True)
