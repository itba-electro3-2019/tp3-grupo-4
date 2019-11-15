`timescale 1ms / 1ms

module main;
    wire I,S,Clock,Reset,Q_1,Q_0;
//Generators
    clock_gen clk(Clock);
    gen_signal signal(I,S);
    reset_gen res(Reset);

    Moore state_machine(Clock,Reset,I,S,Q_1,Q_0);

//Begin simulation
    initial begin
        #16
        $finish;
    end

//Seting path to get data for visualization of simulation
    reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";
    initial begin
        dummy= $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,main);
    end

endmodule