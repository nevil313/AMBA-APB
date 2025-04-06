`timescale 1ns / 1ps

module top_apb(
input pclk,Presetn,wr,new_data,s_wait,
input [3:0] ain,
input [7:0] din,
output [7:0] dout
);

wire psel, penable, pready, pwrite;
wire [7:0] prdata, pwdata;
wire [3:0] paddr;
 
apb_master a1(
.PCLK(pclk),
.Presetn(Presetn),
.wr(wr),
.new_data(new_data),
.Pready(pready),
.Pdatain(din),
.PRdata(prdata),
.PWaddress(ain),
.Psel(psel),
.Penable(penable),
.Pwrite(pwrite),
.Paddress(paddr),
.PWdata(pwdata),
.Pdataout(dout)
); 

apb_s a2(
.pclk(pclk),
.presetn(Presetn),
.paddr(paddr),
.psel(psel),
.penable(penable),
.pwdata(pwdata),
.pwrite(pwrite),
.prdata(prdata),
.pready(pready),
.s_wait(s_wait)
);
endmodule
