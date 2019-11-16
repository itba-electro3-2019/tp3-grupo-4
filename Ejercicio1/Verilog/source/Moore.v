
module Moore(clk,rst,I,S,Q_1,Q_0);

    input clk,rst,I,S;
    output Q_1,Q_0;
    wire [1:0] Q,D,E;
    wire Q_T;
    


//Intermedian wires
    wire S_neg,I_neg,Q_0S_neg,Q_0I_neg,Q_1S_neg,Q_1I_neg,S_negI_neg,Q_0xorQ_1,Eclock;
    wire [1:0] Q_neg;
    wire Q_T_neg;
//Conections
    not(S_neg,S);
    not(I_neg,I);
    not(Q_neg[0],Q_0);
    not(Q_neg[1],Q_1);

//Conexiones Caso I
    //ANDs
    and(Q_0S_neg,Q_0,S_neg);
    and(Q_0I_neg,Q_0,I_neg);
    and(Q_1S_neg,Q_1,S_neg);
    and(Q_1I_neg,Q_1,I_neg);
    and(S_negI_neg,I_neg,S_neg);

    //ORs
    or(E[1],Q_0S_neg,Q_0I_neg,S_negI_neg);
    or(E[0],Q_1S_neg,Q_1I_neg,S_negI_neg);

//Conexiones Caso II
    xnor(Q_0xorQ_1,Q_0,Q_1);
    and(Eclock,I,S_neg,Q_0xorQ_1);
    flip_flop_T FF_T(Eclock,rst,I,Q_T);

    not(Q_T_neg,Q_T);


//Conexión general
    mux1 mux1_1(Eclock,Q_T,E[1],D[1]);
    mux1 mux1_2(Eclock,Q_T_neg,E[0],D[0]);

    flip_flop_D FFD_0(clk,rst,D[0],Q_0);
    flip_flop_D FFD_1(clk,rst,D[1],Q_1);


endmodule


//This is where the flip-flop D starts
module flip_flop_D(Clock,Reset,D,Q);
    input D, Clock, Reset;
    output reg Q;
    always @(posedge Reset, posedge Clock)
        if (Reset == 1)
            Q <= 0;
        else
            Q <= D;
endmodule

//This is where the flip-flop T starts
module flip_flop_T(Clock,Reset,T,Q);
    input T, Clock, Reset;
    output reg Q=0;


    always @(posedge Clock) begin
        if (T)
                Q <= ~Q;
        end
endmodule


module mux1(select,in1,in2,d);

input select,in1,in2;
output reg d;

    always @(in1,in2) begin
        if (select == 1)
            d=in1;
        else
            d=in2;
        end


endmodule
