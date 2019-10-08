// Control Byte Constants
#define RD  0x13 // Read
#define DLE 0x10 // Data Link Escape
#define DAT 0x1A // Single Data Frame
#define EOF 0x1F // End of Frame

// Variables
#define LD  0x01 // Live Data
#define LDS 0x06 // Live Data Simple
#define RSN 0x30 // Read Serial Number

void getSerialNumber() {
  byte _readSerial[] = {DLE,RD,RSN,DLE,EOF,0x00,0x82};
  Dynament.write(_readSerial,sizeof(_readSerial));
  while(!Dynament.available() && millis() < 7000);
  char inChar = (char)Dynament.read();
  if (inChar == 0) {
    tft.println("Sensor found.");
    while (millis() < 7000);
    Dynament.write(_readSerial,sizeof(_readSerial));
    while(!Dynament.available());
    inChar = (char)Dynament.read();
  }
  if (inChar == DLE) {
    tft.println("Reading serial number.");
    if(Dynament.read() == DAT) {
      serialNumber = "";
      byte dataLength = Dynament.read();
      for (byte i = 1; i <= dataLength; i++) { serialNumber += (char)Dynament.read(); }
      if(Dynament.read() != DLE) serialNumber = "DLEEER";
      if(Dynament.read() != EOF) serialNumber = "EOF2ER";
      //if(Dynament.read() != 0x01) serialNumber = "CSHEER";
      //if(Dynament.read() != 0x94) serialNumber = "CSLEER";
      }
  }
  flushDynament();
}

void flushDynament() {
  while (Dynament.available()) Dynament.read();
}

float getGasReading() {
  union { byte b[4]; float f; } gasReading;
  byte _readLDS[] = {DLE,RD,LDS,DLE,EOF,0x00,0x58};
  unsigned long now = millis();
  Dynament.write(_readLDS,sizeof(_readLDS));
  while(!Dynament.available() && millis() - now < 500);
  if(Dynament.read() != DLE) return sqrt(-1);
  if(Dynament.read() != DAT) return sqrt(-1);
  if(Dynament.read() != 8) return sqrt(-1);
  for (byte i = 1; i <= 4; i++) { Dynament.read(); }
  gasReading.b[0] = Dynament.read(); // 33
  gasReading.b[1] = Dynament.read(); // 33
  gasReading.b[2] = Dynament.read(); // 38
  gasReading.b[3] = Dynament.read(); // C1
  // Serial.print("Gas Reading = "); Serial.println(gasReading.f); // -11.7
  if(Dynament.read() != DLE) return sqrt(-1);
  if(Dynament.read() != EOF) return sqrt(-1);
  flushDynament();
  return gasReading.f;
}

liveDataSimple_t getLiveDataSimple() {
  liveDataSimple_t _liveDataSimple;
  byte _readLDS[] = {DLE,RD,LDS,DLE,EOF,0x00,0x58};
  unsigned long now = millis();
  Dynament.write(_readLDS,sizeof(_readLDS));
  while(!Dynament.available() && millis() - now < 500);
  if(Dynament.read() != DLE) { Serial.println("DLE Error!"); }
  if(Dynament.read() != DAT) { Serial.println("DAT Error!"); }
  byte dataLength = Dynament.read();
  _liveDataSimple.Version.b[0] = Dynament.read();
  _liveDataSimple.Version.b[1] = Dynament.read();
  _liveDataSimple.statusFlags.b[0] = Dynament.read();
  _liveDataSimple.statusFlags.b[1] = Dynament.read();
  _liveDataSimple.gasReading.b[0] = Dynament.read();
  _liveDataSimple.gasReading.b[1] = Dynament.read();
  _liveDataSimple.gasReading.b[2] = Dynament.read();
  _liveDataSimple.gasReading.b[3] = Dynament.read();
  if(Dynament.read() != DLE) { Serial.println("DLE Error!"); }
  if(Dynament.read() != EOF) { Serial.println("EOF Error!"); }
  flushDynament();
  return _liveDataSimple;
}

liveData_t getLiveData() {
  liveData_t _liveData;
  byte _readLDS[] = {DLE,RD,LD,DLE,EOF,0x00,0x53};
  unsigned long now = millis();
  Dynament.write(_readLDS,sizeof(_readLDS));
  while(!Dynament.available() && millis() - now < 500);
  if(Dynament.read() != DLE) { Serial.println("DLE Error!"); }
  if(Dynament.read() != DAT) { Serial.println("DAT Error!"); }
  byte dataLength = Dynament.read();
  _liveData.Version.b[0] = Dynament.read();
  _liveData.Version.b[1] = Dynament.read();
  _liveData.statusFlags.b[0] = Dynament.read();
  _liveData.statusFlags.b[1] = Dynament.read();
  _liveData.gasReading.b[0] = Dynament.read();
  _liveData.gasReading.b[1] = Dynament.read();
  _liveData.gasReading.b[2] = Dynament.read();
  _liveData.gasReading.b[3] = Dynament.read();
  _liveData.temperature.b[0] = Dynament.read();
  _liveData.temperature.b[1] = Dynament.read();
  _liveData.temperature.b[2] = Dynament.read();
  _liveData.temperature.b[3] = Dynament.read();
  _liveData.Det.b[0] = Dynament.read();
  _liveData.Det.b[1] = Dynament.read();
  _liveData.Ref.b[0] = Dynament.read();
  _liveData.Ref.b[1] = Dynament.read();
  _liveData.Fa.b[0] = Dynament.read();
  _liveData.Fa.b[1] = Dynament.read();
  _liveData.Fa.b[2] = Dynament.read();
  _liveData.Fa.b[3] = Dynament.read();
  flushDynament();
  return _liveData;
}
