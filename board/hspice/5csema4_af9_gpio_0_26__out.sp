************************************************************************
* Quartus HSPICE Writer I/O Simulation Deck
*
* This spice simulation deck was automatically generated by Quartus for
* the following IO settings:
*
*  Device:       5CSEMA4U23C6
*  Speed Grade:  C6
*  Pin:          AF9 (GPIO_0[26])
*  Bank:         IO Bank 3B (Column I/O)
*  I/O Standard: 3.3-V LVTTL, 16mA
*  OCT:          Off/Off
*
* Quartus' default I/O timing delays assume the following slow corner
* simulation conditions.
*
*  Specified Test Conditions For Quartus Tco
*    Temperature:      85C (Slowest Temperature Corner)
*    Transistor Model: TT (Typical Transistor Corner)
*    Vccn:             3.085V (Vccn_min = Nominal - 5% - 50mV additional margin)
*    Vccpd:            3.085V (Vccpd_min = Nominal - 5% - 50mV additional margin)
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
*         Vccn:             3.630V (Vccn_hold = Nominal + 10%)
*         Vccpd:            3.630V
*         
*         Vcc:             1.180V (Vcc_hold = Nominal + 7%)
*         Package Model:    Short-circuit from pad to pin (no parasitics)
*
*       For a detailed description of hold time analysis see
*       the Quartus II HSPICE Writer AppNote.
*
* Usage:
*   This spice deck is setup to ensure that the I/O path delay of a pin
*   is not double counted. This is accomplished by subtracting the I/O
*   path delay from the HSPICE simulation delay result which will allow
*   the Quartus Tco and HSPICE Tpd to be added to determine the total
*   path delay.  The necessary steps to simulate a single IO are as
*   follows:
*
*    1) Replace the sample board and termination circuit below with
*       your desired circuit.
*    2) Replace the VccN and Vccpd voltages with your desired value or
*       leave them unchanged for a slow corner simulation.
*   3a) If you wish to simulate a different temperature or transistor
*       corner than specified in this file, you will need to manually
*       subtract off the double counting.  Consult the Quartus II HSPICE
*       Writer AppNote for the recommended procedure.
*   3b) If you are simulating with the default temperature and transistor
*       corner, this spice deck will automatically subtract the double
*       counting.  For a description of the process used to accomplish
*       this, please consult the Quartus II HSPICE Writer AppNote.
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
voeb       oeb          0     0 * Set to 0 to enable buffer output
vopdrain   ropdrain     0     vc * Set to vc to enable open drain 
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

vdin       din       0     pulse(0 vc 0s 0.2ns 0.2ns 16.5ns 33.4ns)

************************************************************************
* IO Buffer Netlist 
************************************************************************
.include 'cir/io_buffer.inc'
.include 'cir/lvds_output_load.inc'

************************************************************************
* Drive Strength Settings
************************************************************************
.lib 'lib/drive_select_io.lib' 3p3ttl_16ma

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
.param vcn=3.085
.param vpd=3.085
.param vc=1.00

* Instantiate Power Supplies
vvcc       vcc       0     vc     * FPGA core voltage
vvss       vss       0     0      * FPGA core ground
vvccn      vccn      0     vcn    * IO supply voltage
vvssn      vssn      0     0      * FPGA IO ground
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

rextpullup vccn pin 1k      * Required in open drain mode
* Board termination network as specified in Quartus
Rsmall pin load 10u * Short between pin and load


************************************************************************
* Double Counting Compensation Circuitry
*
*   The following circuit is designed to calculate the amount of double
*   counting between Quartus and the HSPICE models.  If you have not
*   changed the default simulation temperature or transistor corner the
*   double counting will be automatically compensated by this spice 
*   deck.  In the event you wish to simulate an IO at a different
*   temperature or transistor corner you will need to remove this
*   section of code and manually account for double counting.  A 
*   description of Altera's recommended procedure for this process can
*   be found in the Quartus II HSPICE Writer AppNote.
*
************************************************************************

* Supply Voltages Settings
.param vcn_tl=3.085
.param vpd_tl=3.085

* Test Load Constant Definition
vopdrain_tl   ropdrain_tl  0     0
vrambh_tl     rambh_tl     0     0
vrpullup_tl   rpullup_tl   0     0

* Instantiate Power Supplies
vvccn_tl      vccn_tl      0     vcn_tl
vvssn_tl      vssn_tl      0     0
vvccpd_tl     vccpd_tl     0     vpd_tl

* Instantiate I/O Buffer
xio_buffer_testload din oeb ropdrain_tl die_tl rambh_tl rndly1 rndly0 rpdly1 rpdly0
+ rpcdn9 rpcdn8 rpcdn7 rpcdn6 rpcdn5 rpcdn4 rpcdn3 rpcdn2 rpcdn1 rpcdn0
+ rpcdp9 rpcdp8 rpcdp7 rpcdp6 rpcdp5 rpcdp4 rpcdp3 rpcdp2 rpcdp1 rpcdp0
+ rslewn rslewp vccn_tl vccpd_tl vcpad_tl vcc io_buffer

* Internal Loading on Pad
xlvds_output_testload die_tl vss vccn_tl vcpad0_tl vcpad0_tl vcc lvds_output_load

* I/O Buffer Package Model
xpkg_tl die_tl pin_tl io_pkg

* Default Altera Test Load
* - 3.3V LVTTL default test condition is an open load
* Board termination network as specified in Quartus
Rsmall_tl pin_tl load_tl 10u * Short between pin_tl and load_tl


************************************************************************
* Simulation Analysis Setup
************************************************************************

* Print out the voltage waveform at both the FPGA pin and far end load
.print tran v(pin) v(load)
.tran 0.020ns 35ns

* Measure the propagation delay to the load pin.  This value will
* include some double counting with Quartus' Tco
.measure TRAN tpd_uncomp_rise TRIG v(din) val='vc*0.5' rise=1 TARG v(load) val='vcn*0.5' rise=1
.measure TRAN tpd_uncomp_fall TRIG v(din) val='vc*0.5' td=16.7ns fall=1 TARG v(load) val='vcn*0.5' td=16.7ns fall=1

* Use the test load driver to calculate the amount of double counting
.measure TRAN t_dblcnt_rise TRIG v(din) val='vc*0.5' rise=1 TARG v(pin_tl) val='vcn_tl*0.5' rise=1
.measure TRAN t_dblcnt_fall TRIG v(din) val='vc*0.5' td=16.7ns fall=1 TARG v(pin_tl) val='vcn_tl*0.5' td=16.7ns fall=1

* Calculate the true propagation delay by subtraction
.measure TRAN tpd_rise PARAM='tpd_uncomp_rise-t_dblcnt_rise'
.measure TRAN tpd_fall PARAM='tpd_uncomp_fall-t_dblcnt_fall'

.end
