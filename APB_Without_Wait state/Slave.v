`timescale 1ns / 1ps

module Slave#(parameter K=8,idle=2'b00,write=2'b01,read=2'b10)(

input PCLK,Presetn,Penable,Psel,Pwrite,
input [3:0]Paddress,[K-1:0]Pwdata,

output reg Pready,
output reg [K-1:0]PRdata
    );
    
reg [K-1:0]mem[15:0];    
reg[1:0] state,nstate;

always@(posedge PCLK,negedge Presetn)
 begin
   if(!Presetn) 
      state<=idle;
   else
      state<=nstate;
 end    
 
always@(*)
 begin
   case(state)
      idle:begin
              PRdata<='b00;
              Pready<=1'b0;
              Pready<=1'b0;
              if(Psel==1'b1 && Pwrite==1'b1)
                nstate<=write;
              else if(Psel==1'b1 && Pwrite==1'b0)
                nstate<=read;
              else 
                nstate<=idle;  
           end
      write:begin
                if(Psel==1'b1 && Penable==1'b1)
                  begin
                    Pready<=1'b1;
                    mem[Paddress]<=Pwdata;
                    nstate<=idle;
                  end
                else
                   nstate<=idle;  
            end
      read:begin
              if(Psel==1'b1 && Penable==1'b1)
                 begin
                 Pready<=1'b1;
                 PRdata<=mem[Paddress];
                 nstate<=idle;
                 end
              else
                nstate<=idle;   
           end
      default:nstate<=idle;                
   endcase        
 end 
endmodule
