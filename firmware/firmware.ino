#define BUZZER 27
#define BATTERY 35
#define BUTTON 36

#include <SPI.h>
#include "SSD_13XX.h" //https://github.com/sumotoy/SSD_13XX
#define __CS    15  
#define __DC    16 
#define __RST   4
//define __mosi 23
//define __sclk 18
SSD_13XX tft = SSD_13XX(__CS, __DC, __RST);

#include "FS.h"
#include "SD.h"
#include "SPI.h"
char cstr[16];

#include <HardwareSerial.h>
HardwareSerial Dynament(2);
#define DynamentRX 17
#define DynamentTX 2
#define DynamentAnalogPIN 34
#define DynamentBAUD 38400
#define __CS    15  
#define __DC    16 
#define __RST   4
//define __mosi 23
//define __sclk 18

#include <Wire.h>
#include <Adafruit_BMP085.h>
Adafruit_BMP085 bmp;

#include <Servo.h>
static const int servoPin = 32;
Servo servo1;

struct liveDataSimple_t{
  union { byte b[2]; uint16_t i; } Version;
  union { byte b[2]; uint16_t i; } statusFlags;
  union { byte b[4]; float f; } gasReading;
};

struct liveData_t{
  union { byte b[2]; uint16_t i; } Version;
  union { byte b[2]; uint16_t i; } statusFlags;
  union { byte b[4]; float f; } gasReading;
  union { byte b[4]; float f; } temperature;
  union { byte b[2]; uint16_t i; } Det;
  union { byte b[2]; uint16_t i; } Ref;
  union { byte b[4]; float f; } Fa;
};

unsigned long currentMillis = millis(), previousMillis = 0, sampleTime = 1000; // milliseconds
float gasReading;
int analogValue;
String serialNumber = "ERROR!";
boolean doWriteSD = false;
liveData_t liveData;

void setup() {
  pinMode(BUZZER, OUTPUT);
  digitalWrite(BUZZER, LOW);
  pinMode(BUTTON, INPUT);
  pinMode(DynamentAnalogPIN, INPUT);
  Serial.begin(115200);
  Serial.println("Hello World");
  tft.begin();
  tft.println("Hello World");
  initSD();
  writeFile(SD, "/datalog.txt", "Time,Gas Reading,Temperature,Detector,Reference,Absorbance,Analog,Pressure,Temperature\n");
  Dynament.begin(DynamentBAUD, SERIAL_8N1, DynamentRX, DynamentTX);
  getSerialNumber();
  if (!bmp.begin()) {
    Serial.println("Could not find a valid BMP085 sensor, check wiring!");
    while (1) {}
  }
  servo1.attach(servoPin);
  servo1.write(0);
}

void loop() {
  currentMillis = millis();
  if(currentMillis - previousMillis > sampleTime) {
    previousMillis = currentMillis;
    readSensor();
    if (doWriteSD) writeSD();
  }
  if (!digitalRead(BUTTON)) buttonPress();
}

void buttonPress() {
  itoa(millis(), cstr, 10);
  digitalWrite(BUZZER, HIGH);
  if (doWriteSD) {
    doWriteSD = false;
    appendFile(SD, "/datalog.txt", "Stopped logging data at ");
  }
  else {
    doWriteSD = true;
    appendFile(SD, "/datalog.txt", "Started logging data at ");
  }
  appendFile(SD, "/datalog.txt", cstr);\
  appendFile(SD, "/datalog.txt", " milliseconds.\n");
  tft.clearScreen();
  tft.fillScreen(RED);
  tft.println("Hello World!");
  servo1.write(180);
  delay(1000);
  digitalWrite(BUZZER, LOW);
  servo1.write(0);
  tft.clearScreen();
}

void writeSD() {
  //itoa(millis(), cstr, 10);
  //appendFile(SD, "/datalog.txt", "Writing to SD card at ");
  //appendFile(SD, "/datalog.txt", cstr);\
  //appendFile(SD, "/datalog.txt", " milliseconds.\n");
  static char buffer[50];
  sprintf (buffer, "%5lu,%1.3f,%1.3f,%4lu,%4lu,%1.5f,%4lu,%6lu,%1.3f\n",currentMillis/1000,liveData.gasReading.f,liveData.temperature.f,liveData.Det.i,liveData.Ref.i,liveData.Fa.f,analogValue,bmp.readPressure(),bmp.readTemperature());
  appendFile(SD, "/datalog.txt", buffer);
}

void readSensor() {
  liveData = getLiveData();
  analogValue = analogRead(DynamentAnalogPIN);
  tft.clearScreen();
  tft.print("Serial Number: "); tft.println(serialNumber);
  char buf[21];
  sprintf(buf,"Time: %02d:%02d:%02d",(currentMillis/1000/60/60),(currentMillis/1000/60)%60,(currentMillis/1000)%60);
  tft.println(buf);
  tft.print("Gas: "); tft.println(liveData.gasReading.f);
  tft.print("Temp: "); tft.print(liveData.temperature.f); tft.println(" °C");
//  tft.print("Detector: "); tft.println(liveData.Det.i);
//  tft.print("Reference: "); tft.println(liveData.Ref.i);
//  tft.print("Absorbance: "); tft.println(liveData.Fa.f);
  tft.print("Analog: "); tft.println(analogValue);
  tft.print("Pres = "); tft.print(bmp.readPressure()); tft.println(" Pa.");
  tft.print("Temp = "); tft.print(bmp.readTemperature()); tft.println(" °C.");
}

void readSensorOLD() {
  gasReading = getGasReading();
  analogValue = analogRead(DynamentAnalogPIN);
  tft.clearScreen();
  tft.print("Serial Number: "); tft.println(serialNumber);
  tft.print("Time: "); tft.println(currentMillis/1000);
  tft.print("Gas Reading: "); tft.println(gasReading);
  tft.print("Analog Reading: "); tft.println(analogValue);
}
