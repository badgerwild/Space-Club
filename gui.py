import serial
from flask import render_template, request
from flask import Flask

app = Flask(__name__)

arduino_serial = serial.Serial('COM3', 9600, timeout=1)  # Create Serial port object called arduinoSerialData

@app.route('/')

@app.route('/gui', methods=(['GET', 'POST']))

def hello_world():

    if request.method =='POST':
        request.form['submit']
        if request.form['submit']== 'Blink Fast':  # if the entered data is blink fast
            arduino_serial.write(str.encode(str('1')))
            print('1')
        elif request.form['submit']=='Blink Slow':
            # send 1 to arduino
            arduino_serial.write(str.encode(str(0)))  # send 0 to arduino
            print('0')

    return render_template('gui.html')


if __name__ == '__main__':
    app.run()
