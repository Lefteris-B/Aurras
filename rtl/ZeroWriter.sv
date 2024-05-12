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

module ZeroWriter(
  input         clock,
                reset,
  output        io_req_ready,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  input         io_req_valid,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_req_bits_laddr_is_acc_addr,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_req_bits_laddr_accumulate,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  input  [12:0] io_req_bits_laddr_data,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  input  [15:0] io_req_bits_tag_cols,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  input  [7:0]  io_req_bits_tag_pixel_repeats,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_req_bits_tag_cmd_id,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  input  [6:0]  io_req_bits_cols,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  input  [15:0] io_req_bits_block_stride,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  input         io_resp_ready,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  output        io_resp_valid,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  output [15:0] io_resp_bits_tag_cols,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  output [7:0]  io_resp_bits_tag_pixel_repeats,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_tag_cmd_id,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  output        io_resp_bits_laddr_is_acc_addr,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_laddr_accumulate,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  output [12:0] io_resp_bits_laddr_data,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
  output        io_resp_bits_mask_0,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_mask_1,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_mask_2,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_mask_3,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_mask_4,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_mask_5,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_mask_6,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_mask_7,	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
                io_resp_bits_last	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:32:14]
);

  reg         req_valid;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  reg         req_bits_laddr_is_acc_addr;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  reg         req_bits_laddr_accumulate;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  reg  [12:0] req_bits_laddr_data;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  reg  [15:0] req_bits_tag_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  reg  [7:0]  req_bits_tag_pixel_repeats;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  reg  [7:0]  req_bits_tag_cmd_id;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  reg  [6:0]  req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  reg  [15:0] req_bits_block_stride;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  reg  [5:0]  col_counter;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:39:24]
  wire [6:0]  _GEN = {1'h0, col_counter};	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24, :52:82]
  wire [6:0]  _next_col_counter_T_3 = _GEN + 7'h8;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:52:82, :53:36]
  wire        _GEN_0 = io_resp_ready & req_valid;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire        _next_col_counter_T_4 = _next_col_counter_T_3 > req_bits_cols - 7'h1;	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:39:28, :43:17, generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :53:36]
  wire        _GEN_1 = _GEN_0 & (_next_col_counter_T_4 ? 6'h0 : _next_col_counter_T_3[5:0]) == 6'h0;	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, :43:17, :139:13, generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :53:36, :56:23, :61:{28,37}, src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/chisel3/util/Mux.scala:141:16]
  wire        _io_req_ready_output = _GEN_1 | ~req_valid;	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:139:13, generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :41:{16,19}, :56:23, :61:37, :63:20]
  wire        _GEN_2 = _io_req_ready_output & io_req_valid;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:41:16, :56:23, :61:37, :63:20, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  always @(posedge clock) begin
    if (reset)
      req_valid <= 1'h0;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
    else
      req_valid <= _GEN_2 | ~_GEN_1 & req_valid;	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:134:13, :139:13, generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :56:23, :61:37, :67:22, src/main/scala/chisel3/util/Decoupled.scala:52:35]
    if (_GEN_2) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      req_bits_laddr_is_acc_addr <= io_req_bits_laddr_is_acc_addr;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
      req_bits_laddr_accumulate <= io_req_bits_laddr_accumulate;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
      req_bits_laddr_data <= io_req_bits_laddr_data;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
      req_bits_tag_cols <= io_req_bits_tag_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
      req_bits_tag_pixel_repeats <= io_req_bits_tag_pixel_repeats;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
      req_bits_tag_cmd_id <= io_req_bits_tag_cmd_id;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
      req_bits_cols <= io_req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
      req_bits_block_stride <= io_req_bits_block_stride;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
      col_counter <= 6'h0;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:39:24, src/main/scala/chisel3/util/Mux.scala:141:16]
    end
    else if (_GEN_0) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      if (_next_col_counter_T_4)	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        col_counter <= 6'h0;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:39:24, src/main/scala/chisel3/util/Mux.scala:141:16]
      else	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:43:17]
        col_counter <= _next_col_counter_T_3[5:0];	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:41:15, generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:39:24, :53:36]
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:10];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'hB; i += 4'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        req_valid = _RANDOM[4'h0][0];	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
        req_bits_laddr_is_acc_addr = _RANDOM[4'h0][1];	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
        req_bits_laddr_accumulate = _RANDOM[4'h0][2];	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
        req_bits_laddr_data = {_RANDOM[4'h0][31:20], _RANDOM[4'h1][0]};	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
        req_bits_tag_cols = _RANDOM[4'h3][18:3];	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
        req_bits_tag_pixel_repeats = _RANDOM[4'h5][28:21];	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
        req_bits_tag_cmd_id = {_RANDOM[4'h5][31:29], _RANDOM[4'h6][4:0]};	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
        req_bits_cols = _RANDOM[4'h9][20:14];	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
        req_bits_block_stride = {_RANDOM[4'h9][31:21], _RANDOM[4'hA][4:0]};	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
        col_counter = _RANDOM[4'hA][10:5];	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_req_ready = _io_req_ready_output;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:41:16, :56:23, :61:37, :63:20]
  assign io_resp_valid = req_valid;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  assign io_resp_bits_tag_cols = req_bits_tag_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  assign io_resp_bits_tag_pixel_repeats = req_bits_tag_pixel_repeats;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  assign io_resp_bits_tag_cmd_id = req_bits_tag_cmd_id;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  assign io_resp_bits_laddr_is_acc_addr = req_bits_laddr_is_acc_addr;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  assign io_resp_bits_laddr_accumulate = req_bits_laddr_accumulate;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16]
  assign io_resp_bits_laddr_data = req_bits_laddr_data + req_bits_block_stride[12:0] * {7'h0, col_counter / 6'h8};	// @[generators/gemmini/src/main/scala/gemmini/LocalAddr.scala:51:25, generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24, :44:64, :48:20]
  assign io_resp_bits_mask_0 = _GEN < req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :52:82]
  assign io_resp_bits_mask_1 = {1'h0, col_counter + 6'h1} < req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24, :52:{76,82}]
  assign io_resp_bits_mask_2 = {1'h0, col_counter + 6'h2} < req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24, :52:{76,82}]
  assign io_resp_bits_mask_3 = {1'h0, col_counter + 6'h3} < req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24, :52:{76,82}]
  assign io_resp_bits_mask_4 = {1'h0, col_counter + 6'h4} < req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24, :52:{76,82}]
  assign io_resp_bits_mask_5 = {1'h0, col_counter + 6'h5} < req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24, :52:{76,82}]
  assign io_resp_bits_mask_6 = {1'h0, col_counter + 6'h6} < req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24, :52:{76,82}]
  assign io_resp_bits_mask_7 = {1'h0, col_counter + 6'h7} < req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :39:24, :52:{76,82}]
  assign io_resp_bits_last = _next_col_counter_T_3 >= req_bits_cols;	// @[generators/gemmini/src/main/scala/gemmini/ZeroWriter.scala:37:16, :53:{36,52}]
endmodule

