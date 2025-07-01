`timescale 10ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: inQbe
// Engineer: Muhammed Sinan N  & Shamil CA 
// 
// Create Date: 30.06.2025 17:06:00
// Design Name: Sine generator 
// Module Name: sine_generator
// Project Name: Sine generation using pwm 
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


module sine_generator(
    input clk,
    input reset,
    output reg pwm,
    output reg [7:0]sin_reg, //sin_reg for viewing result 
    output reg [7:0]update_c //update_c for viewing result 
   
    );
    wire [7:0]arr;
    reg[7:0]ccr;
    reg[7:0] sin_table[0:255];
    reg [7:0]address;
    reg [7:0]counter ; 
    assign arr = 8'b101;
    initial begin
    address = 1'b0;
    ccr = 1'b0;
    
    sin_table[0] = 8'd50; sin_table[1] = 8'd51; sin_table[2] = 8'd52; sin_table[3] = 8'd54;
    sin_table[4] = 8'd55; sin_table[5] = 8'd56; sin_table[6] = 8'd57; sin_table[7] = 8'd59;
    sin_table[8] = 8'd60; sin_table[9] = 8'd61; sin_table[10] = 8'd62; sin_table[11] = 8'd63;
    sin_table[12] = 8'd65; sin_table[13] = 8'd66; sin_table[14] = 8'd67; sin_table[15] = 8'd68;
    sin_table[16] = 8'd69; sin_table[17] = 8'd70; sin_table[18] = 8'd71; sin_table[19] = 8'd73;
    sin_table[20] = 8'd74; sin_table[21] = 8'd75; sin_table[22] = 8'd76; sin_table[23] = 8'd77;
    sin_table[24] = 8'd78; sin_table[25] = 8'd79; sin_table[26] = 8'd80; sin_table[27] = 8'd81;
    sin_table[28] = 8'd82; sin_table[29] = 8'd83; sin_table[30] = 8'd84; sin_table[31] = 8'd85;
    sin_table[32] = 8'd85; sin_table[33] = 8'd86; sin_table[34] = 8'd87; sin_table[35] = 8'd88;
    sin_table[36] = 8'd89; sin_table[37] = 8'd90; sin_table[38] = 8'd90; sin_table[39] = 8'd91;
    sin_table[40] = 8'd92; sin_table[41] = 8'd92; sin_table[42] = 8'd93; sin_table[43] = 8'd94;
    sin_table[44] = 8'd94; sin_table[45] = 8'd95; sin_table[46] = 8'd95; sin_table[47] = 8'd96;
    sin_table[48] = 8'd96; sin_table[49] = 8'd97; sin_table[50] = 8'd97; sin_table[51] = 8'd98;
    sin_table[52] = 8'd98; sin_table[53] = 8'd98; sin_table[54] = 8'd99; sin_table[55] = 8'd99;
    sin_table[56] = 8'd99; sin_table[57] = 8'd99; sin_table[58] = 8'd99; sin_table[59] = 8'd100;
    sin_table[60] = 8'd100; sin_table[61] = 8'd100; sin_table[62] = 8'd100; sin_table[63] = 8'd100;
    sin_table[64] = 8'd100; sin_table[65] = 8'd100; sin_table[66] = 8'd100; sin_table[67] = 8'd100;
    sin_table[68] = 8'd100; sin_table[69] = 8'd100; sin_table[70] = 8'd99; sin_table[71] = 8'd99;
    sin_table[72] = 8'd99; sin_table[73] = 8'd99; sin_table[74] = 8'd98; sin_table[75] = 8'd98;
    sin_table[76] = 8'd98; sin_table[77] = 8'd97; sin_table[78] = 8'd97; sin_table[79] = 8'd97;
    sin_table[80] = 8'd96; sin_table[81] = 8'd96; sin_table[82] = 8'd95; sin_table[83] = 8'd94;
    sin_table[84] = 8'd94; sin_table[85] = 8'd93; sin_table[86] = 8'd93; sin_table[87] = 8'd92;
    sin_table[88] = 8'd91; sin_table[89] = 8'd91; sin_table[90] = 8'd90; sin_table[91] = 8'd89;
    sin_table[92] = 8'd88; sin_table[93] = 8'd88; sin_table[94] = 8'd87; sin_table[95] = 8'd86;
    sin_table[96] = 8'd85; sin_table[97] = 8'd84; sin_table[98] = 8'd83; sin_table[99] = 8'd82;
    sin_table[100] = 8'd81; sin_table[101] = 8'd80; sin_table[102] = 8'd79; sin_table[103] = 8'd78;
    sin_table[104] = 8'd77; sin_table[105] = 8'd76; sin_table[106] = 8'd75; sin_table[107] = 8'd74;
    sin_table[108] = 8'd73; sin_table[109] = 8'd72; sin_table[110] = 8'd71; sin_table[111] = 8'd70;
    sin_table[112] = 8'd69; sin_table[113] = 8'd67; sin_table[114] = 8'd66; sin_table[115] = 8'd65;
    sin_table[116] = 8'd64; sin_table[117] = 8'd63; sin_table[118] = 8'd62; sin_table[119] = 8'd60;
    sin_table[120] = 8'd59; sin_table[121] = 8'd58; sin_table[122] = 8'd57; sin_table[123] = 8'd56;
    sin_table[124] = 8'd54; sin_table[125] = 8'd53; sin_table[126] = 8'd52; sin_table[127] = 8'd51;
    sin_table[128] = 8'd49; sin_table[129] = 8'd48; sin_table[130] = 8'd47; sin_table[131] = 8'd46;
    sin_table[132] = 8'd44; sin_table[133] = 8'd43; sin_table[134] = 8'd42; sin_table[135] = 8'd41;
    sin_table[136] = 8'd40; sin_table[137] = 8'd38; sin_table[138] = 8'd37; sin_table[139] = 8'd36;
    sin_table[140] = 8'd35; sin_table[141] = 8'd34; sin_table[142] = 8'd33; sin_table[143] = 8'd31;
    sin_table[144] = 8'd30; sin_table[145] = 8'd29; sin_table[146] = 8'd28; sin_table[147] = 8'd27;
    sin_table[148] = 8'd26; sin_table[149] = 8'd25; sin_table[150] = 8'd24; sin_table[151] = 8'd23;
    sin_table[152] = 8'd22; sin_table[153] = 8'd21; sin_table[154] = 8'd20; sin_table[155] = 8'd19;
    sin_table[156] = 8'd18; sin_table[157] = 8'd17; sin_table[158] = 8'd16; sin_table[159] = 8'd15;
    sin_table[160] = 8'd14; sin_table[161] = 8'd13; sin_table[162] = 8'd12; sin_table[163] = 8'd12;
    sin_table[164] = 8'd11; sin_table[165] = 8'd10; sin_table[166] = 8'd9; sin_table[167] = 8'd9;
    sin_table[168] = 8'd8; sin_table[169] = 8'd7; sin_table[170] = 8'd7; sin_table[171] = 8'd6;
    sin_table[172] = 8'd6; sin_table[173] = 8'd5; sin_table[174] = 8'd4; sin_table[175] = 8'd4;
    sin_table[176] = 8'd3; sin_table[177] = 8'd3; sin_table[178] = 8'd3; sin_table[179] = 8'd2;
    sin_table[180] = 8'd2; sin_table[181] = 8'd2; sin_table[182] = 8'd1; sin_table[183] = 8'd1;
    sin_table[184] = 8'd1; sin_table[185] = 8'd1; sin_table[186] = 8'd0; sin_table[187] = 8'd0;
    sin_table[188] = 8'd0; sin_table[189] = 8'd0; sin_table[190] = 8'd0; sin_table[191] = 8'd0;
    sin_table[192] = 8'd0; sin_table[193] = 8'd0; sin_table[194] = 8'd0; sin_table[195] = 8'd0;
    sin_table[196] = 8'd0; sin_table[197] = 8'd1; sin_table[198] = 8'd1; sin_table[199] = 8'd1;
    sin_table[200] = 8'd1; sin_table[201] = 8'd1; sin_table[202] = 8'd2; sin_table[203] = 8'd2;
    sin_table[204] = 8'd2; sin_table[205] = 8'd3; sin_table[206] = 8'd3; sin_table[207] = 8'd4;
    sin_table[208] = 8'd4; sin_table[209] = 8'd5; sin_table[210] = 8'd5; sin_table[211] = 8'd6;
    sin_table[212] = 8'd6; sin_table[213] = 8'd7; sin_table[214] = 8'd8; sin_table[215] = 8'd8;
    sin_table[216] = 8'd9; sin_table[217] = 8'd10; sin_table[218] = 8'd10; sin_table[219] = 8'd11;
    sin_table[220] = 8'd12; sin_table[221] = 8'd13; sin_table[222] = 8'd14; sin_table[223] = 8'd15;
    sin_table[224] = 8'd15; sin_table[225] = 8'd16; sin_table[226] = 8'd17; sin_table[227] = 8'd18;
    sin_table[228] = 8'd19; sin_table[229] = 8'd20; sin_table[230] = 8'd21; sin_table[231] = 8'd22;
    sin_table[232] = 8'd23; sin_table[233] = 8'd24; sin_table[234] = 8'd25; sin_table[235] = 8'd26;
    sin_table[236] = 8'd27; sin_table[237] = 8'd29; sin_table[238] = 8'd30; sin_table[239] = 8'd31;
    sin_table[240] = 8'd32; sin_table[241] = 8'd33; sin_table[242] = 8'd34; sin_table[243] = 8'd35;
    sin_table[244] = 8'd37; sin_table[245] = 8'd38; sin_table[246] = 8'd39; sin_table[247] = 8'd40;
    sin_table[248] = 8'd41; sin_table[249] = 8'd43; sin_table[250] = 8'd44; sin_table[251] = 8'd45;
    sin_table[252] = 8'd46; sin_table[253] = 8'd48; sin_table[254] = 8'd49; sin_table[255] = 8'd50;
end

    always @ (posedge clk)
    begin
        if(~reset)begin
            
            ccr = sin_table[address];
            sin_reg = ccr;
            address = address +1'b1;
            counter = counter + 1'b1;
            update_c = counter;

          
            
            if (counter <= arr)begin    //if 1
                if(counter <=  ccr)begin //if 2
                    pwm = 1'b1;
                end else begin                  //else 1
                pwm = 1'b0;
                end
            end else begin 
            pwm = 1'b0;                 //else 2
            counter = 0;
             end
         
        end else begin 
            counter = 8'b0;
            address = 1'b0;
           
        end 
    end   

    
   
endmodule
