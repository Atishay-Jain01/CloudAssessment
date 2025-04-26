from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def hello():
    return jsonify({"message": "Hello, this is Cloud Assessment question 2"})

@app.route('/api/health')
def health():
    return jsonify({"status": "healthy"})

if __name__ == '_main_':
    app.run(host='0.0.0.0', port=5000,debug=True)