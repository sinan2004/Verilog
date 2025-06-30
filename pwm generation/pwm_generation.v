timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: inQbe
// Engineer: Muhammed Sinan .N  & Shamil CA 
// 
// Create Date: 30.06.2025 13:31:14
// Design Name: pwm generation V 1
// Module Name: pwm_gen
// Project Name: PWM GENERATION 
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


module pwm_gen(
    input reset, 
    input clk,
    input [7:0]ccr,
    input [7:0]arr,
    output reg pwm
    );
    reg [7:0]counter = 8'b0;
   
    always @ (posedge clk)
    begin
        if(~reset)begin
            counter = counter + 1;
          
            
            if (counter <= arr)begin    //if 1
                if(counter <=  ccr)begin //if 2
                    pwm = 1'b1;
                end else begin                  //else 1
                pwm = 1'b0;
                end
            end else begin 
            pwm = 1'b1;                 //else 2
            counter = 0;
             end
         
        end else begin 
            counter = 8'b0;
           
        end 
    end                         
endmodule
