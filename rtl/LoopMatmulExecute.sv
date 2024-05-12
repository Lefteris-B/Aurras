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

module LoopMatmulExecute(
  input         clock,
                reset,
  output        io_req_ready,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input         io_req_valid,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input  [15:0] io_req_bits_max_j,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_req_bits_max_k,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_req_bits_max_i,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input  [2:0]  io_req_bits_pad_j,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_req_bits_pad_k,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_req_bits_pad_i,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input         io_req_bits_a_tranpose,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_req_bits_b_tranpose,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_req_bits_accumulate,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input  [12:0] io_req_bits_a_addr_start,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input  [13:0] io_req_bits_b_addr_end,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input  [9:0]  io_req_bits_c_addr_start,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input         io_req_bits_loop_id,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_req_bits_skip,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_cmd_ready,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  output        io_cmd_valid,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  output [6:0]  io_cmd_bits_inst_funct,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  output [63:0] io_cmd_bits_rs1,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_cmd_bits_rs2,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  output [15:0] io_k,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_j,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_i,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input  [15:0] io_ld_ka,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_ld_kb,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_ld_j,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_ld_i,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input         io_lda_completed,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_ldb_completed,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
                io_ldd_completed,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  output        io_idle,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  input         io_rob_overloaded,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
  output        io_loop_id	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:356:14]
);

  reg  [1:0]  state;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22]
  reg  [15:0] req_max_j;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg  [15:0] req_max_k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg  [15:0] req_max_i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg  [2:0]  req_pad_j;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg  [2:0]  req_pad_k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg  [2:0]  req_pad_i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg         req_a_tranpose;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg         req_b_tranpose;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg         req_accumulate;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg  [12:0] req_a_addr_start;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg  [13:0] req_b_addr_end;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg  [9:0]  req_c_addr_start;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg         req_loop_id;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  reg         req_skip;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
  wire [25:0] _GEN = {10'h0, req_max_j};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :387:49, :401:54]
  reg  [15:0] k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:389:14]
  reg  [15:0] j;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:390:14]
  reg  [15:0] i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:391:14]
  wire [28:0] _a_addr_T_4 = {16'h0, req_a_addr_start} + {{10'h0, req_a_tranpose ? k : i} * {10'h0, req_a_tranpose ? req_max_i : req_max_k} + {10'h0, req_a_tranpose ? i : k}, 3'h0};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :389:14, :391:14, :393:18, :394:18, :398:22, :401:{33,42,54}, src/main/scala/chisel3/util/Mux.scala:141:16]
  wire [28:0] _b_addr_T_4 = {15'h0, req_b_addr_end} - {{10'h0, req_max_k} * _GEN, 3'h0} + {{10'h0, req_b_tranpose ? j : k} * {10'h0, req_b_tranpose ? req_max_k : req_max_j} + {10'h0, req_b_tranpose ? k : j}, 3'h0};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :387:{37,49}, :389:14, :390:14, :395:18, :396:18, :399:22, :401:54, :402:{29,38,50}]
  wire [28:0] _c_addr_T_4 = {19'h0, req_c_addr_start} + {{10'h0, i} * _GEN + {10'h0, j}, 3'h0};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :387:49, :390:14, :391:14, :401:54, :403:{29,34,46}]
  wire [15:0] _next_k_max_T = req_max_k - 16'h1;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :405:51]
  wire [15:0] _next_i_max_T = req_max_i - 16'h1;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :406:51]
  wire [15:0] _next_j_max_T = req_max_j - 16'h1;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :407:51]
  wire        _io_req_ready_output = state == 2'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :413:11, :451:25]
  wire        _ldb_ahead_T_2 = io_ld_ka == k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:389:14, :458:65]
  wire        _io_cmd_valid_output = (|state) & ~io_rob_overloaded & (io_lda_completed | io_ld_ka > k | _ldb_ahead_T_2 & io_ld_i > i) & (io_ldb_completed | io_ld_kb > k | _ldb_ahead_T_2 & io_ld_j > j) & io_ldd_completed & ~req_skip;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :384:16, :389:14, :390:14, :391:14, :458:{48,52,65,71,82}, :459:{48,52,71,82}, :463:{25,37,68,71}]
  wire        _io_cmd_bits_T = state == 2'h1;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :464:28, :488:11]
  `ifndef SYNTHESIS	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:494:9]
    always @(posedge clock) begin	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:494:9]
      if (~reset & (|state) & req_a_tranpose & req_b_tranpose) begin	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :384:16, :463:25, :494:9]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:494:9]
          $error("Assertion failed\n    at LoopMatmul.scala:494 assert(!(state =/= idle && req.a_tranpose && req.b_tranpose))\n");	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:494:9]
        if (`STOP_COND_)	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:494:9]
          $fatal;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:494:9]
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        _GEN_0 = io_cmd_ready & _io_cmd_valid_output;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:463:68, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire [16:0] _next_i_T_3 = {1'h0, i} + 17'h1;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :391:14, :405:51, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
  wire        _next_i_T_4 = _next_i_T_3 > {1'h0, _next_i_max_T};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :406:51, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, :43:17]
  wire [15:0] next_i = _next_i_T_4 ? 16'h0 : _next_i_T_3[15:0];	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, :43:17, src/main/scala/chisel3/util/Mux.scala:141:16]
  wire [16:0] _next_j_T_4 = {1'h0, j} + 17'h1;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :390:14, :405:51, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
  wire        _next_j_T_5 = _next_j_T_4 > {1'h0, _next_j_max_T};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :407:51, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, :43:17]
  wire        _state_T_1 = ((|next_i) ? j : _next_j_T_5 ? 16'h0 : _next_j_T_4[15:0]) == 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:390:14, :475:55, :476:55, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, :43:17, src/main/scala/chisel3/util/Mux.scala:141:16]
  wire        _next_k_T_2 = _state_T_1 & ~(|next_i);	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:475:55, :476:{55,63}, src/main/scala/chisel3/util/Mux.scala:141:16]
  wire [16:0] _next_k_T_6 = {1'h0, k} + 17'h1;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :389:14, :405:51, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
  wire        _next_k_T_7 = _next_k_T_6 > {1'h0, _next_k_max_T};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :405:51, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, :43:17]
  wire        _GEN_1 = _io_req_ready_output & io_req_valid;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:451:25, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  always @(posedge clock) begin
    if (reset)
      state <= 2'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :413:11]
    else if (_GEN_1)	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      state <= 2'h1;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :488:11]
    else if (req_skip)	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      state <= 2'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :413:11]
    else if (_GEN_0) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      if (_io_cmd_bits_T)	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:464:28]
        state <= 2'h2;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :472:13]
      else	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:464:28]
        state <= {1'h0, ~((_next_k_T_2 ? (_next_k_T_7 ? 16'h0 : _next_k_T_6[15:0]) : k) == 16'h0 & _state_T_1 & ~(|next_i))};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :389:14, :405:51, :475:55, :476:{55,63}, :482:{13,19,27,53}, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, :43:17, src/main/scala/chisel3/util/Mux.scala:141:16]
    end
    if (_GEN_1) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      req_max_j <= io_req_bits_max_j;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_max_k <= io_req_bits_max_k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_max_i <= io_req_bits_max_i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_pad_j <= io_req_bits_pad_j;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_pad_k <= io_req_bits_pad_k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_pad_i <= io_req_bits_pad_i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_a_tranpose <= io_req_bits_a_tranpose;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_b_tranpose <= io_req_bits_b_tranpose;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_accumulate <= io_req_bits_accumulate;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_a_addr_start <= io_req_bits_a_addr_start;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_b_addr_end <= io_req_bits_b_addr_end;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_c_addr_start <= io_req_bits_c_addr_start;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_loop_id <= io_req_bits_loop_id;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      req_skip <= io_req_bits_skip;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
      k <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:389:14, src/main/scala/chisel3/util/Mux.scala:141:16]
      j <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:390:14, src/main/scala/chisel3/util/Mux.scala:141:16]
      i <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:391:14, src/main/scala/chisel3/util/Mux.scala:141:16]
    end
    else begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      if (req_skip | ~_GEN_0 | _io_cmd_bits_T | ~_next_k_T_2) begin	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :389:14, :464:28, :468:18, :470:28, :471:26, :476:63, generators/gemmini/src/main/scala/gemmini/Util.scala:42:8, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      end
      else if (_next_k_T_7)	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        k <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:389:14, src/main/scala/chisel3/util/Mux.scala:141:16]
      else	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        k <= _next_k_T_6[15:0];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:389:14, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
      if (req_skip | ~_GEN_0 | _io_cmd_bits_T | (|next_i)) begin	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :389:14, :390:14, :464:28, :468:18, :470:28, :471:26, :475:55, src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/chisel3/util/Mux.scala:141:16]
      end
      else if (_next_j_T_5)	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        j <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:390:14, src/main/scala/chisel3/util/Mux.scala:141:16]
      else	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        j <= _next_j_T_4[15:0];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:390:14, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
      if (req_skip | ~_GEN_0 | _io_cmd_bits_T) begin	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :389:14, :391:14, :464:28, :468:18, :470:28, :471:26, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      end
      else if (_next_i_T_4)	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        i <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:391:14, src/main/scala/chisel3/util/Mux.scala:141:16]
      else	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        i <= _next_i_T_3[15:0];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:391:14, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:4];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i_0 = 3'h0; i_0 < 3'h5; i_0 += 3'h1) begin
          _RANDOM[i_0] = `RANDOM;
        end
        state = _RANDOM[3'h0][1:0];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22]
        req_max_j = _RANDOM[3'h0][17:2];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :384:16]
        req_max_k = {_RANDOM[3'h0][31:18], _RANDOM[3'h1][1:0]};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :384:16]
        req_max_i = _RANDOM[3'h1][17:2];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_pad_j = _RANDOM[3'h1][20:18];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_pad_k = _RANDOM[3'h1][23:21];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_pad_i = _RANDOM[3'h1][26:24];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_a_tranpose = _RANDOM[3'h1][27];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_b_tranpose = _RANDOM[3'h1][28];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_accumulate = _RANDOM[3'h1][29];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_a_addr_start = {_RANDOM[3'h1][31:30], _RANDOM[3'h2][10:0]};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_b_addr_end = _RANDOM[3'h2][24:11];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_c_addr_start = {_RANDOM[3'h2][31:25], _RANDOM[3'h3][2:0]};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_loop_id = _RANDOM[3'h3][3];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        req_skip = _RANDOM[3'h3][4];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
        k = _RANDOM[3'h3][20:5];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :389:14]
        j = {_RANDOM[3'h3][31:21], _RANDOM[3'h4][4:0]};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16, :390:14]
        i = _RANDOM[3'h4][20:5];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:390:14, :391:14]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_req_ready = _io_req_ready_output;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:451:25]
  assign io_cmd_valid = _io_cmd_valid_output;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:463:68]
  assign io_cmd_bits_inst_funct = _io_cmd_bits_T ? 7'h6 : {6'h2, |i};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:391:14, :414:22, :420:35, :434:23, :464:{21,28}]
  assign io_cmd_bits_rs1 = {12'h0, _io_cmd_bits_T ? {4'h8 - {1'h0, k == _next_k_max_T ? req_pad_k : 3'h0}, 12'h0, 4'h8 - {1'h0, j == _next_j_max_T ? req_pad_j : 3'h0}, {3{|i}}, (|i) ? 3'h0 : _b_addr_T_4[28:26], 12'h0, (|i) | _b_addr_T_4[13], (|i) ? 13'h1FFF : _b_addr_T_4[12:0]} : {4'h8 - {1'h0, i == _next_i_max_T ? req_pad_i : 3'h0}, 12'h0, 4'h8 - {1'h0, k == _next_k_max_T ? req_pad_k : 3'h0}, 3'h0, _a_addr_T_4[28:26], 12'h0, _a_addr_T_4[13:0]}};	// @[generators/gemmini/src/main/scala/gemmini/LocalAddr.scala:99:13, :108:37, generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :384:16, :389:14, :390:14, :391:14, :401:33, :402:29, :405:{29,34,37,51}, :406:{29,34,37,51}, :407:{29,34,37,51}, :408:{29,34,37}, :417:15, :420:{32,35}, :429:30, :448:32, :464:{21,28}]
  assign io_cmd_bits_rs2 = _io_cmd_bits_T ? {12'h0, 4'h8 - {1'h0, i == _next_i_max_T ? req_pad_i : 3'h0}, 12'h0, 4'h8 - {1'h0, j == _next_j_max_T ? req_pad_j : 3'h0}, 1'h1, req_accumulate | (|k), 1'h0, _c_addr_T_4[28:26], 12'h0, _c_addr_T_4[13:0]} : 64'h80008E0003FFF;	// @[generators/gemmini/src/main/scala/gemmini/LocalAddr.scala:108:37, generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:382:22, :384:16, :389:14, :390:14, :391:14, :403:29, :405:{29,51}, :406:51, :407:51, :409:{29,34,37}, :410:{29,34,37}, :417:15, :427:{106,111}, :430:30, :449:32, :464:{21,28}]
  assign io_k = k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:389:14]
  assign io_j = j;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:390:14]
  assign io_i = i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:391:14]
  assign io_idle = _io_req_ready_output;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:451:25]
  assign io_loop_id = req_loop_id;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:384:16]
endmodule
