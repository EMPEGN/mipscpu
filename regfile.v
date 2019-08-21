`timescale 1ns / 1ns
module regfile(
    input clk, //寄存器组时钟信号，下降沿写入数据
    input rst, //reset 信号，异步复位，高电平时全部寄存器置零
    input we, //寄存器读写有效信号，高电平时允许寄存器写入数据，低电平时允许寄存器读出数据
    input ov,
    input [4:0] raddr1, //所需读取的寄存器的地址
    input [4:0] raddr2, //所需读取的寄存器的地址
    input [4:0] waddr, //写寄存器的地址
    input [31:0] wdata, //写寄存器数据，数据在 clk 下降沿时被写入
    //output [31:0] rdata0,
    output [31:0] rdata1, //raddr1 所对应寄存器的输出数据
    output [31:0] rdata2, //raddr2 所对应寄存器的输出数据
    output [31:0] rdata3,
    output [31:0] rdata4,
    output [31:0] rdata5,
    output [31:0] rdata6
    /*output [31:0] regtest1;
    output [31:0] regtest2;
    output [31:0] regtest3;
    output [31:0] regtest4;*/
    
    );
    wire [31:0] switch;
    wire [31:0] array_reg [31:0];
    reg c_o;
    always@(ov)
    begin
    case(ov)
    1'bz:c_o = 1;
    1'b1:c_o = 0;
    1'b0:c_o = 1;
    default:c_o=1;
    endcase
    end
    Decoder dec (waddr,we&c_o,switch);
    assign array_reg[0] = 0;
    Pcreg Reg2 (clk,rst,switch[1],wdata,array_reg[1]);
    Pcreg Reg3 (clk,rst,switch[2],wdata,array_reg[2]);
    Pcreg Reg4 (clk,rst,switch[3],wdata,array_reg[3]);
    Pcreg Reg5 (clk,rst,switch[4],wdata,array_reg[4]);
    Pcreg Reg6 (clk,rst,switch[5],wdata,array_reg[5]);
    Pcreg Reg7 (clk,rst,switch[6],wdata,array_reg[6]);
    Pcreg Reg8 (clk,rst,switch[7],wdata,array_reg[7]);
    Pcreg Reg9 (clk,rst,switch[8],wdata,array_reg[8]);
    Pcreg Reg10 (clk,rst,switch[9],wdata,array_reg[9]);
    Pcreg Reg11 (clk,rst,switch[10],wdata,array_reg[10]);
    Pcreg Reg12 (clk,rst,switch[11],wdata,array_reg[11]);
    Pcreg Reg13 (clk,rst,switch[12],wdata,array_reg[12]);
    Pcreg Reg14 (clk,rst,switch[13],wdata,array_reg[13]);
    Pcreg Reg15 (clk,rst,switch[14],wdata,array_reg[14]);
    Pcreg Reg16 (clk,rst,switch[15],wdata,array_reg[15]);
    Pcreg Reg17 (clk,rst,switch[16],wdata,array_reg[16]);
    Pcreg Reg18 (clk,rst,switch[17],wdata,array_reg[17]);
    Pcreg Reg19 (clk,rst,switch[18],wdata,array_reg[18]);
    Pcreg Reg20 (clk,rst,switch[19],wdata,array_reg[19]);
    Pcreg Reg21 (clk,rst,switch[20],wdata,array_reg[20]);
    Pcreg Reg22 (clk,rst,switch[21],wdata,array_reg[21]);
    Pcreg Reg23 (clk,rst,switch[22],wdata,array_reg[22]);
    Pcreg Reg24 (clk,rst,switch[23],wdata,array_reg[23]);
    Pcreg Reg25 (clk,rst,switch[24],wdata,array_reg[24]);
    Pcreg Reg26 (clk,rst,switch[25],wdata,array_reg[25]);
    Pcreg Reg27 (clk,rst,switch[26],wdata,array_reg[26]);
    Pcreg Reg28 (clk,rst,switch[27],wdata,array_reg[27]);
    Pcreg Reg29 (clk,rst,switch[28],wdata,array_reg[28]);
    Pcreg Reg30 (clk,rst,switch[29],wdata,array_reg[29]);
    Pcreg Reg31 (clk,rst,switch[30],wdata,array_reg[30]);
    Pcreg Reg32 (clk,rst,switch[31],wdata,array_reg[31]);
    //assign rdata0 = array_reg[0];
    assign rdata1 = array_reg[1];
    assign rdata2 = array_reg[2];
    assign rdata3 = array_reg[3];
    assign rdata4 = array_reg[4];
    assign rdata5 = array_reg[5];
    assign rdata6 = array_reg[6];
    //assign regtest1=
endmodule
 
module Decoder(
    input [4:0] iData,      
    input  iEna,            
    output [31:0] oData      
    );        
    assign oData=(iEna==1)?(32'b00000000000000000000000000000001<<iData):32'bx;
endmodule
 
module Pcreg(
    input clk,  //1 位输入，寄存器时钟信号，下降沿时为 PC 寄存器赋值
    input rst,  //1 位输入，异步重置信号，高电平时将 PC 寄存器清零
                //注：当 ena 信号无效时，rst 也可以重置寄存器
    input ena,  //1 位输入,有效信号高电平时 PC 寄存器读入 data_in的值，否则保持原有输出
    input [31:0] data_in,       //32 位输入，输入数据将被存入寄存器内部
    output [31:0] data_out  //32 位输出，工作时始终输出 PC寄存器内部存储的值
    );
    
    D_FF d0 (clk,data_in[0],ena,rst,data_out[0]);
    D_FF d1 (clk,data_in[1],ena,rst,data_out[1]);
    D_FF d2 (clk,data_in[2],ena,rst,data_out[2]);
    D_FF d3 (clk,data_in[3],ena,rst,data_out[3]);
    D_FF d4 (clk,data_in[4],ena,rst,data_out[4]);
    D_FF d5 (clk,data_in[5],ena,rst,data_out[5]);
    D_FF d6 (clk,data_in[6],ena,rst,data_out[6]);
    D_FF d7 (clk,data_in[7],ena,rst,data_out[7]);
    D_FF d8 (clk,data_in[8],ena,rst,data_out[8]);
    D_FF d9 (clk,data_in[9],ena,rst,data_out[9]);
    D_FF d10 (clk,data_in[10],ena,rst,data_out[10]);
    D_FF d11 (clk,data_in[11],ena,rst,data_out[11]);
    D_FF d12 (clk,data_in[12],ena,rst,data_out[12]);
    D_FF d13 (clk,data_in[13],ena,rst,data_out[13]);
    D_FF d14 (clk,data_in[14],ena,rst,data_out[14]);
    D_FF d15 (clk,data_in[15],ena,rst,data_out[15]);
    D_FF d16 (clk,data_in[16],ena,rst,data_out[16]);
    D_FF d17 (clk,data_in[17],ena,rst,data_out[17]);
    D_FF d18 (clk,data_in[18],ena,rst,data_out[18]);
    D_FF d19 (clk,data_in[19],ena,rst,data_out[19]);
    D_FF d20 (clk,data_in[20],ena,rst,data_out[20]);
    D_FF d21 (clk,data_in[21],ena,rst,data_out[21]);
    D_FF d22 (clk,data_in[22],ena,rst,data_out[22]);
    D_FF d23 (clk,data_in[23],ena,rst,data_out[23]);
    D_FF d24 (clk,data_in[24],ena,rst,data_out[24]);
    D_FF d25 (clk,data_in[25],ena,rst,data_out[25]);
    D_FF d26 (clk,data_in[26],ena,rst,data_out[26]);
    D_FF d27 (clk,data_in[27],ena,rst,data_out[27]);
    D_FF d28 (clk,data_in[28],ena,rst,data_out[28]);
    D_FF d29 (clk,data_in[29],ena,rst,data_out[29]);
    D_FF d30 (clk,data_in[30],ena,rst,data_out[30]);
    D_FF d31 (clk,data_in[31],ena,rst,data_out[31]);   
endmodule
 
module D_FF(
    input CLK,      //时钟信号，下降沿有效
    input D,        //输入信号 D
    input ENA,
    input RST_n,    //复位信号，高电平有效
    output reg Q1  //输出信号 Q1
    );
    
    always @(posedge RST_n or posedge CLK)
    begin
      if(RST_n==1)
        Q1 = 0;
      else
      begin
      if(ENA==1)
        Q1 = D;
      end
    end
endmodule
