from flask import Flask, make_response, request
import json

# for now we are just going to maintain the data since the last start of flask
# I could db this, but for now this seems like a good starting place.

data = []

app = Flask(__name__)


@app.route('/')
def hello():
    return '<h1>William Wood Harter - Wiliot Hackathon</h1>'


# the wserv MQTT listener will post data here
@app.route('/api/add_data', methods=['POST'])
def add_data():
    content = request.get_json(silent=True)
    data.append(content)
    # print(json.dumps(content))
    print(f"datapoints: {len(data)}")
    return make_response(json.dumps({"status":"success",}),200)