module top(
input clk,rstn,wr,newd,
input [2:0] ain,
input [4:0] din,
output [4:0] dout
);

wire psel, penable, pready, pwrite;
wire [4:0] prdata, pwdata;
wire [2:0] paddr;
 
 
APB_MASTER m1 (
        .clk(clk),
        .preset(rstn),
        .addin(ain),
        .datain(din),
        .wr(wr),
        .new(newd),
        .prdata(prdata),
        .pready(pready),
        .psel(psel),
        .penable(penable),
        .padd(paddr),
        .pwdata(pwdata),
        .pwrite(pwrite),
        .dataout(dout)
    );



    slave s1 (
        .pclk(clk),
        .preset(rstn),
        .padd(paddr),
        .psel(psel),
        .penable(penable),
        .pwdata(pwdata),
        .pwrite(pwrite),
        .prdata(prdata),
        .pready(pready)
    );
    
endmodule
