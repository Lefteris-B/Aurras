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

module INToRecFN(
  input  [7:0]  io_in,	// @[generators/hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16]
  output [32:0] io_out	// @[generators/hardfloat/hardfloat/src/main/scala/INToRecFN.scala:45:16]
);

  wire [7:0]  intAsRawFloat_absIn = io_in[7] ? 8'h0 - io_in : io_in;	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:51:34, :52:{24,31}, :53:44]
  wire [2:0]  intAsRawFloat_adjustedNormDist = intAsRawFloat_absIn[7] ? 3'h0 : intAsRawFloat_absIn[6] ? 3'h1 : intAsRawFloat_absIn[5] ? 3'h2 : intAsRawFloat_absIn[4] ? 3'h3 : intAsRawFloat_absIn[3] ? 3'h4 : intAsRawFloat_absIn[2] ? 3'h5 : {2'h3, ~(intAsRawFloat_absIn[1])};	// @[generators/hardfloat/hardfloat/src/main/scala/primitives.scala:91:52, generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:24, :53:53, src/main/scala/chisel3/util/Mux.scala:50:70]
  wire [14:0] _intAsRawFloat_sig_T = {7'h0, intAsRawFloat_absIn} << intAsRawFloat_adjustedNormDist;	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:24, :56:22, src/main/scala/chisel3/util/Mux.scala:50:70]
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN (	// @[generators/hardfloat/hardfloat/src/main/scala/INToRecFN.scala:59:15]
    .io_in_isZero (~(_intAsRawFloat_sig_T[7])),	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:56:{22,41}, :62:{23,28}]
    .io_in_sign   (io_in[7]),	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:51:34]
    .io_in_sExp   ({3'h2, ~intAsRawFloat_adjustedNormDist}),	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:64:{36,72}, src/main/scala/chisel3/util/Mux.scala:50:70]
    .io_in_sig    ({1'h0, _intAsRawFloat_sig_T[7:0]}),	// @[generators/hardfloat/hardfloat/src/main/scala/rawFloatFromIN.scala:52:31, :56:{22,41}, :65:20]
    .io_out       (io_out)
  );
endmodule
