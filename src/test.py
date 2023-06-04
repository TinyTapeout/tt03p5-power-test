import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

@cocotb.test()
async def test_7seg(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    dut._log.info("reset")
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    assert dut.uio_oe == 0
    dut._log.info("check all sums")
    for a in range(127):
        for b in range(127):
            dut.a.value = a
            dut.b.value = b
            await ClockCycles(dut.clk, 1)
            assert dut.c.value == a + b
