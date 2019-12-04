# Introduction
This device uses an infrared gas sensor from [Dynament](https://www.dynament.com/gas-types/carbon-dioxide/) to monitor the concentration of carbon dioxide in the air.  When threshold conditions are met an [Entech Micro-QT valve](https://www.entechinst.com/product-category/micro-qt-valves/) on an evacuated chamber is open allowing a sample of the air to be captured.  This is accomplished by pressing a tube into the valve with a SG90 servo motor connected to a cam.  A [LilyGO TTGO T2 development board](https://www.amazon.com/TTGO-T2-Bluetooth-Development-Module/dp/B07B6MS253) communicates with the sensor (via [RS232](https://www.dynament.com/_webedit/uploaded-files/All%20Files/SIL%20Data/tds0045_1.44.pdf)) and logs data to a microSD card.  A simple user interface is accomplished with the onboard button and OLED display. More advanced features will be accessable through an Android device paired to the onboard bluetooth.

# Pinout
| GPIO |  Device |            Notes           |
|------|---------|----------------------------|
|   0  |         | outputs PWM signal at boot |
|   1  |  Serial |      serial monitor TX     |
|   2  |   RFID  |         Dynament RX        |
|   3  |  Serial |      serial monitor RX     |
|   4  |   OLED  |             RST            |
|   5  | SD card |             CS             |
| 6    | SPI     | SPI flash                  |
| 7    | SPI     | SPI flash                  |
| 8    | SPI     | SPI flash                  |
| 9    | SPI     | SPI flash                  |
| 10   | SPI     | SPI flash                  |
| 11   | SPI     | SPI flash                  |
| 12   |         | boot fail if pulled high   |
| 13   | OLED    | MOSI/SDA                   |
| 14   | OLED    | SCLK/SCL                   |
| 15   | OLED    | CS                         |
| 16   | OLED    | DC                         |
| 17   | RFID    | Dynament TX                |
| 18   | SD card | CLK                        |
| 19   | SD card | DO MISO                    |
| 21   | BMP180  | SDA                        |
| 22   | BMP180  | SCL                        |
| 23   | SD card | CMP/MOSI                   |
| 25   |         |                            |
| 26   |         |                            |
| 27   | Buzzer  | Buzzer                     |
| 32   | Servo   | Servo                      |
| 33   |         |                            |
| 34   | RFID    | Analog                     |
| 35   | Battery | Battery                    |
| 36   | Button  | Button                     |
| 39   |         | Inaccessible               |
