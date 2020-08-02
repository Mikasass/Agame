`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 13:47:01
// Design Name: 
// Module Name: testbench
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


module testbench();
// constants                                           
// general purpose registers
// test vector input registers
reg clk;
reg [7:0] data;
reg rst_n;
// wires                                               
wire [15:0]  crc;

// assign statements (if any)                          
crc i1 (
// port map - connection between master ports and signals/registers   
	.clk(clk),
	.crc(crc),
	.data(data),
	.rst_n(rst_n)
);

initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
clk=0;
rst_n=0;
data=8'b1011_0110;                                                       
// --> end                                                                    
end
                                                    
always #10 clk=~clk;                                                
// optional sensitivity list                           
// @(event1 or event2 or .... eventn)                  

initial
begin                                                  
// code executes for every event on sensitivity list   
// insert code here --> begin                          
#30 rst_n=1;
#1000 rst_n=0;
#30 rst_n=1;
#1000 rst_n=0;
#30 rst_n=1; 
#1000 rst_n=0;
#30 rst_n=1;
#1000 rst_n=0;
#30 rst_n=1; 
#1000 rst_n=0;
#30 rst_n=1; 
#1000 rst_n=0;
#30 rst_n=1;                                                                                              
// --> end                                             
end

initial
begin
#1030 data=8'b0100_1100;
#1030 data=8'b1011_0011;
#1030 data=8'b1001_0010;
#1030 data=8'b0011_0110;
#1030 data=8'b1010_0101;
#1030 data=8'b0111_0111;
end   
                                                 
endmodule