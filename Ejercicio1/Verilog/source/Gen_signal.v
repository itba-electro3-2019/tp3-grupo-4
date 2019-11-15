//Signal representing the secuence recibe
`timescale 100us / 100us

module gen_signal(I,S);
    
    parameter PERIODO = 10;
    output reg I,S;
    
    initial begin
//1er Error
        I=1'b0;
        S=1'b1;
        #PERIODO;
        I=1'b1;
        S=1'b1;
        #PERIODO;
        I=1'b0;
        S=1'b0;
        #PERIODO;
        I=1'b0;
        S=1'b0;
        #PERIODO;
        I=1'b0;
        S=1'b1;
        #PERIODO;
        I=1'b1;
        S=1'b1;
        #PERIODO;
        I=1'b1;
        S=1'b0;
        #PERIODO;
        I=1'b1;
        S=1'b0;
        #PERIODO;
        I=1'b0;
        S=1'b0;
        #PERIODO;
        I=1'b1;
        S=1'b0;
        #PERIODO;
        I=1'b1;
        S=1'b0;
        #PERIODO;
        I=1'b1;
        S=1'b1;
        #PERIODO;
        I=1'b1;
        S=1'b0;
        #PERIODO;
        I=1'b0;
        S=1'b0;
        #PERIODO;
        I=1'b1;
        S=1'b0;
        #PERIODO;
        I=1'b1;
        S=1'b1;
        #PERIODO;
        I=1'b0;
        S=1'b0;
    end
endmodule