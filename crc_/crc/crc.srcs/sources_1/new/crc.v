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

input [7:0] data;					//��ҪУ�������
input clk;							//ʱ���ź�
input rst_n;						//��У��������/�л�У������

output reg [7:0]crc=0;			//CRCУ���루FCS��

wire [15:0]stemp; 				//data����8λ��ͨ��ƴ��ֵʵ�֣�
reg [15:0]temp=0;					//stempֵ�Ĵ���
parameter polynomial=17'b1_0000_0111;
//���ɶ���ʽΪg(x)=X^8+X^2+X+1��CRC-8��

assign stemp={data,8'b00000000};

always @(posedge clk or negedge rst_n)
begin 
	if(!rst_n)						//��rst_nΪ�͵�ƽʱ��crc�첽���㣬��stemp��ֵ��temp
	begin
		crc<=0;
		temp<=stemp; 
	end
	else 								//��rst_nΪ�ߵ�ƽʱ������ģ������
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
			crc<=temp[7:0];     //��temp�ĸ�8λ��Ϊ0�����crc��temp�ĵ�16λ��
	end
end  

endmodule
