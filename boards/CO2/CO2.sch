EESchema Schematic File Version 4
LIBS:CO2-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Buzzer BZ1
U 1 1 5C87C9B0
P 7200 3100
F 0 "BZ1" H 7353 3129 50  0000 L CNN
F 1 "Buzzer" H 7353 3038 50  0000 L CNN
F 2 "Buzzer_Beeper:Buzzer_12x9.5RM7.6" V 7175 3200 50  0001 C CNN
F 3 "~" V 7175 3200 50  0001 C CNN
	1    7200 3100
	1    0    0    -1  
$EndComp
Text Label 5550 4450 0    50   ~ 0
A
$Comp
L power:GND #PWR04
U 1 1 5C883063
P 5550 5150
F 0 "#PWR04" H 5550 4900 50  0001 C CNN
F 1 "GND" V 5555 5022 50  0000 R CNN
F 2 "" H 5550 5150 50  0001 C CNN
F 3 "" H 5550 5150 50  0001 C CNN
	1    5550 5150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5C8830AF
P 4350 5150
F 0 "#PWR02" H 4350 4900 50  0001 C CNN
F 1 "GND" V 4355 5022 50  0000 R CNN
F 2 "" H 4350 5150 50  0001 C CNN
F 3 "" H 4350 5150 50  0001 C CNN
	1    4350 5150
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR03
U 1 1 5C883117
P 4350 5250
F 0 "#PWR03" H 4350 5100 50  0001 C CNN
F 1 "+3V3" V 4365 5378 50  0000 L CNN
F 2 "" H 4350 5250 50  0001 C CNN
F 3 "" H 4350 5250 50  0001 C CNN
	1    4350 5250
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR01
U 1 1 5C883163
P 4350 4650
F 0 "#PWR01" H 4350 4500 50  0001 C CNN
F 1 "+3V3" V 4365 4778 50  0000 L CNN
F 2 "" H 4350 4650 50  0001 C CNN
F 3 "" H 4350 4650 50  0001 C CNN
	1    4350 4650
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5C8831B6
P 5550 5250
F 0 "#PWR05" H 5550 5100 50  0001 C CNN
F 1 "+5V" V 5565 5378 50  0000 L CNN
F 2 "" H 5550 5250 50  0001 C CNN
F 3 "" H 5550 5250 50  0001 C CNN
	1    5550 5250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5C88328C
P 6850 4900
F 0 "#PWR08" H 6850 4650 50  0001 C CNN
F 1 "GND" V 6855 4772 50  0000 R CNN
F 2 "" H 6850 4900 50  0001 C CNN
F 3 "" H 6850 4900 50  0001 C CNN
	1    6850 4900
	1    0    0    -1  
$EndComp
Text Label 5550 4950 0    50   ~ 0
BZ
Text Label 7100 3000 2    50   ~ 0
BZ
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C883D92
P 6850 4700
F 0 "#FLG0102" H 6850 4775 50  0001 C CNN
F 1 "PWR_FLAG" V 6850 4828 50  0000 L CNN
F 2 "" H 6850 4700 50  0001 C CNN
F 3 "~" H 6850 4700 50  0001 C CNN
	1    6850 4700
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0102
U 1 1 5C883DD0
P 6850 4700
F 0 "#PWR0102" H 6850 4550 50  0001 C CNN
F 1 "+3V3" H 6865 4873 50  0000 C CNN
F 2 "" H 6850 4700 50  0001 C CNN
F 3 "" H 6850 4700 50  0001 C CNN
	1    6850 4700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5C883E1C
P 6850 4900
F 0 "#FLG0103" H 6850 4975 50  0001 C CNN
F 1 "PWR_FLAG" V 6850 5028 50  0000 L CNN
F 2 "" H 6850 4900 50  0001 C CNN
F 3 "~" H 6850 4900 50  0001 C CNN
	1    6850 4900
	0    -1   -1   0   
$EndComp
$Comp
L CO2-rescue:TTGO-TTGO U1
U 1 1 5C884207
P 4950 5350
F 0 "U1" H 4950 6815 50  0000 C CNN
F 1 "TTGO" H 4950 6724 50  0000 C CNN
F 2 "Package_DIP:TTGO" H 4950 5100 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32_datasheet_en.pdf" H 4650 5050 50  0001 C CNN
	1    4950 5350
	1    0    0    -1  
$EndComp
NoConn ~ 5550 4150
NoConn ~ 5550 4350
NoConn ~ 5550 4250
NoConn ~ 4350 4950
NoConn ~ 4350 4850
NoConn ~ 4350 4750
NoConn ~ 4350 4150
Text Label 4350 5050 2    50   ~ 0
TX
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 5D150E7D
P 5200 3000
F 0 "J2" H 5280 3042 50  0000 L CNN
F 1 "Conn_01x05" H 5280 2951 50  0000 L CNN
F 2 "Connector_JST:JST_XH_S5B-XH-A_1x05_P2.50mm_Horizontal" H 5200 3000 50  0001 C CNN
F 3 "~" H 5200 3000 50  0001 C CNN
	1    5200 3000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C883CD0
P 6850 4350
F 0 "#FLG0101" H 6850 4425 50  0001 C CNN
F 1 "PWR_FLAG" V 6850 4478 50  0000 L CNN
F 2 "" H 6850 4350 50  0001 C CNN
F 3 "~" H 6850 4350 50  0001 C CNN
	1    6850 4350
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5C8831F4
P 6850 4350
F 0 "#PWR06" H 6850 4200 50  0001 C CNN
F 1 "+5V" V 6865 4478 50  0000 L CNN
F 2 "" H 6850 4350 50  0001 C CNN
F 3 "" H 6850 4350 50  0001 C CNN
	1    6850 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D15103C
P 5000 2900
F 0 "#PWR0107" H 5000 2650 50  0001 C CNN
F 1 "GND" V 5005 2772 50  0000 R CNN
F 2 "" H 5000 2900 50  0001 C CNN
F 3 "" H 5000 2900 50  0001 C CNN
	1    5000 2900
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR0108
U 1 1 5D151048
P 5000 2800
F 0 "#PWR0108" H 5000 2650 50  0001 C CNN
F 1 "+3V3" H 5015 2973 50  0000 C CNN
F 2 "" H 5000 2800 50  0001 C CNN
F 3 "" H 5000 2800 50  0001 C CNN
	1    5000 2800
	1    0    0    -1  
$EndComp
Text Label 5000 3000 2    50   ~ 0
A
Text Label 5000 3200 2    50   ~ 0
TX
Text Label 5000 3100 2    50   ~ 0
RX
Text Label 5550 4550 0    50   ~ 0
S
Text Label 4050 5450 2    50   ~ 0
RX
$Comp
L Device:R R1
U 1 1 5D15562D
P 4200 5450
F 0 "R1" V 4100 5450 50  0000 C CNN
F 1 "3k3" V 4200 5450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4130 5450 50  0001 C CNN
F 3 "~" H 4200 5450 50  0001 C CNN
	1    4200 5450
	0    1    1    0   
$EndComp
Text Label 4350 4550 2    50   ~ 0
SDA
Text Label 4350 4250 2    50   ~ 0
SCL
Text Label 3500 3400 2    50   ~ 0
S
$Comp
L power:GND #PWR0106
U 1 1 5D150F5C
P 3500 3200
F 0 "#PWR0106" H 3500 2950 50  0001 C CNN
F 1 "GND" V 3505 3072 50  0000 R CNN
F 2 "" H 3500 3200 50  0001 C CNN
F 3 "" H 3500 3200 50  0001 C CNN
	1    3500 3200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5D150F0F
P 3500 3300
F 0 "#PWR0105" H 3500 3150 50  0001 C CNN
F 1 "+5V" V 3515 3428 50  0000 L CNN
F 2 "" H 3500 3300 50  0001 C CNN
F 3 "" H 3500 3300 50  0001 C CNN
	1    3500 3300
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5D150DD1
P 3700 3300
F 0 "J1" H 3780 3342 50  0000 L CNN
F 1 "Conn_01x03" H 3780 3251 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 3700 3300 50  0001 C CNN
F 3 "~" H 3700 3300 50  0001 C CNN
	1    3700 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 5D2CC1BA
P 6150 3400
F 0 "J3" H 6230 3392 50  0000 L CNN
F 1 "Conn_01x04" H 6230 3301 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6150 3400 50  0001 C CNN
F 3 "~" H 6150 3400 50  0001 C CNN
	1    6150 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0101
U 1 1 5D2CC200
P 5950 3300
F 0 "#PWR0101" H 5950 3150 50  0001 C CNN
F 1 "+3V3" H 5965 3473 50  0000 C CNN
F 2 "" H 5950 3300 50  0001 C CNN
F 3 "" H 5950 3300 50  0001 C CNN
	1    5950 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5D2CC21D
P 5950 3400
F 0 "#PWR0103" H 5950 3150 50  0001 C CNN
F 1 "GND" V 5955 3272 50  0000 R CNN
F 2 "" H 5950 3400 50  0001 C CNN
F 3 "" H 5950 3400 50  0001 C CNN
	1    5950 3400
	0    1    1    0   
$EndComp
Text Label 5950 3500 2    50   ~ 0
SCL
Text Label 5950 3600 2    50   ~ 0
SDA
NoConn ~ 5550 4650
NoConn ~ 5550 4750
NoConn ~ 5550 4850
NoConn ~ 4350 5350
NoConn ~ 5550 5050
NoConn ~ 4350 4350
NoConn ~ 4350 4450
$Comp
L power:GND #PWR?
U 1 1 5D968954
P 7100 3200
F 0 "#PWR?" H 7100 2950 50  0001 C CNN
F 1 "GND" V 7105 3072 50  0000 R CNN
F 2 "" H 7100 3200 50  0001 C CNN
F 3 "" H 7100 3200 50  0001 C CNN
	1    7100 3200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
