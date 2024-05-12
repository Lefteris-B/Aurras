// Generated by CIRCT firtool-1.61.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

// Standard header to adapt well known macros for prints and assertions.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

module MulAddRecFNToRaw_postMul(
  input         io_fromPreMul_isSigNaNAny,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_fromPreMul_isNaNAOrB,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_fromPreMul_isInfA,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_fromPreMul_isZeroA,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_fromPreMul_isInfB,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_fromPreMul_isZeroB,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_fromPreMul_signProd,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
  input  [9:0]  io_fromPreMul_sExpSum,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
  input         io_fromPreMul_doSubMags,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
  input  [25:0] io_fromPreMul_highAlignedSigC,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
  input         io_fromPreMul_bit0AlignedSigC,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
  input  [48:0] io_mulAddResult,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
  output        io_invalidExc,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_rawOut_isNaN,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_rawOut_isInf,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_rawOut_isZero,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
                io_rawOut_sign,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
  output [9:0]  io_rawOut_sExp,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
  output [26:0] io_rawOut_sig	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16]
);

  wire [2:0]   _sigSum_T_3 = io_mulAddResult[48] ? io_fromPreMul_highAlignedSigC[2:0] + 3'h1 : io_fromPreMul_highAlignedSigC[2:0];	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16, :190:{16,32}, :191:47]
  wire [50:0]  notCDom_absSigSum = _sigSum_T_3[2] ? ~{_sigSum_T_3[1:0], io_mulAddResult[47:0], io_fromPreMul_bit0AlignedSigC} : {_sigSum_T_3[1:0], io_mulAddResult[47:0], io_fromPreMul_bit0AlignedSigC} + {50'h0, io_fromPreMul_doSubMags};	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:190:16, :194:28, :230:36, :232:12, :233:{13,20}, :234:41]
  wire [4:0]   notCDom_normDistReduced2 = notCDom_absSigSum[50] ? 5'h0 : (|(notCDom_absSigSum[49:48])) ? 5'h1 : (|(notCDom_absSigSum[47:46])) ? 5'h2 : (|(notCDom_absSigSum[45:44])) ? 5'h3 : (|(notCDom_absSigSum[43:42])) ? 5'h4 : (|(notCDom_absSigSum[41:40])) ? 5'h5 : (|(notCDom_absSigSum[39:38])) ? 5'h6 : (|(notCDom_absSigSum[37:36])) ? 5'h7 : (|(notCDom_absSigSum[35:34])) ? 5'h8 : (|(notCDom_absSigSum[33:32])) ? 5'h9 : (|(notCDom_absSigSum[31:30])) ? 5'hA : (|(notCDom_absSigSum[29:28])) ? 5'hB : (|(notCDom_absSigSum[27:26])) ? 5'hC : (|(notCDom_absSigSum[25:24])) ? 5'hD : (|(notCDom_absSigSum[23:22])) ? 5'hE : (|(notCDom_absSigSum[21:20])) ? 5'hF : (|(notCDom_absSigSum[19:18])) ? 5'h10 : (|(notCDom_absSigSum[17:16])) ? 5'h11 : (|(notCDom_absSigSum[15:14])) ? 5'h12 : (|(notCDom_absSigSum[13:12])) ? 5'h13 : (|(notCDom_absSigSum[11:10])) ? 5'h14 : (|(notCDom_absSigSum[9:8])) ? 5'h15 : (|(notCDom_absSigSum[7:6])) ? 5'h16 : (|(notCDom_absSigSum[5:4])) ? 5'h17 : {4'hC, ~(|(notCDom_absSigSum[3:2]))};	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, generators/hardfloat/hardfloat/src/main/scala/primitives.scala:103:{33,54}, :106:15, src/main/scala/chisel3/util/Mux.scala:50:70]
  wire [113:0] _notCDom_mainSig_T = {63'h0, notCDom_absSigSum} << {108'h0, notCDom_normDistReduced2, 1'h0};	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16, :184:45, :232:12, :241:27, :274:35, :284:31, :287:46, src/main/scala/chisel3/util/Mux.scala:50:70]
  wire [16:0]  notCDom_reduced4SigExtra_shift = $signed(17'sh10000 >>> ~(notCDom_normDistReduced2[4:1]));	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:246:46, generators/hardfloat/hardfloat/src/main/scala/primitives.scala:52:21, :76:56, src/main/scala/chisel3/util/Mux.scala:50:70]
  wire         notCDom_completeCancellation = _notCDom_mainSig_T[51:50] == 2'h0;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:241:27, :253:{21,50}, generators/hardfloat/hardfloat/src/main/scala/primitives.scala:103:54]
  wire         notNaN_isInfProd = io_fromPreMul_isInfA | io_fromPreMul_isInfB;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:262:49]
  wire         _notNaN_addZeros_T = io_fromPreMul_isZeroA | io_fromPreMul_isZeroB;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:265:32]
  assign io_invalidExc = io_fromPreMul_isSigNaNAny | io_fromPreMul_isInfA & io_fromPreMul_isZeroB | io_fromPreMul_isZeroA & io_fromPreMul_isInfB;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:270:{31,57}, :271:32]
  assign io_rawOut_isNaN = io_fromPreMul_isNaNAOrB;
  assign io_rawOut_isInf = notNaN_isInfProd;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:262:49]
  assign io_rawOut_isZero = _notNaN_addZeros_T | notCDom_completeCancellation;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:253:50, :265:32, :280:25]
  assign io_rawOut_sign = notNaN_isInfProd & io_fromPreMul_signProd | _notNaN_addZeros_T & io_fromPreMul_signProd & (io_fromPreMul_signProd ^ io_fromPreMul_doSubMags) | ~notNaN_isInfProd & ~_notNaN_addZeros_T & ~notCDom_completeCancellation & (io_fromPreMul_signProd ^ _sigSum_T_3[2]);	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:188:42, :190:16, :230:36, :253:50, :255:12, :257:36, :262:49, :265:32, :283:27, :286:36, :288:50, :289:{10,31,49}]
  assign io_rawOut_sExp = io_fromPreMul_sExpSum - {4'h0, notCDom_normDistReduced2, 1'h0};	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:170:16, :184:45, :239:46, :274:35, :284:31, :287:46, src/main/scala/chisel3/util/Mux.scala:50:70]
  assign io_rawOut_sig = {_notCDom_mainSig_T[51:26], (|(_notCDom_mainSig_T[25:23])) | (|({|{|(notCDom_absSigSum[23:22]), |(notCDom_absSigSum[21:20])}, |{|(notCDom_absSigSum[19:18]), |(notCDom_absSigSum[17:16])}, |{|(notCDom_absSigSum[15:14]), |(notCDom_absSigSum[13:12])}, |{|(notCDom_absSigSum[11:10]), |(notCDom_absSigSum[9:8])}, |{|(notCDom_absSigSum[7:6]), |(notCDom_absSigSum[5:4])}, |{|(notCDom_absSigSum[3:2]), |(notCDom_absSigSum[1:0])}} & {notCDom_reduced4SigExtra_shift[1], notCDom_reduced4SigExtra_shift[2], notCDom_reduced4SigExtra_shift[3], notCDom_reduced4SigExtra_shift[4], notCDom_reduced4SigExtra_shift[5], notCDom_reduced4SigExtra_shift[6]}))};	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:232:12, :241:{27,50}, :245:{39,78}, :247:11, :249:{12,28}, :250:{28,35,39}, generators/hardfloat/hardfloat/src/main/scala/primitives.scala:76:56, :77:20, :78:22, :103:{33,54}]
endmodule
