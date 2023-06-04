# Add PFET to mag

* Clone Harald's pfet into this directory: https://github.com/iic-jku/sky130_power_gate
* Ensure PDK_ROOT is set correctly
* Remove all the vccd1 labels and ports by editing the .mag file and removing the rlabel and port lines for each stripe. There were 4 in my design.
* Open the tt_um_power_test.mag: magic tt_um_power_test.mag  -rcfile sky130A.magicrc
* Add path in magic: addpath sky130_power_gate
* Place an instance of the power_gate cell
* Wire up the 4 ports. All ports are on m3. vdd vdd_switch vss en:
  * draw a long vertical strip on m4 next to the design to pick up vdd and connect to vdd. need a v3 via
  * connect all the bottoms of vccd1 of the design together and connect to vdd_switch
  * connect en to some input pin (I used an unused input)
  * connect vss to one of the vssd1 stripes of the design.
* Setup the long vertical strip to be a port:
  * select the long strip, then edit -> label, create a label called vssd1 and enable the port button
  * type: 'port vccd1 use power' & then 'port vccd1 class inout'
* Ensure no DRC errors
* Ensure connectivity by selecting the new wires and repeatedly pressing s to highlight all connected parts
* Write the lef: 'lef write -hide'
* Write the gds: 'gds write power_switch.gds'
* Copy the lef and gds to the correct paths
