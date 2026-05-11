module ALU (
    input  [7:0] A,
    input  [7:0] B,
    input  [3:0] ALU_Sel,

    output reg[7:0] Result,
    output reg CarryOut,
    output reg Zero
);

always @(*) begin

    // Default values
    Result   = 16'b0;
    CarryOut = 1'b0;

    case (ALU_Sel)

        // 0000 : Addition
        4'b0000: begin
            {CarryOut, Result} = A + B;
        end

        // 0001 : Subtraction
        4'b0001: begin
            {CarryOut, Result} = A - B;
        end

        // 0010 : Multiplication
        4'b0010: begin
            Result = A * B;
        end

        // 0011 : Division
        4'b0011: begin
            if (B != 0)
                Result = A / B;
            else
                Result = 16'hFFFF; // Divide by zero error
        end

        // 0100 : Increment A
        4'b0100: begin
            Result = A + 1;
        end

        // 0101 : Decrement A
        4'b0101: begin
            Result = A - 1;
        end

        // 0110 : AND
        4'b0110: begin
            Result = A & B;
        end

        // 0111 : OR
        4'b0111: begin
            Result = A | B;
        end

        // 1000 : NOT A
        4'b1000: begin
            Result = ~A;
        end

        // 1001 : Left Shift
        4'b1001: begin
            Result = A << 1;
        end

        // 1010 : Right Shift
        4'b1010: begin
            Result = A >> 1;
        end

        default: begin
            Result = 16'b0;
        end

    endcase

    // Zero flag
    if (Result == 0)
        Zero = 1'b1;
    else
        Zero = 1'b0;

end

endmodule
