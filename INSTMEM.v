module INSTMEM(Addr,Inst);//Ö¸Áî´æ´¢Æ÷
input[31:0]Addr;
//input InsMemRW;//×´Ì¬Îª'0'£¬Ð´Ö¸Áî¼Ä´æÆ÷£¬·ñÔòÎª¶ÁÖ¸Áî¼Ä´æÆ÷
output[31:0]Inst;
wire[32:0]Rom[31:0];
assign Rom[8'h00]=32'h3C010003;//lui $1,3 $1=3
//assign Rom[8'h00]=32'h20010008;//addi $1,$0,8 $1=8
assign Rom[8'h01]=32'h3402000C;//ori $2,$0,12 $2=12
assign Rom[8'h02]=32'h00221820;//add $3,$1,$2 $3=20
assign Rom[8'h03]=32'h00412022;//sub $4,$2,$1 $4=4
assign Rom[8'h04]=32'h00222824;//and $5,$1,$2
assign Rom[8'h05]=32'h00223025;//or $6,$1,$2
assign Rom[8'h06]=32'h14220002;//bne $1,$2,2
assign Rom[8'h07]=32'hXXXXXXXX;
assign Rom[8'h08]=32'hXXXXXXXX;
assign Rom[8'h09]=32'h10220002;// beq $1,$2,2
assign Rom[8'h0A]=32'h0800000D;// J 0D 
assign Rom[8'h0B]=32'hXXXXXXXX;
assign Rom[8'h0C]=32'hXXXXXXXX;
assign Rom[8'h0D]=32'hAD02000A;// sw $2 10($8) memory[$8+10]=12
assign Rom[8'h0E]=32'h8D04000A;//lw $4 10($8) $4=12
assign Rom[8'h0F]=32'h10440003;//beq $2,$4,3
assign Rom[8'h10]=32'hXXXXXXXX;
assign Rom[8'h11]=32'hXXXXXXXX;
assign Rom[8'h12]=32'hXXXXXXXX;
assign Rom[8'h13]=32'h30470009;//andi $2,9,$7
assign Rom[8'h14]=32'hXXXXXXXX;
assign Rom[8'h15]=32'hXXXXXXXX;
assign Rom[8'h16]=32'hXXXXXXXX;
assign Rom[8'h17]=32'hXXXXXXXX;
assign Rom[8'h18]=32'hXXXXXXXX;
assign Rom[8'h19]=32'hXXXXXXXX;
assign Rom[8'h1A]=32'hXXXXXXXX;
assign Rom[8'h1B]=32'hXXXXXXXX;
assign Rom[8'h1C]=32'hXXXXXXXX;
assign Rom[8'h1D]=32'hXXXXXXXX;
assign Rom[8'h1E]=32'hXXXXXXXX;
assign Rom[8'h1F]=32'hXXXXXXXX;
assign Inst=Rom[Addr>>2];
endmodule