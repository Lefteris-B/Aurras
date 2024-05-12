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

module TileClockGater(
  input         clock,
  output        auto_clock_gater_in_1_a_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_clock_gater_in_1_a_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_clock_gater_in_1_a_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [1:0]  auto_clock_gater_in_1_a_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [13:0] auto_clock_gater_in_1_a_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [20:0] auto_clock_gater_in_1_a_bits_address,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [7:0]  auto_clock_gater_in_1_a_bits_mask,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [63:0] auto_clock_gater_in_1_a_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_clock_gater_in_1_d_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_clock_gater_in_1_d_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_clock_gater_in_1_d_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [1:0]  auto_clock_gater_in_1_d_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [13:0] auto_clock_gater_in_1_d_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [63:0] auto_clock_gater_in_1_d_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_clock_gater_in_0_member_allClocks_uncore_clock,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_clock_gater_in_0_member_allClocks_uncore_reset,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_clock_gater_out_member_allClocks_uncore_clock,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_clock_gater_out_member_allClocks_uncore_reset	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
);

  wire _out_wofireMux_T_1;	// @[generators/rocket-chip/src/main/scala/tilelink/RegisterRouter.scala:82:24]
  wire _regs_0_io_q;	// @[generators/chipyard/src/main/scala/clocking/TileClockGater.scala:33:53]
  wire out_front_bits_read = auto_clock_gater_in_1_a_bits_opcode == 3'h4;	// @[generators/rocket-chip/src/main/scala/tilelink/RegisterRouter.scala:69:36]
  wire _out_out_bits_data_T_1 = auto_clock_gater_in_1_a_bits_address[11:3] == 9'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:193:34, generators/rocket-chip/src/main/scala/tilelink/RegisterRouter.scala:70:19, :82:24]
  assign _out_wofireMux_T_1 = ~out_front_bits_read;	// @[generators/rocket-chip/src/main/scala/tilelink/RegisterRouter.scala:69:36, :82:24]
  AsyncResetRegVec_w1_i1 regs_0 (	// @[generators/chipyard/src/main/scala/clocking/TileClockGater.scala:33:53]
    .clock (clock),
    .reset (auto_clock_gater_in_0_member_allClocks_uncore_reset),
    .io_d  (auto_clock_gater_in_1_a_bits_data[0]),	// @[generators/rocket-chip/src/main/scala/tilelink/RegisterRouter.scala:82:24]
    .io_q  (_regs_0_io_q),
    .io_en (auto_clock_gater_in_1_a_valid & auto_clock_gater_in_1_d_ready & _out_wofireMux_T_1 & _out_out_bits_data_T_1 & auto_clock_gater_in_1_a_bits_mask[0])	// @[generators/rocket-chip/src/main/scala/tilelink/RegisterRouter.scala:82:24]
  );
  assign auto_clock_gater_in_1_a_ready = auto_clock_gater_in_1_d_ready;
  assign auto_clock_gater_in_1_d_valid = auto_clock_gater_in_1_a_valid;
  assign auto_clock_gater_in_1_d_bits_opcode = {2'h0, out_front_bits_read};	// @[generators/rocket-chip/src/main/scala/tilelink/RegisterRouter.scala:69:36, :100:19]
  assign auto_clock_gater_in_1_d_bits_size = auto_clock_gater_in_1_a_bits_size;
  assign auto_clock_gater_in_1_d_bits_source = auto_clock_gater_in_1_a_bits_source;
  assign auto_clock_gater_in_1_d_bits_data = {63'h0, _out_out_bits_data_T_1 & _regs_0_io_q};	// @[generators/chipyard/src/main/scala/clocking/TileClockGater.scala:33:53, generators/rocket-chip/src/main/scala/tilelink/RegisterRouter.scala:82:24]
  assign auto_clock_gater_out_member_allClocks_uncore_clock = auto_clock_gater_in_0_member_allClocks_uncore_clock;
  assign auto_clock_gater_out_member_allClocks_uncore_reset = auto_clock_gater_in_0_member_allClocks_uncore_reset;
endmodule

