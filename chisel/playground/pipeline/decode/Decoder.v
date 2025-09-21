`include "mycpu.h"

module Decoder(
         input [`XLEN - 1: 0] inst,
         output [`INFO_WID - 1: 0] info
       );

// TODO: 完成译码器逻辑
wire [6: 0] opcode = inst[6: 0];
// wire [2: 0] funct3 =
// wire [6: 0] funct7 =
// wire [4: 0] rs =
// wire [4: 0] rt =
// wire [4: 0] rd =

wire inst_add = (opcode == 7'b0110011) && (funct3 == 3'b000) && (funct7 == 7'b0000000);
// wire inst_sub =
// wire inst_sll =
// wire inst_slt =
// wire inst_sltu =
// wire inst_xor =
// wire inst_srl =
// wire inst_sra =
// wire inst_or =
// wire inst_and =
// wire inst_addw =
// wire inst_subw = 
// wire inst_sllw =
// wire inst_srlw =
// wire inst_sraw =

wire [4: 0] src1_raddr = rs;
wire [4: 0] src2_raddr = rt;
// wire [`FU_OP_TYPE_WID - 1: 0] op =
// wire reg_wen =
// wire [4: 0] reg_waddr =

assign info = {
         src1_raddr,
         src2_raddr,
         op,
         reg_wen,
         reg_waddr
       };
endmodule
