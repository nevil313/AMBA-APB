module APB_MASTER(
input [4:0]datain,
input [2:0]addin,
input clk,preset,wr,new,pready,
input [4:0]prdata,

output reg psel,penable,pwrite,
output reg[4:0]pwdata,
output reg [2:0]padd,
output reg [4:0]dataout);

parameter ideal=0,setup=1,enable=2;
reg[2:0]state,nstate;

always@(posedge clk)
begin
if(preset)
state<=ideal;
else
state<=nstate;
end

always@(*)
begin
case(state)
ideal: begin   
      nstate=new?setup:ideal;
      end
setup:nstate= enable;

enable: begin 
       nstate=(pready)?(new)?setup:ideal:enable;
       end
       endcase
end

always@(*)
begin
case(state)
ideal: begin 
      padd<=0;
      penable<=0;
      dataout<=0;
       end
setup: begin 
       psel<=1;
       padd<=addin;
       pwrite<=wr;
       penable<=0;
       if(wr) pwdata<=datain;
       else pwdata<=pwdata;
       end
enable: begin
         psel<=1;
         penable<=1;
         if(!wr) dataout<=prdata;
         else dataout<=0;
         end
                 
       
endcase
end
endmodule





