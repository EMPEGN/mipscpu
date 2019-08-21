`timescale 1ns / 1ns
module pcreg(
    input clk,  //1 位输入，寄存器时钟信号，下降沿时为 PC 寄存器赋值
    input rst,  //1 位输入，异步重置信号，高电平时将 PC 寄存器清零
                //注：当 ena 信号无效时，rst 也可以重置寄存器
    input ena,  //1 位输入,有效信号高电平时 PC 寄存器读入 data_in的值，否则保持原有输出
    input [31:0] data_in,       //32 位输入，输入数据将被存入寄存器内部
    output [31:0] data_out  //32 位输出，工作时始终输出 PC寄存器内部存储的值
    );
    D_FF D0 (clk,data_in[0],ena,rst,data_out[0]);
    D_FF D1 (clk,data_in[1],ena,rst,data_out[1]);
    D_FF D2 (clk,data_in[2],ena,rst,data_out[2]);
    D_FF D3 (clk,data_in[3],ena,rst,data_out[3]);
    D_FF D4 (clk,data_in[4],ena,rst,data_out[4]);
    D_FF D5 (clk,data_in[5],ena,rst,data_out[5]);
    D_FF D6 (clk,data_in[6],ena,rst,data_out[6]);
    D_FF D7 (clk,data_in[7],ena,rst,data_out[7]);
    D_FF D8 (clk,data_in[8],ena,rst,data_out[8]);
    D_FF D9 (clk,data_in[9],ena,rst,data_out[9]);
    D_FF D10 (clk,data_in[10],ena,rst,data_out[10]);
    D_FF D11 (clk,data_in[11],ena,rst,data_out[11]);
    D_FF D12 (clk,data_in[12],ena,rst,data_out[12]);
    D_FF D13 (clk,data_in[13],ena,rst,data_out[13]);
    D_FF D14 (clk,data_in[14],ena,rst,data_out[14]);
    D_FF D15 (clk,data_in[15],ena,rst,data_out[15]);
    D_FF D16 (clk,data_in[16],ena,rst,data_out[16]);
    D_FF D17 (clk,data_in[17],ena,rst,data_out[17]);
    D_FF D18 (clk,data_in[18],ena,rst,data_out[18]);
    D_FF D19 (clk,data_in[19],ena,rst,data_out[19]);
    D_FF D20 (clk,data_in[20],ena,rst,data_out[20]);
    D_FF D21 (clk,data_in[21],ena,rst,data_out[21]);
    //D_FF1 D22 (clk,data_in[22],ena,rst,data_out[22]);     //以00400000为基地址
    D_FF D22 (clk,data_in[22],ena,rst,data_out[22]);        //以00000000为基地址
    D_FF D23 (clk,data_in[23],ena,rst,data_out[23]);
    D_FF D24 (clk,data_in[24],ena,rst,data_out[24]);
    D_FF D25 (clk,data_in[25],ena,rst,data_out[25]);
    D_FF D26 (clk,data_in[26],ena,rst,data_out[26]);
    D_FF D27 (clk,data_in[27],ena,rst,data_out[27]);
    D_FF D28 (clk,data_in[28],ena,rst,data_out[28]);
    D_FF D29 (clk,data_in[29],ena,rst,data_out[29]);
    D_FF D30 (clk,data_in[30],ena,rst,data_out[30]);
    D_FF D31 (clk,data_in[31],ena,rst,data_out[31]);   
endmodule
 
module D_FF1(
    input CLK,      //时钟信号，下降沿有效
    input D,        //输入信号 D
    input ENA,
    input RST_n,    //复位信号，高电平有效
    output reg Q1  //输出信号 Q
    );
    
    always @(posedge RST_n or posedge CLK)
    begin
      if(RST_n==1)
        Q1 <= 1;
      else
        begin
        if(ENA==1)
          Q1 <= D;
        end
    end
endmodule
