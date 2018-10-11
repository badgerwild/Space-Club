from flask import Flask,render_template

app = Flask(__name__)


@app.route('/')
@app.route('/gui')
def hello_world():
    return render_template('gui.html')


if __name__ == '__main__':
    app.run()
