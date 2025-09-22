`include "mycpu.h"

module MemoryUnit(
         // 来自MemoryStage的输入
         input [`EXE_MEM_WID - 1: 0] memoryStage,
         // 送往WriteBackStage的输出
         output [`MEM_WB_WID - 1: 0] writeBackStage,
         // 与memory sram的接口
         input [`XLEN - 1: 0] data_sram_rdata
       );

// TODO: 完成MemoryUnit逻辑

endmodule
