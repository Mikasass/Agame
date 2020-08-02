`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 23:12:18
// Design Name: 
// Module Name: crc
// Project Name: 
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


module crc(clk,data,rst_n,crc);

input [7:0] data;					//需要校验的数据
input clk;							//时钟信号
input rst_n;						//将校验码置零/切换校验数据

output reg [7:0]crc=0;			//CRC校验码（FCS）

wire [15:0]stemp; 				//data左移8位（通过拼接值实现）
reg [15:0]temp=0;					//stemp值寄存器
parameter polynomial=17'b1_0000_0111;
//生成多项式为g(x)=X^8+X^2+X+1（CRC-8）

assign stemp={data,8'b00000000};

always @(posedge clk or negedge rst_n)
begin 
	if(!rst_n)						//当rst_n为低电平时，crc异步清零，将stemp赋值给temp
	begin
		crc<=0;
		temp<=stemp; 
	end
	else 								//当rst_n为高电平时，进行模二运算
	begin
		if(temp[15]) 
			temp[15:7]<=temp[15:7]^polynomial;
		else if(temp[14]) 
			temp[14:6]<=temp[14:6]^polynomial;
		else if(temp[13]) 
			temp[13:5]<=temp[13:5]^polynomial;
		else if(temp[12]) 
			temp[12:4]<=temp[12:4]^polynomial;
		else if(temp[11]) 
			temp[11:3]<=temp[11:3]^polynomial;
		else if(temp[10]) 
			temp[10:2]<=temp[10:2]^polynomial;
		else if(temp[9]) 
			temp[9:1]<=temp[9:1]^polynomial;
		else if(temp[8]) 
			temp[8:0]<=temp[8:0]^polynomial;
		else   
			crc<=temp[7:0];     //当temp的高8位都为0后，输出crc（temp的低16位）
	end
end  

endmodule
