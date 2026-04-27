

// NOR gate
module not_gate(a, y);
    input a;
    output y;

    assign y = ~a;
endmodule

// Testbench
`timescale 1ns/1ps

module tb;

    reg a;
    wire y;

    // Instantiate NOT gate
    not_gate uut (a, y);

    initial begin
        $monitor("a=%b y=%b", a, y);

        a = 0; #10;
        a = 1; #10;

        $finish;
    end

endmodule