`include "mycpu.h"

// 不要修改此处的代码！！！
module top(
         input clock,
         input reset,
         // Interrupts
         input mei,      // to PLIC
         input msi,      // to CLINT
         input mti,      // to CLINT
         input sei,      // to PLIC
         // inst sram interface
         output inst_sram_en,
         output [ 3: 0] inst_sram_wen,
         output [31: 0] inst_sram_addr,
         output [31: 0] inst_sram_wdata,
         input [31: 0] inst_sram_rdata,
         // data sram interface
         output data_sram_en,
         output [ 7: 0] data_sram_wen,
         output [31: 0] data_sram_addr,
         output [63: 0] data_sram_wdata,
         input [63: 0] data_sram_rdata,
         // trace debug interface
         output debug_commit,
         output [63: 0] debug_pc,
         output [4: 0] debug_rf_wnum,
         output [63: 0] debug_rf_wdata
       );
// 不要修改上方的代码！！！
// 下方为编程区域
// 你可以在此处添加任何你想要的代码

// outports wire
wire [`IF_ID_WID - 1: 0] decodeStage;

FetchUnit u_FetchUnit(
            .clock ( clock ),
            .reset ( reset ),
            .decodeStage ( decodeStage ),
            .inst_sram_en ( inst_sram_en ),
            .inst_sram_wen ( inst_sram_wen ),
            .inst_sram_addr ( inst_sram_addr ),
            .inst_sram_wdata ( inst_sram_wdata ),
            .inst_sram_rdata ( inst_sram_rdata )
          );

// outports wire
wire [`IF_ID_WID - 1: 0] decodeUnit;

DecoderStage u_DecoderStage(
               .clock ( clock ),
               .reset ( reset ),
               .fetchUnit ( decodeStage ),
               .decodeUnit ( decodeUnit )
             );

// outports wire
wire [`XLEN - 1: 0] src1_rdata;
wire [`XLEN - 1: 0] src2_rdata;

// outports wire
wire [4: 0] src1_raddr;
wire [4: 0] src2_raddr;
wire [`ID_EXE_WID - 1: 0] executeStage;

DecodeUnit u_DecodeUnit(
             .decodeStage ( decodeUnit ),
             .src1_raddr ( src1_raddr ),
             .src1_rdata ( src1_rdata ),
             .src2_raddr ( src2_raddr ),
             .src2_rdata ( src2_rdata ),
             .executeStage ( executeStage )
           );

// TODO: 完成各个模块的连接

endmodule


