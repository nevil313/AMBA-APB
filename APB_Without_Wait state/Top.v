`timescale 1ns / 1ps

module APB_top(
input clk,resetn,wr,newd,
input [3:0]addrin,
input [7:0]din,
output [7:0]dout
    );
    
wire psel,penable,pready,pwrite;
wire [3:0]paddr;
wire [7:0]prdata,pwdata;

apb_master a(
.PCLK(clk),
.Presetn(resetn),
.wr(wr),
.new_data(newd),
.Pready(pready),//1-bit information
.Pdatain(din),
.PRdata(prdata),//vector information
.PWaddress(addrin),
.Psel(psel),
.Penable(penable),
.Pwrite(pwrite),
.Paddress(paddr),
.PWdata(pwdata),
.Pdataout(dout)
);


apb_slave b(
.PCLK(clk),
.Presetn(resetn),
.Penable(penable),
.Psel(psel),
.Pwrite(pwrite),
.Paddress(paddr),
.Pwdata(pwdata),
.Pready(pready),
.PRdata(prdata)
);
endmodule
