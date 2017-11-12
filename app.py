from flask import Flask, request, redirect
from flask_mysqldb import MySQL
from twilio.twiml.messaging_response import MessagingResponse
from get_response import get_responsev2


app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = ''
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'Whack'

curson = mysql.connection.cursor()

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

def checkZipcode(zipcode):
    cur.execute("SELECT city_id FROM postalcode WHERE postalcode = %s", [zipcode])
    row = cur.fetchone()
    if row:
        return row[0]
    else:
        return None


if __name__ == "__main__":
    app.run(debug=True)
