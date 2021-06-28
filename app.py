from flask import Flask, send_file
from waitress import serve
import requests
from io import StringIO, BytesIO

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Missing Group ID'


@app.route('/groups/<int:group_id>', defaults={'key': None})
@app.route('/groups/<int:group_id>/<key>')
def zotero_group(group_id, key):
    limit = 100
    start = limit
    base_url = 'https://api.zotero.org/groups/' + str(group_id) + \
               '/items/top?format=bibtex&style=numeric&limit=' + str(limit)
    if key:
        base_url += "&key=" + str(key)
    req = requests.get(base_url)
    req_text = req.text
    buffer = StringIO()
    buffer.write(req_text)
    # bib = req_text
    while req_text != '':
        request_url = base_url + "&start=" + str(start)
        print("Fetching ", request_url)
        req = requests.get(request_url)
        req_text = req.text
        buffer.write(req_text)
        start += limit

    # Convert String Buffer to BytesIO so that send_file works
    mem = BytesIO()
    mem.write(buffer.getvalue().encode())
    mem.seek(0)
    buffer.close()
    return send_file(mem, as_attachment=True,
                     attachment_filename='references.bib', mimetype='text/plain')

    # show the post with the given id, the id is an integer
    # return 'Post %d' % post_id


# https://api.zotero.org/groups/2579480/items/top?format=bibtex&style=numeric&limit=1000
# run the app.
if __name__ == "__main__":
    serve(app, port=5000)
