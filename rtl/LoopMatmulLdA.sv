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

module LoopMatmulLdA(
  input         clock,
                reset,
  output        io_req_ready,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  input         io_req_valid,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  input  [15:0] io_req_bits_max_i,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
                io_req_bits_max_k,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  input  [2:0]  io_req_bits_pad_i,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
                io_req_bits_pad_k,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  input  [33:0] io_req_bits_dram_addr,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
                io_req_bits_dram_stride,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  input         io_req_bits_transpose,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  input  [12:0] io_req_bits_addr_start,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  input         io_req_bits_loop_id,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
                io_req_bits_is_resadd,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
                io_cmd_ready,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  output        io_cmd_valid,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  output [63:0] io_cmd_bits_rs1,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
                io_cmd_bits_rs2,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  output [15:0] io_i,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
                io_k,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  output        io_idle,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  input         io_rob_overloaded,	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
  output        io_loop_id	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:31:14]
);

  wire [12:0] mvin_cmd_rs2_local_addr_data;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:82:27, :84:22, :85:29]
  wire        mvin_cmd_rs2_local_addr_garbage_bit;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:82:27, :84:22, :85:29]
  wire [2:0]  mvin_cmd_rs2_local_addr_norm_cmd;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:82:27, :84:22, :85:29]
  reg         state;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22]
  reg  [15:0] req_max_i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg  [15:0] req_max_k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg  [2:0]  req_pad_i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg  [2:0]  req_pad_k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg  [33:0] req_dram_addr;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg  [33:0] req_dram_stride;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg         req_transpose;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg  [12:0] req_addr_start;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg         req_loop_id;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg         req_is_resadd;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
  reg  [15:0] i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:49:14]
  reg  [15:0] k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:50:14]
  wire [15:0] row_iterator = req_transpose ? k : i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16, :49:14, :50:14, :52:25]
  wire [15:0] col_iterator = req_transpose ? i : k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16, :49:14, :50:14, :53:25]
  wire [15:0] max_col_dim = req_transpose ? req_max_i : req_max_k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16, :56:29]
  wire        _max_blocks_T = max_col_dim < 16'h9;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:56:29, :62:36]
  wire [15:0] max_blocks = _max_blocks_T ? max_col_dim : 16'h8;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:56:29, :62:{23,36}]
  wire [28:0] _mvin_cmd_rs2_local_addr_result_result_WIRE_5 = {16'h0, req_addr_start} + {{10'h0, row_iterator} * {10'h0, max_col_dim} + {10'h0, col_iterator}, 3'h0};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16, :52:25, :53:25, :56:29, :68:{31,47,66}, src/main/scala/chisel3/util/Mux.scala:141:16]
  wire [15:0] blocks = col_iterator + max_blocks <= max_col_dim ? max_blocks : max_col_dim - col_iterator;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:53:25, :56:29, :62:23, :69:{19,33,46,95}]
  assign mvin_cmd_rs2_local_addr_norm_cmd = req_is_resadd ? _mvin_cmd_rs2_local_addr_result_result_WIRE_5[28:26] : _mvin_cmd_rs2_local_addr_result_result_WIRE_5[28:26];	// @[generators/gemmini/src/main/scala/gemmini/LocalAddr.scala:108:37, generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16, :68:31, :82:27, :84:22, :85:29]
  assign mvin_cmd_rs2_local_addr_garbage_bit = req_is_resadd ? _mvin_cmd_rs2_local_addr_result_result_WIRE_5[13] : _mvin_cmd_rs2_local_addr_result_result_WIRE_5[13];	// @[generators/gemmini/src/main/scala/gemmini/LocalAddr.scala:108:37, generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16, :68:31, :82:27, :84:22, :85:29]
  assign mvin_cmd_rs2_local_addr_data = req_is_resadd ? _mvin_cmd_rs2_local_addr_result_result_WIRE_5[12:0] : _mvin_cmd_rs2_local_addr_result_result_WIRE_5[12:0];	// @[generators/gemmini/src/main/scala/gemmini/LocalAddr.scala:108:37, generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16, :68:31, :82:27, :84:22, :85:29]
  wire        _io_cmd_valid_output = state & ~io_rob_overloaded & (|req_dram_addr);	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :47:16, :93:{37,56,73}]
  wire        _GEN = req_dram_addr == 34'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16, :66:35, :98:22]
  wire        _GEN_0 = io_cmd_ready & _io_cmd_valid_output;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:93:56, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire [16:0] _next_i_T_3 = {1'h0, i} + {1'h0, req_transpose ? (_max_blocks_T ? req_max_i : 16'h8) : 16'h1};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :47:16, :49:14, :62:{23,36}, :102:23, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
  wire        _next_i_T_4 = _next_i_T_3 > {1'h0, req_max_i - 16'h1};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :47:16, generators/gemmini/src/main/scala/gemmini/Util.scala:39:28, :41:15, :43:17]
  wire [15:0] next_i = _next_i_T_4 ? 16'h0 : _next_i_T_3[15:0];	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, :43:17, src/main/scala/chisel3/util/Mux.scala:141:16]
  wire [16:0] _next_k_T_4 = {1'h0, k} + {1'h0, req_transpose ? 16'h1 : _max_blocks_T ? req_max_k : 16'h8};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :47:16, :50:14, :62:{23,36}, :102:23, :103:23, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
  wire        _next_k_T_5 = _next_k_T_4 > {1'h0, req_max_k - 16'h1};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :47:16, generators/gemmini/src/main/scala/gemmini/Util.scala:39:28, :41:15, :43:17]
  wire        _GEN_1 = ~state & io_req_valid;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :88:25, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  always @(posedge clock) begin
    if (reset)
      state <= 1'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22]
    else
      state <= _GEN_1 | ~(_GEN | _GEN_0 & ~(|next_i) & ((|next_i) ? k : _next_k_T_5 ? 16'h0 : _next_k_T_4[15:0]) == 16'h0) & state;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :50:14, :98:{22,30}, :99:11, :100:27, :106:58, :111:{36,45}, :112:13, :116:22, :118:11, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, :43:17, src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/chisel3/util/Mux.scala:141:16]
    if (_GEN_1) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      req_max_i <= io_req_bits_max_i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      req_max_k <= io_req_bits_max_k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      req_pad_i <= io_req_bits_pad_i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      req_pad_k <= io_req_bits_pad_k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      req_dram_addr <= io_req_bits_dram_addr;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      req_dram_stride <= io_req_bits_dram_stride;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      req_transpose <= io_req_bits_transpose;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      req_addr_start <= io_req_bits_addr_start;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      req_loop_id <= io_req_bits_loop_id;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      req_is_resadd <= io_req_bits_is_resadd;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
      i <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:49:14, src/main/scala/chisel3/util/Mux.scala:141:16]
      k <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:50:14, src/main/scala/chisel3/util/Mux.scala:141:16]
    end
    else begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      if (_GEN | ~_GEN_0) begin	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:49:14, :98:{22,30}, :100:27, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      end
      else if (_next_i_T_4)	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        i <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:49:14, src/main/scala/chisel3/util/Mux.scala:141:16]
      else	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        i <= _next_i_T_3[15:0];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:49:14, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
      if (_GEN | ~_GEN_0 | (|next_i)) begin	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:49:14, :50:14, :98:{22,30}, :100:27, :106:58, src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/chisel3/util/Mux.scala:141:16]
      end
      else if (_next_k_T_5)	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        k <= 16'h0;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:50:14, src/main/scala/chisel3/util/Mux.scala:141:16]
      else	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        k <= _next_k_T_4[15:0];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:50:14, generators/gemmini/src/main/scala/gemmini/Util.scala:41:15]
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
        state = _RANDOM[3'h0][0];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22]
        req_max_i = _RANDOM[3'h0][16:1];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :47:16]
        req_max_k = {_RANDOM[3'h0][31:17], _RANDOM[3'h1][0]};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :47:16]
        req_pad_i = _RANDOM[3'h1][3:1];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
        req_pad_k = _RANDOM[3'h1][6:4];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
        req_dram_addr = {_RANDOM[3'h1][31:7], _RANDOM[3'h2][8:0]};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
        req_dram_stride = {_RANDOM[3'h2][31:9], _RANDOM[3'h3][10:0]};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
        req_transpose = _RANDOM[3'h3][11];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
        req_addr_start = _RANDOM[3'h3][24:12];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
        req_loop_id = _RANDOM[3'h3][25];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
        req_is_resadd = _RANDOM[3'h3][26];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
        i = {_RANDOM[3'h3][31:27], _RANDOM[3'h4][10:0]};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16, :49:14]
        k = _RANDOM[3'h4][26:11];	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:49:14, :50:14]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_req_ready = ~state;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :88:25]
  assign io_cmd_valid = _io_cmd_valid_output;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:93:56]
  assign io_cmd_bits_rs1 = {29'h0, {3'h0, {13'h0, row_iterator} * req_dram_stride[28:0] + {13'h0, col_iterator}, 3'h0} + {1'h0, req_dram_addr}};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :47:16, :52:25, :53:25, :66:{35,53}, :67:33, :76:16, :1139:17]
  assign io_cmd_bits_rs2 = {12'h0, 4'h8 - {1'h0, row_iterator == (req_transpose ? req_max_k : req_max_i) - 16'h1 ? (req_transpose ? req_pad_k : req_pad_i) : 3'h0}, 9'h0, {blocks[3:0], 3'h0} - {4'h0, col_iterator + blocks >= max_col_dim ? (req_transpose ? req_pad_i : req_pad_k) : 3'h0}, req_is_resadd, 2'h0, mvin_cmd_rs2_local_addr_norm_cmd, 12'h0, mvin_cmd_rs2_local_addr_garbage_bit, mvin_cmd_rs2_local_addr_data};	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :47:16, :52:25, :53:25, :55:29, :56:29, :58:20, :59:20, :69:19, :70:{38,43,57,66}, :71:{27,32,46,66}, :74:12, :79:16, :82:27, :83:32, :84:22, :85:29]
  assign io_i = i;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:49:14]
  assign io_k = k;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:50:14]
  assign io_idle = ~state;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:45:22, :88:25]
  assign io_loop_id = req_loop_id;	// @[generators/gemmini/src/main/scala/gemmini/LoopMatmul.scala:47:16]
endmodule

