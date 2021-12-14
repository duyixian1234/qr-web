from tempfile import mkstemp

import qrcode
from flask import Flask, request, send_file

app = Flask(__name__)

@app.route('/status')
def status():
    return "OK"

@app.route('/qr')
def make_qr():
    content = request.values.get('content', 'empty content')
    img = qrcode.make(content)
    _, path = mkstemp()
    img.save(open(path, 'wb'), format='png')
    return send_file(open(path, 'rb'), mimetype='image/png')
