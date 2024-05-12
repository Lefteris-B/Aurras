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

module AXI4UserYanker(
  input         clock,
                reset,
  output        auto_in_aw_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_aw_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_in_aw_bits_id,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [31:0] auto_in_aw_bits_addr,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [7:0]  auto_in_aw_bits_len,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_aw_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [1:0]  auto_in_aw_bits_burst,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_aw_bits_lock,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_in_aw_bits_cache,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_aw_bits_prot,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_in_aw_bits_qos,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_aw_bits_echo_tl_state_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_aw_bits_echo_tl_state_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_w_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_w_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [63:0] auto_in_w_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [7:0]  auto_in_w_bits_strb,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_w_bits_last,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_b_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_b_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_in_b_bits_id,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [1:0]  auto_in_b_bits_resp,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_in_b_bits_echo_tl_state_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_in_b_bits_echo_tl_state_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_ar_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_ar_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_in_ar_bits_id,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [31:0] auto_in_ar_bits_addr,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [7:0]  auto_in_ar_bits_len,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_ar_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [1:0]  auto_in_ar_bits_burst,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_ar_bits_lock,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_in_ar_bits_cache,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_ar_bits_prot,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_in_ar_bits_qos,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_ar_bits_echo_tl_state_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_ar_bits_echo_tl_state_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_r_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_r_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_in_r_bits_id,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [63:0] auto_in_r_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [1:0]  auto_in_r_bits_resp,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_in_r_bits_echo_tl_state_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_in_r_bits_echo_tl_state_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_r_bits_last,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_aw_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_aw_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_out_aw_bits_id,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [31:0] auto_out_aw_bits_addr,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [7:0]  auto_out_aw_bits_len,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_out_aw_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [1:0]  auto_out_aw_bits_burst,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_aw_bits_lock,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_out_aw_bits_cache,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_out_aw_bits_prot,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_out_aw_bits_qos,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_w_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_w_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [63:0] auto_out_w_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [7:0]  auto_out_w_bits_strb,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_w_bits_last,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_out_b_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_b_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_out_b_bits_id,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [1:0]  auto_out_b_bits_resp,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_ar_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_ar_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_out_ar_bits_id,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [31:0] auto_out_ar_bits_addr,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [7:0]  auto_out_ar_bits_len,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_out_ar_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [1:0]  auto_out_ar_bits_burst,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_ar_bits_lock,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_out_ar_bits_cache,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_out_ar_bits_prot,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_out_ar_bits_qos,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_r_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_r_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_out_r_bits_id,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [63:0] auto_out_r_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [1:0]  auto_out_r_bits_resp,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_r_bits_last	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
);

  wire             _Queue_11_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_11_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_11_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_11_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_10_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_10_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_10_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_10_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_9_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_9_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_9_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_9_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_8_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_8_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_8_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_8_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_7_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_7_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_7_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_7_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_6_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_6_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_6_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_6_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_5_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_5_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_5_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_5_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_4_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_4_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_4_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_4_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_3_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_3_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_3_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_3_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_2_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_2_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_2_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_2_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_1_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_1_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_1_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_1_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire             _Queue_io_deq_valid;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [3:0]       _Queue_io_deq_bits_tl_state_size;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [2:0]       _Queue_io_deq_bits_tl_state_source;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
  wire [15:0]      _GEN = {{1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {_Queue_5_io_enq_ready}, {_Queue_4_io_enq_ready}, {_Queue_3_io_enq_ready}, {_Queue_2_io_enq_ready}, {_Queue_1_io_enq_ready}, {_Queue_io_enq_ready}};	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17, :57:36, :66:15]
  wire [15:0][3:0] _GEN_0 = {{4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {_Queue_5_io_deq_bits_tl_state_size}, {_Queue_4_io_deq_bits_tl_state_size}, {_Queue_3_io_deq_bits_tl_state_size}, {_Queue_2_io_deq_bits_tl_state_size}, {_Queue_1_io_deq_bits_tl_state_size}, {_Queue_io_deq_bits_tl_state_size}};	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17, :70:22, :77:20]
  wire [15:0][2:0] _GEN_1 = {{3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {_Queue_5_io_deq_bits_tl_state_source}, {_Queue_4_io_deq_bits_tl_state_source}, {_Queue_3_io_deq_bits_tl_state_source}, {_Queue_2_io_deq_bits_tl_state_source}, {_Queue_1_io_deq_bits_tl_state_source}, {_Queue_io_deq_bits_tl_state_source}};	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17, :70:22, :77:20]
  wire             _rqueues_15_deq_ready_T = auto_out_r_valid & auto_in_r_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:75:37]
  wire             _rqueues_15_enq_valid_T = auto_in_ar_valid & auto_out_ar_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:78:37]
  wire [15:0]      _GEN_2 = {{1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {_Queue_11_io_enq_ready}, {_Queue_10_io_enq_ready}, {_Queue_9_io_enq_ready}, {_Queue_8_io_enq_ready}, {_Queue_7_io_enq_ready}, {_Queue_6_io_enq_ready}};	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17, :66:15, :86:36]
  `ifndef SYNTHESIS	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:66:14]
    wire [15:0] _GEN_3 = {{1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {_Queue_5_io_deq_valid}, {_Queue_4_io_deq_valid}, {_Queue_3_io_deq_valid}, {_Queue_2_io_deq_valid}, {_Queue_1_io_deq_valid}, {_Queue_io_deq_valid}};	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17, :66:{15,28}]
    wire [15:0] _GEN_4 = {{1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {1'h0}, {_Queue_11_io_deq_valid}, {_Queue_10_io_deq_valid}, {_Queue_9_io_deq_valid}, {_Queue_8_io_deq_valid}, {_Queue_7_io_deq_valid}, {_Queue_6_io_deq_valid}};	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17, :66:15, :95:28]
    always @(posedge clock) begin	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:66:14]
      if (~reset & ~(~auto_out_r_valid | _GEN_3[auto_out_r_bits_id])) begin	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:66:{14,15,28}]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:66:14]
          $error("Assertion failed\n    at UserYanker.scala:66 assert (!out.r.valid || r_valid) // Q must be ready faster than the response\n");	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:66:14]
        if (`STOP_COND_)	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:66:14]
          $fatal;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:66:14]
      end
      if (~reset & ~(~auto_out_b_valid | _GEN_4[auto_out_b_bits_id])) begin	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:66:14, :95:{14,15,28}]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:95:14]
          $error("Assertion failed\n    at UserYanker.scala:95 assert (!out.b.valid || b_valid) // Q must be ready faster than the response\n");	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:95:14]
        if (`STOP_COND_)	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:95:14]
          $fatal;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:95:14]
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [15:0][3:0] _GEN_5 = {{4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {4'h0}, {_Queue_11_io_deq_bits_tl_state_size}, {_Queue_10_io_deq_bits_tl_state_size}, {_Queue_9_io_deq_bits_tl_state_size}, {_Queue_8_io_deq_bits_tl_state_size}, {_Queue_7_io_deq_bits_tl_state_size}, {_Queue_6_io_deq_bits_tl_state_size}};	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17, :77:20, :99:22]
  wire [15:0][2:0] _GEN_6 = {{3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {3'h0}, {_Queue_11_io_deq_bits_tl_state_source}, {_Queue_10_io_deq_bits_tl_state_source}, {_Queue_9_io_deq_bits_tl_state_source}, {_Queue_8_io_deq_bits_tl_state_source}, {_Queue_7_io_deq_bits_tl_state_source}, {_Queue_6_io_deq_bits_tl_state_source}};	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17, :77:20, :99:22]
  wire             _wqueues_15_deq_ready_T = auto_out_b_valid & auto_in_b_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:104:37]
  wire             _wqueues_15_enq_valid_T = auto_in_aw_valid & auto_out_aw_ready;	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:107:37]
  Queue_17 Queue (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_io_enq_ready),
    .io_enq_valid                (_rqueues_15_enq_valid_T & auto_in_ar_bits_id == 4'h0),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:72:55, :77:20, :78:{37,53}]
    .io_enq_bits_tl_state_size   (auto_in_ar_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_ar_bits_echo_tl_state_source),
    .io_deq_ready                (_rqueues_15_deq_ready_T & auto_out_r_bits_id == 4'h0 & auto_out_r_bits_last),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:73:55, :75:{37,58}, :77:20]
    .io_deq_valid                (_Queue_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_1 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_1_io_enq_ready),
    .io_enq_valid                (_rqueues_15_enq_valid_T & auto_in_ar_bits_id == 4'h1),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:72:55, :78:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_ar_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_ar_bits_echo_tl_state_source),
    .io_deq_ready                (_rqueues_15_deq_ready_T & auto_out_r_bits_id == 4'h1 & auto_out_r_bits_last),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:73:55, :75:{37,58}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_1_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_1_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_1_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_2 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_2_io_enq_ready),
    .io_enq_valid                (_rqueues_15_enq_valid_T & auto_in_ar_bits_id == 4'h2),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:72:55, :78:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_ar_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_ar_bits_echo_tl_state_source),
    .io_deq_ready                (_rqueues_15_deq_ready_T & auto_out_r_bits_id == 4'h2 & auto_out_r_bits_last),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:73:55, :75:{37,58}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_2_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_2_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_2_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_3 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_3_io_enq_ready),
    .io_enq_valid                (_rqueues_15_enq_valid_T & auto_in_ar_bits_id == 4'h3),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:72:55, :78:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_ar_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_ar_bits_echo_tl_state_source),
    .io_deq_ready                (_rqueues_15_deq_ready_T & auto_out_r_bits_id == 4'h3 & auto_out_r_bits_last),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:73:55, :75:{37,58}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_3_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_3_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_3_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_4 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_4_io_enq_ready),
    .io_enq_valid                (_rqueues_15_enq_valid_T & auto_in_ar_bits_id == 4'h4),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:72:55, :78:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_ar_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_ar_bits_echo_tl_state_source),
    .io_deq_ready                (_rqueues_15_deq_ready_T & auto_out_r_bits_id == 4'h4 & auto_out_r_bits_last),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:73:55, :75:{37,58}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_4_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_4_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_4_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_5 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_5_io_enq_ready),
    .io_enq_valid                (_rqueues_15_enq_valid_T & auto_in_ar_bits_id == 4'h5),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:72:55, :78:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_ar_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_ar_bits_echo_tl_state_source),
    .io_deq_ready                (_rqueues_15_deq_ready_T & auto_out_r_bits_id == 4'h5 & auto_out_r_bits_last),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:73:55, :75:{37,58}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_5_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_5_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_5_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_6 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_6_io_enq_ready),
    .io_enq_valid                (_wqueues_15_enq_valid_T & auto_in_aw_bits_id == 4'h0),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:77:20, :101:55, :107:{37,53}]
    .io_enq_bits_tl_state_size   (auto_in_aw_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_aw_bits_echo_tl_state_source),
    .io_deq_ready                (_wqueues_15_deq_ready_T & auto_out_b_bits_id == 4'h0),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:77:20, :102:55, :104:{37,53}]
    .io_deq_valid                (_Queue_6_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_6_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_6_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_7 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_7_io_enq_ready),
    .io_enq_valid                (_wqueues_15_enq_valid_T & auto_in_aw_bits_id == 4'h1),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:101:55, :107:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_aw_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_aw_bits_echo_tl_state_source),
    .io_deq_ready                (_wqueues_15_deq_ready_T & auto_out_b_bits_id == 4'h1),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:102:55, :104:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_7_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_7_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_7_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_8 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_8_io_enq_ready),
    .io_enq_valid                (_wqueues_15_enq_valid_T & auto_in_aw_bits_id == 4'h2),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:101:55, :107:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_aw_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_aw_bits_echo_tl_state_source),
    .io_deq_ready                (_wqueues_15_deq_ready_T & auto_out_b_bits_id == 4'h2),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:102:55, :104:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_8_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_8_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_8_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_9 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_9_io_enq_ready),
    .io_enq_valid                (_wqueues_15_enq_valid_T & auto_in_aw_bits_id == 4'h3),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:101:55, :107:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_aw_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_aw_bits_echo_tl_state_source),
    .io_deq_ready                (_wqueues_15_deq_ready_T & auto_out_b_bits_id == 4'h3),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:102:55, :104:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_9_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_9_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_9_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_10 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_10_io_enq_ready),
    .io_enq_valid                (_wqueues_15_enq_valid_T & auto_in_aw_bits_id == 4'h4),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:101:55, :107:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_aw_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_aw_bits_echo_tl_state_source),
    .io_deq_ready                (_wqueues_15_deq_ready_T & auto_out_b_bits_id == 4'h4),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:102:55, :104:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_10_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_10_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_10_io_deq_bits_tl_state_source)
  );
  Queue_17 Queue_11 (	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:48:17]
    .clock                       (clock),
    .reset                       (reset),
    .io_enq_ready                (_Queue_11_io_enq_ready),
    .io_enq_valid                (_wqueues_15_enq_valid_T & auto_in_aw_bits_id == 4'h5),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:101:55, :107:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_enq_bits_tl_state_size   (auto_in_aw_bits_echo_tl_state_size),
    .io_enq_bits_tl_state_source (auto_in_aw_bits_echo_tl_state_source),
    .io_deq_ready                (_wqueues_15_deq_ready_T & auto_out_b_bits_id == 4'h5),	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:102:55, :104:{37,53}, src/main/scala/chisel3/util/OneHot.scala:65:12]
    .io_deq_valid                (_Queue_11_io_deq_valid),
    .io_deq_bits_tl_state_size   (_Queue_11_io_deq_bits_tl_state_size),
    .io_deq_bits_tl_state_source (_Queue_11_io_deq_bits_tl_state_source)
  );
  assign auto_in_aw_ready = auto_out_aw_ready & _GEN_2[auto_in_aw_bits_id];	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:86:36]
  assign auto_in_w_ready = auto_out_w_ready;
  assign auto_in_b_valid = auto_out_b_valid;
  assign auto_in_b_bits_id = auto_out_b_bits_id;
  assign auto_in_b_bits_resp = auto_out_b_bits_resp;
  assign auto_in_b_bits_echo_tl_state_size = _GEN_5[auto_out_b_bits_id];	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:99:22]
  assign auto_in_b_bits_echo_tl_state_source = _GEN_6[auto_out_b_bits_id];	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:99:22]
  assign auto_in_ar_ready = auto_out_ar_ready & _GEN[auto_in_ar_bits_id];	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:57:36]
  assign auto_in_r_valid = auto_out_r_valid;
  assign auto_in_r_bits_id = auto_out_r_bits_id;
  assign auto_in_r_bits_data = auto_out_r_bits_data;
  assign auto_in_r_bits_resp = auto_out_r_bits_resp;
  assign auto_in_r_bits_echo_tl_state_size = _GEN_0[auto_out_r_bits_id];	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:70:22]
  assign auto_in_r_bits_echo_tl_state_source = _GEN_1[auto_out_r_bits_id];	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:70:22]
  assign auto_in_r_bits_last = auto_out_r_bits_last;
  assign auto_out_aw_valid = auto_in_aw_valid & _GEN_2[auto_in_aw_bits_id];	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:86:36, :87:36]
  assign auto_out_aw_bits_id = auto_in_aw_bits_id;
  assign auto_out_aw_bits_addr = auto_in_aw_bits_addr;
  assign auto_out_aw_bits_len = auto_in_aw_bits_len;
  assign auto_out_aw_bits_size = auto_in_aw_bits_size;
  assign auto_out_aw_bits_burst = auto_in_aw_bits_burst;
  assign auto_out_aw_bits_lock = auto_in_aw_bits_lock;
  assign auto_out_aw_bits_cache = auto_in_aw_bits_cache;
  assign auto_out_aw_bits_prot = auto_in_aw_bits_prot;
  assign auto_out_aw_bits_qos = auto_in_aw_bits_qos;
  assign auto_out_w_valid = auto_in_w_valid;
  assign auto_out_w_bits_data = auto_in_w_bits_data;
  assign auto_out_w_bits_strb = auto_in_w_bits_strb;
  assign auto_out_w_bits_last = auto_in_w_bits_last;
  assign auto_out_b_ready = auto_in_b_ready;
  assign auto_out_ar_valid = auto_in_ar_valid & _GEN[auto_in_ar_bits_id];	// @[generators/rocket-chip/src/main/scala/amba/axi4/UserYanker.scala:57:36, :58:36]
  assign auto_out_ar_bits_id = auto_in_ar_bits_id;
  assign auto_out_ar_bits_addr = auto_in_ar_bits_addr;
  assign auto_out_ar_bits_len = auto_in_ar_bits_len;
  assign auto_out_ar_bits_size = auto_in_ar_bits_size;
  assign auto_out_ar_bits_burst = auto_in_ar_bits_burst;
  assign auto_out_ar_bits_lock = auto_in_ar_bits_lock;
  assign auto_out_ar_bits_cache = auto_in_ar_bits_cache;
  assign auto_out_ar_bits_prot = auto_in_ar_bits_prot;
  assign auto_out_ar_bits_qos = auto_in_ar_bits_qos;
  assign auto_out_r_ready = auto_in_r_ready;
endmodule

