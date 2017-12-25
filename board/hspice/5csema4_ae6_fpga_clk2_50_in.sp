************************************************************************
* Quartus HSPICE Writer I/O Simulation Deck
*
* This spice simulation deck was automatically generated by Quartus for
* the following IO settings:
*
*  Device:       5CSEMA4U23C6
*  Speed Grade:  C6
*  Pin:          AE6 (FPGA_CLK2_50)
*  Bank:         IO Bank 3A (Column I/O)
*  I/O Standard: 2.5 V
*  OCT:          Off
*
* Quartus' default I/O timing delays assume the following slow corner
* simulation conditions. 
*
*  Specified Test Conditions For Quartus Tco
*    Temperature:      85C (Slowest Temperature Corner)
*    Transistor Model: TT (Typical Transistor Corner)
*    Vccn:             2.325V (Vccn_min = Nominal - 5% - 50mV additional margin)
*    Vccpd:            2.325V (Vccpd_min = Nominal - 5% - 50mV additional margin)
*    Load:             No Load
*    
*    Vcc:              1.00V (Vcc_min = Nominal - 100mV additional margin)
*
* For C6 devices, the TT transistor corner provides an approximation 
* for worst case timing. However, for functionality simulations,
* it is recommended that the SS corner be simulated as well.
*
* Note: Actual production devices can be as fast as the FF corner.
*       Any simulations for hold times should be conducted using the
*       fast process corner with the following simulation conditions.
*         Temperature:      0C (Fastest Temperature Corner)
*         Transistor Model: FF (Fastest Transistor Corner)
*         Vccn:             2.750V (Vccn_hold = Nominal + 10%)
*         Vccpd:            2.750V
*         
*         Vcc:              1.180V (Vcc_hold = Nominal + 7%)
*         Package Model:    Short-circuit from pad to pin (no parasitics)
*
*       For a detailed description of hold time analysis see
*       the Quartus II HSPICE Writer AppNote.
*
* Usage:
*
*    1) Replace the sample board and termination circuit below with
*       your desired circuit.
*    2) Replace the sample driver circuit with a model of the actual
*       I/O driver that will be driving the FPGA input pin.
*    3) Replace the VccN and Vccpd voltages with your desired value or
*       leave them unchanged for a slow corner simulation.
*
* Warnings:
*
************************************************************************

************************************************************************
* Process Settings
************************************************************************
.options brief
.inc 'lib/cv_tt.inc' * TT process corner

************************************************************************
* Simulation Options
************************************************************************
.options brief=0
.options badchr co=132 acct ingold=2 nomod dv=1.0
+        dcstep=1 absv=1e-2 absi=1e-7 probe captab csdf=2 accurate=1 post=2
.options dcon=1
.option converge=1

.temp 85

************************************************************************
* Constant Definition
************************************************************************
voeb       oeb          0     vc * Set to 0 to enable buffer output
vopdrain   ropdrain     0     0 * Set to vc to enable open drain 
vrambh     rambh        0     0 * Set to vc to enable bus hold
vrpullup   rpullup      0     0 * Set to vc to enable weak pullup
vpci       rpci         0     0 * Set to vc to enable pci mode
vpcdp9     rpcdp9    	0     rp9
vpcdp8     rpcdp8    	0     rp8		
vpcdp7     rpcdp7    	0     rp7
vpcdp6     rpcdp6    	0     rp6
vpcdp5     rpcdp5    	0     rp5
vpcdp4     rpcdp4    	0     rp4
vpcdp3     rpcdp3    	0     rp3
vpcdp2     rpcdp2    	0     rp2
vpcdp1     rpcdp1    	0     rp1
vpcdp0     rpcdp0    	0     rp0
vpcdn9     rpcdn9    	0     rn9
vpcdn8     rpcdn8    	0     rn8
vpcdn7     rpcdn7    	0     rn7
vpcdn6     rpcdn6    	0     rn6
vpcdn5     rpcdn5    	0     rn5
vpcdn4     rpcdn4    	0     rn4
vpcdn3     rpcdn3    	0     rn3
vpcdn2     rpcdn2    	0     rn2
vpcdn1     rpcdn1    	0     rn1
vpcdn0     rpcdn0    	0     rn0
vpdly1     rpdly1    	0     rpdelay1
vpdly0     rpdly0    	0     rpdelay0
vndly1     rndly1    	0     rndelay1
vndly0     rndly0    	0     rndelay0
vpslew     rslewp   	0     rslewp
vnslew     rslewn   	0     rslewn

vdin       din          0     0

************************************************************************
* IO Buffer Netlist 
************************************************************************
.include 'cir/io_buffer.inc'
.include 'cir/lvds_output_load.inc'

************************************************************************
* Drive Strength Settings
************************************************************************
.lib 'lib/drive_select_io.lib' 2p5cmos_12ma

************************************************************************
* Programmable Output Delay Control Settings
************************************************************************
.lib 'lib/output_delay_control.lib' no_delay

************************************************************************
* Programmable Slew Rate Control Settings
************************************************************************
.lib 'lib/slew_rate_control.lib' fast

************************************************************************
* I/O Buffer Instantiation
************************************************************************

* Supply Voltages Settings
.param vcn=2.325
.param vpd=2.325
.param vc=1.00

* Instantiate Power Supplies
vvcc       vcc       0     vc     * FPGA core voltage
vvss       vss       0     0      * FPGA core ground
vvccn      vccn      0     vcn    * IO supply voltage
vvssn      vssn      0     0      * IO ground
vvccpd     vccpd     0     vpd    * Pre-drive supply voltage

* Instantiate I/O Buffer
xio_buffer din oeb ropdrain die rambh rndly1 rndly0 rpdly1 rpdly0
+ rpcdn9 rpcdn8 rpcdn7 rpcdn6 rpcdn5 rpcdn4 rpcdn3 rpcdn2 rpcdn1 rpcdn0
+ rpcdp9 rpcdp8 rpcdp7 rpcdp6 rpcdp5 rpcdp4 rpcdp3 rpcdp2 rpcdp1 rpcdp0
+ rslewn rslewp vccn vccpd vcpad0 vcc io_buffer

* Internal Loading on Pad
* - This pad has an LVDS output buffer connected to it. The LVDS buffer 
*   is disabled but introduces loading on the pad that is modeled below.
xlvds_output_load die vss vccn vcpad0 vcpad0 vcc lvds_output_load

* I/O Buffer Package Model
* - Standard Column I/O package trace
.lib 'lib/package.lib' io  
xpkg die pin io_pkg



* /////////////////////////////////////////////////////////////////// *
* I/O Board Trace And Termination Description                         *
*   - Replace this with your board trace and termination description  *
* /////////////////////////////////////////////////////////////////// *

wtline pin vssn board1 vssn N=1 L=1 RLGCMODEL=tlinemodel
.MODEL tlinemodel W MODELTYPE=RLGC N=1 Lo=7.13n Co=2.85p
rsource board1 source 50

* /////////////////////////////////////////////////////////////////// *
* Sample source stimulus placeholder                                  *
*  - Replace this with your I/O driver model                          *
* /////////////////////////////////////////////////////////////////// *

vsource source 0 pulse(0 vcn 0s 0.4ns 0.4ns 8.5ns 17.4ns)



************************************************************************
* Simulation Analysis Setup
************************************************************************

* Print out the voltage waveform at both the source and the FPGA pin
.print tran v(source)  v(pin)
.tran 0.020ns 17ns

* Measure the propagation delay from the source pin to the FPGA pin
* referenced against the 50% voltage threshold crossing point
.measure TRAN tpd_rise TRIG v(source) val='vcn*0.5' rise=1 TARG v(pin) val ='vcn*0.5' rise=1
.measure TRAN tpd_fall TRIG v(source) val='vcn*0.5' td=8.7ns fall=1 TARG v(pin) val ='vcn*0.5' td=8.7ns fall=1

.end
