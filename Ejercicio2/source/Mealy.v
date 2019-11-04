module mealy(clk,rst,in,out);

    input clk,rst,in;
    output out;
    wire [1:0] Y,y;
//Intermedian wires
    wire in_neg,a,b,c,d;
    wire [1:0] y_neg;
//Conections
    flip_flop ffd1(clk,rst,Y[0],y[0]);
    flip_flop ffd2(clk,rst,Y[1],y[1]);
    not(in_neg,in);
    not(y_neg[0],y[0]);
    not(y_neg[1],y[1]);
    //Y1
    and(a,y_neg[0],y_neg[1],in);
    and(b,y_neg[0],y[1],in_neg);
    or(Y[0],a,b);
    //Y2
    and(c,y_neg[0],y[1],in_neg);
    and(d,y[0],y_neg[1],in);
    or(Y[1],c,d);
    //Out
    and(out,y[0],y[1],in);
endmodule

//This is where the flip-flop D stars
module flip_flop(Clock,Reset,D,Q);
    input D, Clock, Reset;
    output reg Q;
    always @(posedge Reset, posedge Clock)
        if (Reset == 1)
            Q <= 0;
        else
            Q <= D;
endmodule