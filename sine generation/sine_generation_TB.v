`timescale 0.1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: inQbe
// Engineer: Muhammed Sinan N
// 
// Create Date: 01.07.2025 10:18:52
// Design Name: sine generation V 1
// Module Name: sine_generator_TB
// Project Name: Sine Generator 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sine_generator_TB;
    reg clk;
    reg reset;
    wire pwm;
    wire [7:0]sin_reg;
    wire [7:0]update_c;
    
sine_generator dut(
                    .clk(clk),
                    .reset(reset),
                    .pwm(pwm),
                    .sin_reg(sin_reg),
                    .update_c(update_c)
                    );
                    
initial clk = 0;
always
#5 clk = ~clk;
initial begin
reset = 1'b0;
#30000
$finish;
end

endmodule
