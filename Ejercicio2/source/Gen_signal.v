//Signal representing the secuence recibe
`timescale 100us / 100us

module gen_signal(out);
    
    parameter PERIODO = 10;
    output reg out;
    
    initial begin
//1er Error
        out=1'b0;
        #PERIODO;
         out<=1'b0;
        #PERIODO;
        out<=1'b1;
        #PERIODO;
//2do Error
        out<=1'b0;
        #PERIODO;
        out<=1'b1;
        #PERIODO;
        out<=1'b1;
        #PERIODO;
//3er Error
        out<=1'b1;
        #PERIODO;
        out<=1'b1;
        #PERIODO;
        out<=1'b1;
        #PERIODO;
        out<=1'b0;
        #PERIODO;
//4to Error
        out<=1'b0;
        #PERIODO;
        out<=1'b1;
        #PERIODO;
        out<=1'b1;
        #PERIODO;
        out<=1'b0;
        #PERIODO;
        out<=1'b1;
    end
endmodule