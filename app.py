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

#TODO enumerate tables
def lookupItem(tablename, columnname, city_id):
    tablenames = ["plastic", "glass", "metal", "battery", "bulb", "paper", "electronic"]
    if tablename in tablenames:
      if tablename == "plastic":
        cursor.execute("SELECT %s FROM plastic WHERE city_id = %s", (columnname, city_id))
      elif tablename == "glass":
        cursor.execute("SELECT %s FROM glass WHERE city_id = %s", (columnname, city_id))
      elif tablename == "metal":
        cursor.execute("SELECT %s FROM metal WHERE city_id = %s", (columnname, city_id))
      elif tablename == "battery":
        cursor.execute("SELECT %s FROM battery WHERE city_id = %s", (columnname, city_id))
      elif tablename == "bulb":
        cursor.execute("SELECT %s FROM bulb WHERE city_id = %s", (columnname, city_id))
      elif tablename == "paper":
        cursor.execute("SELECT %s FROM paper WHERE city_id = %s", (columnname, city_id))
      elif tablename == "electronic":
          cursor.execute("SELECT %s FROM electronic WHERE city_id = %s", (columnname, city_id))
      else:
        return None

      row = cursor.fetchone()
      if row:
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
