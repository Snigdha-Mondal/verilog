`timescale 1ns/1ps

// NOR gate
module nor_gate(a, b, y);
    input a, b;
    output y;

    assign y = ~(a | b);
endmodule

// Testbench
module tb;

    reg a, b;
    wire y;

    nor_gate uut (a, b, y);

    initial begin
        $monitor("a=%b b=%b y=%b", a, b, y);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule