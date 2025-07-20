module tsc_tb;

  reg clk;
  reg x, clear;
  wire [1:0] hwy, cntry;

  TSC dut (.x(x), .clear(clear), .clk(clk), .hwy(hwy), .cntry(cntry));

  always #5 clk = ~clk;

  initial begin
    $dumpfile("TSC.vcd");
    $dumpvars(1);

    clk = 0; clear = 1; x = 0;

    #10 clear = 0;
    #20 x = 1;
    #40 x = 0;
    #60 x = 1;
    #40 x = 0;

    #100 $finish;
  end

  always @(posedge clk) begin
    $display("Time=%0t | x=%b | hwy=%b | cntry=%b", $time, x, hwy, cntry);
  end

endmodule
