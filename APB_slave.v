module slave(

input pwrite,pclk,preset,psel,penable,
input [4:0]pwdata, [2:0]padd,
output reg [4:0]prdata,
output reg pready
);

reg [4:0]mem[7:0];
parameter idel=0, write = 1 ,read=2;

reg [1:0]state ,nstate;

always @(posedge pclk)
begin
if(!preset)
state<=nstate;
else
state<=idel;
end

always@(*)
begin
case(state)
idel: begin prdata=0;
            
            pready=0;
            if(psel==1&&pwrite==1)
            nstate=write;
            else if(psel==1&&pwrite==0)
            nstate=read;
            else
            nstate=idel;
            end 
write: begin if(psel==1&& penable==1) begin pready=1;
             mem[padd]=pwdata;
             nstate=idel;
          
       end end
read:  begin if(psel==1&& penable ==1) begin pready =1;
            prdata=mem[padd];
            nstate=idel; end    end    
        
 default : nstate<=idel;                       

endcase
end
endmodule
