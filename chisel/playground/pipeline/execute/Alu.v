`include "mycpu.h"

module Alu(
         input [`FU_OP_TYPE_WID - 1: 0] op,
         input [`XLEN - 1: 0] src1_data,
         input [`XLEN - 1: 0] src2_data,
         output [`XLEN - 1: 0] result
       );

// TODO: 完成ALU模块的逻辑

endmodule
