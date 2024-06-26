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

module MulAddRecFNToRaw_preMul(
  input  [32:0] io_a,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
                io_b,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
  output [23:0] io_mulAddA,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
                io_mulAddB,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
  output [47:0] io_mulAddC,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
  output        io_toPostMul_isSigNaNAny,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
                io_toPostMul_isNaNAOrB,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
                io_toPostMul_isInfA,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
                io_toPostMul_isZeroA,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
                io_toPostMul_isInfB,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
                io_toPostMul_isZeroB,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
                io_toPostMul_signProd,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
  output [9:0]  io_toPostMul_sExpSum,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
  output        io_toPostMul_doSubMags,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
  output [25:0] io_toPostMul_highAlignedSigC,	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
  output        io_toPostMul_bit0AlignedSigC	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:73:16]
);

  wire        rawA_isNaN = (&(io_a[31:30])) & io_a[29];	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:{28,53}, :56:{33,41}]
  wire        rawB_isNaN = (&(io_b[31:30])) & io_b[29];	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:{28,53}, :56:{33,41}]
  wire        _signProd_T = io_a[32] ^ io_b[32];	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:96:30, generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:59:25]
  wire [10:0] _sExpAlignedProd_T_1 = {2'h0, io_a[31:23]} + {2'h0, io_b[31:23]} - 11'hE5;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:99:{19,32}, generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21]
  wire [77:0] mainAlignedSigC = $signed($signed({78{_signProd_T}}) >>> (~(|(io_a[31:29])) | ~(|(io_b[31:29])) | $signed(_sExpAlignedProd_T_1) < 11'sh0 ? 7'h0 : _sExpAlignedProd_T_1[9:0] < 10'h4A ? _sExpAlignedProd_T_1[6:0] : 7'h4A));	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:96:30, :99:32, :106:42, :107:{50,69}, :111:12, :113:{16,34}, :114:33, :119:{46,100}, generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:{28,53}]
  assign io_mulAddA = {|(io_a[31:29]), io_a[22:0]};	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:140:16, generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:{28,53}, :61:49]
  assign io_mulAddB = {|(io_b[31:29]), io_b[22:0]};	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:141:16, generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:{28,53}, :61:49]
  assign io_mulAddC = mainAlignedSigC[50:3];	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:119:100, :142:30]
  assign io_toPostMul_isSigNaNAny = rawA_isNaN & ~(io_a[22]) | rawB_isNaN & ~(io_b[22]);	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:145:32, generators/hardfloat/hardfloat/src/main/scala/common.scala:82:{46,49,56}, generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:56:33]
  assign io_toPostMul_isNaNAOrB = rawA_isNaN | rawB_isNaN;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:147:42, generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:56:33]
  assign io_toPostMul_isInfA = (&(io_a[31:30])) & ~(io_a[29]);	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:{28,53}, :56:41, :57:{33,36}]
  assign io_toPostMul_isZeroA = ~(|(io_a[31:29]));	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:{28,53}]
  assign io_toPostMul_isInfB = (&(io_b[31:30])) & ~(io_b[29]);	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :53:{28,53}, :56:41, :57:{33,36}]
  assign io_toPostMul_isZeroB = ~(|(io_b[31:29]));	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromRecFN.scala:51:21, :52:{28,53}]
  assign io_toPostMul_signProd = _signProd_T;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:96:30]
  assign io_toPostMul_sExpSum = _sExpAlignedProd_T_1[9:0] - 10'h18;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:99:32, :157:53]
  assign io_toPostMul_doSubMags = _signProd_T;	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:96:30]
  assign io_toPostMul_highAlignedSigC = mainAlignedSigC[76:51];	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:119:100, :162:20]
  assign io_toPostMul_bit0AlignedSigC = _signProd_T ? (&(mainAlignedSigC[2:0])) : (|(mainAlignedSigC[2:0]));	// @[generators/hardfloat/hardfloat/src/main/scala/MulAddRecFN.scala:96:30, :119:100, :132:16, :133:{32,39}, :134:39]
endmodule

