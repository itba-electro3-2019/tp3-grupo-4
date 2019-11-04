`timescale 1ms / 1ms

module main;
    wire Signal,Clock,Reset,Output;
//Generators
    clock_gen clk(Clock);
    gen_signal signal(Signal);
    reset_gen res(Reset);
    mealy state_machine(Clock,Reset,Signal,Output);
//Begin simulation
    initial begin
        #15
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