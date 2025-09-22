`include "mycpu.h"

module ExecuteUnit(
         // 来自ExecuteStage的输入
         input [`ID_EXE_WID - 1: 0] executeStage,
         // 送往MemoryStage的输出
         output [`EXE_MEM_WID - 1: 0] memoryStage,
         // 与memory sram的接口
         output data_sram_en,
         output [7: 0] data_sram_wen,
         output [31: 0] data_sram_addr,
         output [63: 0] data_sram_wdata
       );

wire valid;
wire [`XLEN - 1: 0] pc;
wire [`FU_OP_TYPE_WID - 1: 0] op;
wire reg_wen;
wire [4: 0] reg_waddr;
wire [`XLEN - 1: 0] src1_data;
wire [`XLEN - 1: 0] src2_data;
assign {valid, pc, op, reg_wen, reg_waddr, src1_data, src2_data} = executeStage;

wire [`XLEN - 1: 0] reg_wdata;
Alu u_Alu(
      .op ( op ),
      .src1_data ( src1_data ),
      .src2_data ( src2_data ),
      .result ( reg_wdata )
    );


assign data_sram_en = 1'b0;
assign data_sram_wen = 8'b0;
assign data_sram_addr = 32'b0;
assign data_sram_wdata = 64'b0;

// TODO:定义和MemoryStage的连接
// assign memoryStage = 

endmodule
