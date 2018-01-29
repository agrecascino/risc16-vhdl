/*
 Copyright (C) 2016  Intel Corporation. All rights reserved.
 Your use of Intel Corporation's design tools, logic functions 
 and other software and tools, and its AMPP partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Intel Program License 
 Subscription Agreement, the Intel Quartus Prime License Agreement,
 the Intel MegaCore Function License Agreement, or other 
 applicable license agreement, including, without limitation, 
 that your use is for the sole purpose of programming logic 
 devices manufactured by Intel and sold by Intel or its 
 authorized distributors.  Please refer to the applicable 
 agreement for further details.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Slow Corner delays for the design using part 5CSEMA4U23C6
 with speed grade 6, core voltage 1.1V, and temperature 85 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "testpga";
DATE "01/27/2018 22:00:43";
PROGRAM "Quartus Prime";



INPUT FPGA_CLK_50;
INOUT ARDUINO_IO[0];
INOUT ARDUINO_IO[1];
INOUT ARDUINO_IO[2];
INOUT ARDUINO_IO[3];
INOUT ARDUINO_IO[4];
INOUT ARDUINO_IO[5];
INOUT ARDUINO_IO[6];
INOUT ARDUINO_IO[7];
INOUT ARDUINO_IO[8];
INOUT ARDUINO_IO[9];
INOUT ARDUINO_IO[10];
INOUT ARDUINO_IO[11];
INOUT ARDUINO_IO[12];
INOUT ARDUINO_IO[13];
INOUT ARDUINO_IO[14];
INOUT ARDUINO_IO[15];
INOUT ARDUINO_RESET_N;
INOUT GPIO_0[0];
INOUT GPIO_0[1];
INOUT GPIO_0[2];
INOUT GPIO_0[3];
INOUT GPIO_0[4];
INOUT GPIO_0[5];
INOUT GPIO_0[6];
INOUT GPIO_0[7];
INOUT GPIO_0[8];
INOUT GPIO_0[9];
INOUT GPIO_0[10];
INOUT GPIO_0[11];
INOUT GPIO_0[12];
INOUT GPIO_0[13];
INOUT GPIO_0[14];
INOUT GPIO_0[15];
INOUT GPIO_0[16];
INOUT GPIO_0[17];
INOUT GPIO_0[18];
INOUT GPIO_0[19];
INOUT GPIO_0[20];
INOUT GPIO_0[21];
INOUT GPIO_0[22];
INOUT GPIO_0[23];
INOUT GPIO_0[24];
INOUT GPIO_0[25];
INOUT GPIO_0[26];
INOUT GPIO_0[27];
INOUT GPIO_0[28];
INOUT GPIO_0[29];
INOUT GPIO_0[30];
INOUT GPIO_0[31];
INOUT GPIO_0[32];
INOUT GPIO_0[33];
INOUT GPIO_0[34];
INOUT GPIO_0[35];
INOUT GPIO_1[0];
INOUT GPIO_1[1];
INOUT GPIO_1[2];
INOUT GPIO_1[3];
INOUT GPIO_1[4];
INOUT GPIO_1[5];
INOUT GPIO_1[6];
INOUT GPIO_1[7];
INOUT GPIO_1[8];
INOUT GPIO_1[9];
INOUT GPIO_1[10];
INOUT GPIO_1[11];
INOUT GPIO_1[12];
INOUT GPIO_1[13];
INOUT GPIO_1[14];
INOUT GPIO_1[15];
INOUT GPIO_1[16];
INOUT GPIO_1[17];
INOUT GPIO_1[18];
INOUT GPIO_1[19];
INOUT GPIO_1[20];
INOUT GPIO_1[21];
INOUT GPIO_1[22];
INOUT GPIO_1[23];
INOUT GPIO_1[24];
INOUT GPIO_1[25];
INOUT GPIO_1[26];
INOUT GPIO_1[27];
INOUT GPIO_1[28];
INOUT GPIO_1[29];
INOUT GPIO_1[30];
INOUT GPIO_1[31];
INOUT GPIO_1[32];
INOUT GPIO_1[33];
INOUT GPIO_1[34];
INOUT GPIO_1[35];
INPUT FPGA_CLK2_50;
INPUT FPGA_CLK3_50;
INPUT ADC_SDO;
INPUT KEY[0];
INPUT KEY[1];
INPUT SW[0];
INPUT SW[1];
INPUT SW[2];
INPUT SW[3];
OUTPUT ADC_CONVST;
OUTPUT ADC_SCLK;
OUTPUT ADC_SDI;
OUTPUT LED[0];
OUTPUT LED[1];
OUTPUT LED[2];
OUTPUT LED[3];
OUTPUT LED[4];
OUTPUT LED[5];
OUTPUT LED[6];
OUTPUT LED[7];

/*Arc definitions start here*/
pos_FPGA_CLK_50__LED[0]__delay:		DELAY (POSEDGE) FPGA_CLK_50 LED[0] ;
pos_FPGA_CLK_50__LED[1]__delay:		DELAY (POSEDGE) FPGA_CLK_50 LED[1] ;
pos_FPGA_CLK_50__LED[2]__delay:		DELAY (POSEDGE) FPGA_CLK_50 LED[2] ;
pos_FPGA_CLK_50__LED[3]__delay:		DELAY (POSEDGE) FPGA_CLK_50 LED[3] ;
pos_FPGA_CLK_50__LED[4]__delay:		DELAY (POSEDGE) FPGA_CLK_50 LED[4] ;
pos_FPGA_CLK_50__LED[5]__delay:		DELAY (POSEDGE) FPGA_CLK_50 LED[5] ;
pos_FPGA_CLK_50__LED[6]__delay:		DELAY (POSEDGE) FPGA_CLK_50 LED[6] ;
pos_FPGA_CLK_50__LED[7]__delay:		DELAY (POSEDGE) FPGA_CLK_50 LED[7] ;

ENDMODEL
