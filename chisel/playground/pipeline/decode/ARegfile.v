`include "mycpu.h"

module ARegfile(
         input clock,
         input reset,
         //  src1 读口
         input [4: 0] src1_raddr,
         output [`XLEN - 1: 0] src1_rdata,
         //  src2 读口
         input [4: 0] src2_raddr,
         output [`XLEN - 1: 0] src2_rdata,
         // writeback 写口
         input reg_wen,
         input [4: 0] reg_waddr,
         input [`XLEN - 1: 0] reg_wdata
       );

reg [`XLEN - 1: 0] regs[31: 0];

always @(posedge clock)
  begin
    if (reset)
      begin
        // TODO:完成寄存器的初始化逻辑
        // 注意:对应的寄存器初始化为对应的数值，用于通过lab1的测例，即，x0 = 0, x1 = 1, x2 = 2, ..., x31 = 31
        // 后续实验请改回为全部初始化为0
      end
    else
      begin
        // 写入数据
        // TODO:完成写寄存器的逻辑
        // 注意:寄存器x0的值恒为0
      end
  end

// 读出数据
// TODO:完成读寄存器的逻辑
// 注意:寄存器x0的值恒为0

endmodule
