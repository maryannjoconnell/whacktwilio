from flask import Flask, request, redirect
from twilio.twiml.messaging_response import MessagingResponse
from get_response import get_response


app = Flask(__name__)

@app.route("/")
def home():
    return "Text (442)44GREEN for recycling info near you!"

@app.route('/sms', methods=['POST'])
def sms():
    number = request.form['From']
    message_body = request.form['Body']

    msg = get_response(message_body)
    resp = MessagingResponse()
    resp.message(msg)
    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)
