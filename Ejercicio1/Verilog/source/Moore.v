
module Moore(clk,rst,I,S,Q_1,Q_0);

    input clk,rst,I,S;
    output Q_1,Q_0;
    wire [1:0] Q,Q_sig,E;
    wire Q_T,Q_T_sig;
    
    assign Q_1=Q_sig[1];
    assign Q_0=Q_sig[0];
    
//Intermedian wires
    wire S_neg,I_neg,Q_0S_neg,Q_0I_neg,Q_1S_neg,Q_1I_neg,S_negI_neg,Q_0xorQ_1,Eclock;
    wire [1:0] Q_sig_neg;
    wire Q_T_sig_neg;
//Conections
    not(S_neg,S);
    not(I_neg,I);
    not(Q_sig_neg[0],Q_sig[0]);
    not(Q_sig_neg[1],Q_sig[1]);

//Conexiones Caso I
    //ANDs
    and(Q_0S_neg,Q_sig[0],S_neg);
    and(Q_0I_neg,Q_sig[0],I_neg);
    and(Q_1S_neg,Q_sig[1],S_neg);
    and(Q_1I_neg,Q_sig[1],I_neg);
    and(S_negI_neg,I_neg,S_neg);

    //ORs
    or(E[1],Q_0S_neg,Q_0I_neg,S_negI_neg);
    or(E[0],Q_1S_neg,Q_1I_neg,S_negI_neg);

//Conexiones Caso II
    xnor(Q_0xorQ_1,Q_sig[0],Q_sig[1]);
    and(Eclock,I,S_neg,Q_0xorQ_1);
    flip_flop_T FF_T(Eclock,rst,Q_T,Q_Tsig);

    not(Q_T_sig_neg,Q_T_sig);


//Conexión general
    mux1 mux1_1(Eclock,Q_Tsig,E[1],Q[0]);
    mux1 mux1_2(Eclock,Q_T_sig_neg,E[0],Q[1]);

    flip_flop_D FFD_0(clk,rst,Q[0],Q_sig[0]);
    flip_flop_D FFD_1(clk,rst,Q[1],Q_sig[1]);


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
    output reg Q;
    always @(posedge Reset, posedge Clock) begin
        if (Reset == 1)
            Q <= 0;
        else
            if (T)
                Q <= ~Q;
            else
                Q <= Q;
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
