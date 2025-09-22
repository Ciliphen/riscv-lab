`ifndef MYCPU_H
    `define MYCPU_H
    `define XLEN 64
    // IF_ID_WID = valid + pc + inst = 1 + 64 + 64 = 129
    `define IF_ID_WID 129
    `define FU_OP_TYPE_WID 5
    // INFO_WID = src1_addr + src2_addr + reg_wen + reg_waddr + op
    //      = 5 + 5 + 1 + 5 + `FU_OP_TYPE_WID = 16 + `FU_OP_TYPE_WID
    `define INFO_WID (16 +`FU_OP_TYPE_WID)
    // ID_EXE_WID = valid + pc + op + reg_wen + reg_waddr + src1_rdata + src2_rdata
    //            = 1 + 64 + `FU_OP_TYPE_WID + 1 + 5 + 64 + 64 = 199 + `FU_OP_TYPE_WID
    `define ID_EXE_WID (199 + `FU_OP_TYPE_WID)
    // EXE_MEM_WID = valid + pc + reg_wen + reg_waddr + reg_wdata
    //             = 1 + 64 + 1 + 5 + 64 = 135
    `define EXE_MEM_WID 135
    `define MEM_WB_WID 135
`endif
