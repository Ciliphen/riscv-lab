`include "mycpu.h"

module DecodeUnit(
         //  来自DecodeStage的输入
         input [`IF_ID_WID - 1: 0] decodeStage,
         //  与ARegfile的接口
         output [4: 0] src1_raddr,
         input [`XLEN - 1: 0] src1_rdata,
         output [4: 0] src2_raddr,
         input [`XLEN - 1: 0] src2_rdata,
         //  输出至ExecuteStage的接口
         output [`ID_EXE_WID - 1: 0] executeStage
       );

wire valid;
wire [`XLEN - 1: 0] pc;
wire [`XLEN - 1: 0] inst;
assign {valid, pc, inst} = decodeStage;

// outports wire
wire [`INFO_WID - 1: 0] info;

// TODO: 完成译码器的实例化

wire [`FU_OP_TYPE_WID - 1: 0] op;
wire reg_wen;
wire [4: 0] reg_waddr;

assign {src1_raddr, src2_raddr, op, reg_wen, reg_waddr} = info;

assign executeStage = {
         valid,
         pc,
         op,
         reg_wen,
         reg_waddr,
         src1_rdata,
         src2_rdata
       };

endmodule
