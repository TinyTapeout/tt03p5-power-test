MAGIC_FILE="../runs/wokwi/results/final/mag/tt_um_power_test.mag"
LEF_FILE="../runs/wokwi/results/final/lef/tt_um_power_test.lef"
GDS_FILE="../runs/wokwi/results/final/gds/tt_um_power_test.gds"
SKY130_POWER_GATE="$(shell dirname $(MAGIC_FILE))/sky130_power_gate"

pfet: $(SKY130_POWER_GATE)
	python3 add_pfet.py $(MAGIC_FILE)
	echo "source route_pfet.tcl; save; lef write -hide; gds write \"$(GDS_FILE)\"" | magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc -noconsole -dnull $(MAGIC_FILE)
	mv $(shell basename $(LEF_FILE)) $(LEF_FILE)

$(SKY130_POWER_GATE):
	git -C "$@" pull || git clone https://github.com/iic-jku/sky130_power_gate $@
