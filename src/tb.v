`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
   );

    wire [7:0] a, b, c, uio_oe;
    wire clk, rst_n, ena;

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // instantiate the DUT
    tt_um_power_test tt_um_power_test(
        `ifdef GL_TEST
            .vccd1( 1'b1),
            .vssd1( 1'b0),
        `endif
        .ui_in  (a),
        .uio_in (b),
        .uo_out (c),
        .uio_oe (uio_oe),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
        );

endmodule
