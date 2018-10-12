import serial
from flask import render_template, request
from flask import Flask

app = Flask(__name__)


@app.route('/')
@app.route('/gui', methods=(['GET', 'POST']))
def hello_world():
    if request.method =='POST':
        request.form['submit']
        arduino_serial = serial.Serial('COM3', 9600, timeout=1)  # Create Serial port object called arduinoSerialData
        if request.form['submit']== 'Blink Fast':  # if the entered data is blink fast
            print(b'1')
            arduino_serial.write(b'1')  # send 1 to arduino
        elif request.form['submit']=='Blink Slow':
            arduino_serial.write(b'0')  # send 0 to arduino
            print(b'1')

    return render_template('gui.html')


if __name__ == '__main__':
    app.run()
