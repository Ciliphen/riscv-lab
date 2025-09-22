`include "mycpu.h"

module DecoderStage(
         input clock,
         input reset,
         input [`IF_ID_WID - 1: 0] fetchUnit,
         output [`IF_ID_WID - 1: 0] decodeUnit
       );

reg [`IF_ID_WID - 1: 0] data;

always @(posedge clock)
  begin
    if (reset)
      begin
        data <= 0;
      end
    else
      begin
        data <= fetchUnit;
      end
  end

assign decodeUnit = data;

endmodule
