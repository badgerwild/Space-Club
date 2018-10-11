
int led =13, data;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); // Set the baud rate
  pinMode(13, OUTPUT); // Set the onboard LED to output
  digitalWrite(13, LOW);
  Serial.println("Ready");
}
void loop()
{
while (Serial.available())
{
  data = Serial.read();
}
if (data =='1')
{
    digitalWrite(led, HIGH); //turn LED on    
    delay(500); //wait for a second
    digitalWrite(led, LOW);//turn LED off
    delay(500); //wait for a second
}
else if (data =='0')
{
    digitalWrite(led, HIGH);//turn LED off
    delay(2000); //wait for a second
    digitalWrite(led, LOW);//turn LED off
    delay(2000); //wait for a second
}

}
