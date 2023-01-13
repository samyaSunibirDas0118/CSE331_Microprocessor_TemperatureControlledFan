/*
 *EEE-4103 Project: Temparature Controlled Fan 
 *Group: G5
 */

#include <LiquidCrystal.h>
LiquidCrystal lcd(2,3,4,5,6,7); //RS connected to - PD2, Enable connected to - PD3

int tempInpPin = A0;   // Output of LM35 to A0 
int fan = 11;         // Fan is connected to pin 11
int minTemp = 25;    // Fan will start when the temperature will be 25°C
int maxTemp = 45;   // The Fan will reach its maximum speed (100%) when the temperature will be 45°C
int temp;
int fanSpeed;
int fanLCD;
int led = 13;        //blue led pin
int led_red = 12;    //red led pin
int pir = 8;
int pirState;

// Setting up pin modes and lcd 
void setup() {
  pinMode(fan, OUTPUT);
  pinMode(led, OUTPUT);
  pinMode(led_red, OUTPUT);
  pinMode(tempInpPin, INPUT);
  pinMode(pir, INPUT);

  // Initializing the interface to the LCD screen
  lcd.begin(16,2);                  
  lcd.setCursor(0,0);
  lcd.print(" Welcome to our ");
  lcd.setCursor(0,1);
  lcd.print("EEE4103 Project");
  delay(2000);
  lcd.clear();
  Serial.begin(9600);
}

int getTemperature() {
  //LM35 is a temperature sensor with analog output.  
  temp = analogRead(tempInpPin); //Gets the temperature from LM35 sensor 
  return temp * 0.48828125;     //Converts the temparature into °C
}
 
void loop() {  
  temp = getTemperature();     // Gets the temperature in °Cs
  pirState = digitalRead(pir);
  
  if(pirState == HIGH){
  /*
  * Here, the temperature we will get from the LM35 sensor will be compared to the
  * minmum and maximum temperature. If it falls within the range, then the fanSpeed 
  * wil be set according to the temperature. 
  */ 
    if((temp >= minTemp) && (temp <= maxTemp)) { 
      // map(value, fromLow, fromHigh, toLow, toHigh)
      fanSpeed = map(temp, minTemp, maxTemp, 32, 255); // Gets the actual speed of fan
      fanLCD   = map(temp, minTemp, maxTemp, 0, 100); // Sets fanLCD to display the % of speed
      analogWrite(fan, fanSpeed);                    // Spin the fan at fanSpeed
      digitalWrite(led, HIGH);                      // Turn On Blue Led
    } 
    else
      digitalWrite(led, LOW); // Otherwise turn off blue led

    if(temp < minTemp) {   // If the temperature is less than the minimum temperature  
      fanSpeed = 0;       // The fanSpeed will be 0. So, the fan will stop spinning
      fanLCD = 0; 
      digitalWrite(fan, LOW);       
    } 
  
    if(temp > maxTemp) {          // If the temperature is less than the minimum temperature
      digitalWrite(fan, HIGH); 
      fanLCD = 100;  
      digitalWrite(led_red, HIGH);  // When the temp is above 40 the red led is ON, indicating temperature crossed maximum
    } 
    else                                   
      digitalWrite(led_red, LOW);

    lcd.setCursor(0,0);
    lcd.print("Temperature:");
    lcd.print(temp); // display the temperature
    lcd.write(223);
    lcd.print("C  ");
   
    lcd.setCursor(0,1); // move cursor to next line
    lcd.print("Fan Speed:");
    lcd.print(fanLCD); // display the fan speed
    lcd.print("%   ");
    delay(200);     
    }
  else {
    fanSpeed = 0;
    fanLCD = 0;
    digitalWrite(fan, LOW);    
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("No motion detected");
    lcd.setCursor(0,1); 
    lcd.print("Fan Speed:");
    lcd.print(fanLCD); // display the fan speed
    lcd.print("%   ");
    delay(200);
  } 
}
  

