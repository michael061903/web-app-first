from flask import Flask, request, render_template_string
import subprocess

app = Flask(__name__)

HTML = '''
<h1>Run My Script from Flask</h1>
<form method="post">
    Enter a value: <input type="text" name="input_val">
    <input type="submit" value="Run Script">
</form>
{% if output %}
<h2>Script Output:</h2>
<pre>{{ output }}</pre>
{% endif %}
'''

@app.route('/', methods=['GET', 'POST'])
def index():
    output = None
    if request.method == 'POST':
        user_input = request.form['input_val']
        result = subprocess.run(
            ["/usr/bin/bash", "my_script.sh", user_input],
            capture_output=True,
            text=True
        )
        output = result.stdout
    return render_template_string(HTML, output=output)
