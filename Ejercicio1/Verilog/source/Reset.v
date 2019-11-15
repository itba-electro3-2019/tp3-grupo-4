`timescale 100us / 100us

module reset_gen(out);

    parameter PERIODO = 10;
    output reg out;

    initial begin
        out=1'b1;
        #(PERIODO);
        out<=1'b0;
    end
endmodule