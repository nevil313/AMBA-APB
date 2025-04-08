`timescale 1ns / 1ps

module master #(parameter K=8,parameter IDLE=0,SETUP=1,enable=2) (
input PCLK,Presetn,wr,new_data,Pready,//1-bit information
input [K-1:0]Pdatain,[K-1:0]PRdata,//vector information
input [3:0]PWaddress,

output reg Psel,Penable,Pwrite,
output reg [3:0]Paddress,
output reg [K-1:0] PWdata,Pdataout
    );
reg [1:0]state,nstate;

always@(posedge PCLK,negedge Presetn)
 begin
   if(!Presetn)
     begin
       state<=IDLE;
       Pwrite<=1'b0;
       Penable<=1'b0;
       PWdata<='b0;
       Paddress<='b0;
       Psel<=1'b0;
     end
   else
      state<=nstate;  
 end 
 
 always@(*)
  begin
    case(state)
     IDLE:begin
          Pwrite<=1'b0;
          Penable<=1'b0;
          PWdata<='b0;
          Paddress<='b0;
          Psel<=1'b0;
             if(new_data)
              begin
                nstate<=SETUP;
              end    
             else
                nstate<=IDLE;   
           end
      SETUP:begin
               Psel<=1'b1;
               Paddress<=PWaddress;
               nstate<=enable;
               Pwrite<=wr;
                if(wr)
                  PWdata<=Pdatain;
                else PWdata<=PWdata;    
            end     
      enable:begin
               Psel<=1'b1;
               Penable<=1'b1;
               if(new_data)
                begin
                 if(Pready)
                   begin
                    if(!(wr)&Penable) 
                       Pdataout<=PRdata;
                    nstate<=SETUP;
                   end
                 else
                   nstate<=enable;  
                end
               else
                 begin
                   nstate<=IDLE;
                 end         
             end  
     default:nstate<=IDLE;          
     endcase      
  end   
endmodule
