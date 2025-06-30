`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: inQbe
// Engineer: Muhammed Sinan & Shamil CA 
// 
// Create Date: 30.06.2025 13:54:51
// Design Name: TB pwm generation 
// Module Name: pwm_gen_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//          Duty cycle = (ccr + 1/ arr+1 )  X 100
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pwm_gen_TB;
    reg reset;
     reg clk;
     reg [7:0]ccr;
     reg [7:0]arr;
    wire pwm;
    
    pwm_gen dut(
        .reset(reset),
            .clk(clk),
            .ccr(ccr),
            .arr(arr),
            .pwm(pwm)
                );
    initial clk = 0 ;
    always
    #5 clk = ~clk; 
    initial begin
    reset = 1'b0;
    ccr = 8'd4;
    arr = 8'd5;
    #1500
    reset = 1;
    #10
    reset = 0 ;
    #1500
    $finish;
    end     
