`include "mycpu.h"

module WriteBackUnit(
         input [`MEM_WB_WID - 1: 0] writeBackStage,
         //  输出至ARegfile
         output reg_wen,
         output [4: 0] reg_waddr,
         output [`XLEN - 1: 0] reg_wdata,
         //  debug
         output debug_commit,
         output [63: 0] debug_pc,
         output [4: 0] debug_rf_wnum,
         output [63: 0] debug_rf_wdata
       );

// 写回阶段完成数据的写回操作
// 同时该阶段还负责差分测试的比对工作
// TODO: 完成WriteBackUnit模块的逻辑

endmodule
