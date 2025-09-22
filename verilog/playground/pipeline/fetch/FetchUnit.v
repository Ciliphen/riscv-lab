
`include "mycpu.h"
module FetchUnit(
         input clock,
         input reset,
         output [`IF_ID_WID - 1: 0] decodeStage,
         // inst sram interface
         output inst_sram_en,
         output [ 3: 0] inst_sram_wen,
         output [31: 0] inst_sram_addr,
         output [31: 0] inst_sram_wdata,
         input [31: 0] inst_sram_rdata
       );

reg [1: 0] state;
parameter boot = 0;
parameter send = 1;
parameter receive = 2;

always @(posedge clock)
  begin
    if (reset)
      begin
        state <= boot;
      end
    else
      begin
        case (state)
          boot:
            state <= send;
          send:
            state <= receive;
          receive:
            ;
        endcase
      end
  end
 
reg [`XLEN - 1: 0] pc;
wire [`XLEN - 1: 0] pc_next = pc + 4;

always @(posedge clock)
  begin
    if (reset)
      begin
        pc <= 64'h80000000 - 4;
      end
    else
      begin
        if (state != boot)
          pc <= pc_next;
      end
  end

assign inst_sram_en = !reset;
assign inst_sram_wen = 0;
assign inst_sram_wdata = 0;
assign inst_sram_addr = pc_next[31: 0];

assign decodeStage = {
         state == receive,       // decodeStage.valid
         pc,       // decodeStage.pc
         {32'b0, inst_sram_rdata} // decodeStage.inst
       };

endmodule
