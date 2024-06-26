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

module BeatMerger(
  input          clock,
                 reset,
  output         io_req_ready,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input          io_req_valid,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input  [5:0]   io_req_bits_shift,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input  [12:0]  io_req_bits_addr,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input          io_req_bits_is_acc,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_req_bits_accumulate,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_req_bits_has_acc_bitwidth,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input  [15:0]  io_req_bits_block_stride,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input  [7:0]   io_req_bits_spad_row_offset,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input  [2:0]   io_req_bits_lg_len_req,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input  [6:0]   io_req_bits_bytes_to_read,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  output         io_in_ready,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input          io_in_valid,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input  [63:0]  io_in_bits,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  input          io_out_ready,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  output         io_out_valid,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  output [255:0] io_out_bits_data,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  output [12:0]  io_out_bits_addr,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
  output         io_out_bits_is_acc,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_accumulate,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_has_acc_bitwidth,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_0,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_1,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_2,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_3,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_4,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_5,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_6,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_7,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_8,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_9,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_10,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_11,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_12,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_13,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_14,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_15,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_16,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_17,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_18,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_19,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_20,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_21,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_22,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_23,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_24,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_25,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_26,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_27,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_28,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_29,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_30,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_mask_31,	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
                 io_out_bits_last	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:33:14]
);

  wire          _io_req_ready_output;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:64:16, :98:22, :101:78, :103:20]
  reg           req_valid;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg  [5:0]    req_bits_shift;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg  [12:0]   req_bits_addr;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg           req_bits_is_acc;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg           req_bits_accumulate;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg           req_bits_has_acc_bitwidth;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg  [15:0]   req_bits_block_stride;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg  [7:0]    req_bits_spad_row_offset;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg  [2:0]    req_bits_lg_len_req;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg  [6:0]    req_bits_bytes_to_read;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  reg  [511:0]  buffer;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:46:19]
  wire [5:0]    rowBytes = req_bits_has_acc_bitwidth ? 6'h20 : 6'h8;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :48:21]
  reg  [6:0]    bytesSent;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:50:22]
  reg  [6:0]    bytesRead;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:51:22]
  wire [6:0]    _GEN = {1'h0, req_bits_shift};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :52:43]
  wire [7:0]    _GEN_0 = {1'h0, bytesRead};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :51:22, :52:71]
  wire [6:0]    bytesReadAfterShift = bytesRead > _GEN ? bytesRead - _GEN : 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:51:22, :52:{32,43,71}]
  wire [6:0]    usefulBytesRead = bytesReadAfterShift < req_bits_bytes_to_read ? bytesReadAfterShift : req_bits_bytes_to_read;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :52:32, generators/gemmini/src/main/scala/gemmini/Util.scala:109:{8,12}]
  wire          _spad_row_offset_T_31 = bytesSent == 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:50:22, :52:32, :57:41]
  wire [8:0]    _bytesSent_next_T_4 = {2'h0, bytesSent} + {1'h0, {2'h0, rowBytes} - (_spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0)};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :48:21, :50:22, :52:71, :57:{30,41}, :58:32, generators/gemmini/src/main/scala/gemmini/Util.scala:35:11]
  wire [7:0]    _GEN_1 = {1'h0, req_bits_bytes_to_read};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, generators/gemmini/src/main/scala/gemmini/Util.scala:35:8]
  wire [7:0]    bytesSent_next = _bytesSent_next_T_4 > {2'h0, req_bits_bytes_to_read} ? _GEN_1 : _bytesSent_next_T_4[7:0];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :52:71, generators/gemmini/src/main/scala/gemmini/Util.scala:35:{8,11,16,30}]
  wire          last_sending = bytesSent_next == _GEN_1;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:61:37, generators/gemmini/src/main/scala/gemmini/Util.scala:35:8]
  wire [7:0]    _io_in_ready_T_1 = 8'h1 << req_bits_lg_len_req;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :62:42]
  wire          _current_lg_len_req_T = _io_req_ready_output & io_req_valid;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:64:16, :98:22, :101:78, :103:20, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire          _io_in_ready_output = _current_lg_len_req_T | req_valid & _GEN_0 != _io_in_ready_T_1;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :52:71, :62:42, :66:{30,44,57}, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire          _io_out_valid_output = req_valid & usefulBytesRead > bytesSent & (usefulBytesRead - bytesSent >= {1'h0, rowBytes} | usefulBytesRead == req_bits_bytes_to_read);	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :48:21, :50:22, :68:{48,60,80,92,104}, :69:21, generators/gemmini/src/main/scala/gemmini/Util.scala:109:8]
  wire [4606:0] _io_out_bits_data_T_5 = {4095'h0, buffer >> {502'h0, bytesSent, 3'h0}} << (_spad_row_offset_T_31 ? {1'h0, req_bits_spad_row_offset, 3'h0} : 12'h0);	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :46:19, :50:22, :57:41, :70:{31,45,53,59,104}]
  wire [7:0]    spad_row_offset = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [8:0]    _GEN_2 = {2'h0, req_bits_bytes_to_read - bytesSent};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :50:22, :52:71, :74:{29,56}]
  wire [7:0]    spad_row_offset_1 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [8:0]    _GEN_3 = {1'h0, spad_row_offset_1} + _GEN_2;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :74:29]
  wire [7:0]    spad_row_offset_2 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_3 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [8:0]    _GEN_4 = {1'h0, spad_row_offset_3} + _GEN_2;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :74:29]
  wire [7:0]    spad_row_offset_4 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_5 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_6 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_7 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [8:0]    _GEN_5 = {1'h0, spad_row_offset_7} + _GEN_2;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :74:29]
  wire [7:0]    spad_row_offset_8 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_9 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_10 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_11 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_12 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_13 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_14 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_15 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [8:0]    _GEN_6 = {1'h0, spad_row_offset_15} + _GEN_2;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :74:29]
  wire [7:0]    spad_row_offset_16 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_17 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_18 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_19 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_20 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_21 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_22 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_23 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_24 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_25 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_26 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_27 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_28 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_29 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_30 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [7:0]    spad_row_offset_31 = _spad_row_offset_T_31 ? req_bits_spad_row_offset : 8'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:{30,41}, :72:30]
  wire [8:0]    _GEN_7 = {1'h0, spad_row_offset_31} + _GEN_2;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :74:29]
  wire [7:0]    _io_out_bits_addr_total_bytes_sent_T = req_bits_spad_row_offset + {1'h0, bytesSent};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :50:22, :77:53, generators/gemmini/src/main/scala/gemmini/Util.scala:35:11]
  wire          _GEN_8 = _GEN_0 == _io_in_ready_T_1;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:52:71, :62:42, :93:19]
  wire          _GEN_9 = io_out_ready & _io_out_valid_output;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:68:60, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire          _GEN_10 = last_sending & _GEN_8;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:61:37, :93:19, :101:24]
  assign _io_req_ready_output = _GEN_9 & _GEN_10 | ~req_valid;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :64:{16,19}, :98:22, :101:{24,78}, :103:20, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire [2110:0] _GEN_11 = {2101'h0, _current_lg_len_req_T ? 7'h0 : usefulBytesRead, 3'h0};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:52:32, :70:45, :116:38, :126:52, generators/gemmini/src/main/scala/gemmini/Util.scala:109:8, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire [7:0]    current_len_req = 8'h1 << (_current_lg_len_req_T ? io_req_bits_lg_len_req : req_bits_lg_len_req);	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :62:42, :118:33, :119:32, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire [7:0]    _bytesRead_T_2 = {1'h0, _current_lg_len_req_T ? 7'h0 : bytesRead} + 8'h8;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :51:22, :52:32, :83:85, :114:32, generators/gemmini/src/main/scala/gemmini/Util.scala:35:11, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire          _GEN_12 = bytesSent == req_bits_bytes_to_read;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :50:22, :94:15]
  wire          _GEN_13 = _GEN_8 & _GEN_12;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:93:{19,59}, :94:15]
  wire          _GEN_14 = _io_in_ready_output & io_in_valid;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:66:30, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire [6:0]    _rshift_T = {1'h0, _current_lg_len_req_T ? io_req_bits_shift : req_bits_shift} - (_current_lg_len_req_T ? 7'h0 : bytesRead - bytesReadAfterShift);	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :51:22, :52:32, :53:34, :115:37, :117:28, :121:25, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire [63:0]   _GEN_15 = {54'h0, _rshift_T, 3'h0};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:70:45, :121:25, :126:41]
  wire [2110:0] _buffer_T_2 = {2047'h0, io_in_bits >> _GEN_15} << _GEN_11;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:126:{41,52}, :128:{48,59}]
  wire [2110:0] _mask_T_2 = {2047'h0, 64'hFFFFFFFFFFFFFFFF >> _GEN_15} << _GEN_11;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:126:{23,41,52}]
  always @(posedge clock) begin
    req_valid <= ~(reset | _GEN_14 & ~_current_lg_len_req_T & _GEN_12 & _io_in_ready_T_1 - _GEN_0 < 8'h9) & (_current_lg_len_req_T | (_GEN_9 ? ~(_GEN_10 | _GEN_13) & req_valid : ~_GEN_13 & req_valid));	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :52:71, :62:{34,42,73}, :73:9, :93:59, :94:{15,43}, :98:22, :101:{24,78}, :107:22, :113:21, :133:{11,81}, :138:23, :139:15, generators/gemmini/src/main/scala/gemmini/Util.scala:134:13, :139:13, src/main/scala/chisel3/util/Decoupled.scala:52:35]
    if (_current_lg_len_req_T) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      req_bits_shift <= io_req_bits_shift;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
      req_bits_addr <= io_req_bits_addr;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
      req_bits_is_acc <= io_req_bits_is_acc;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
      req_bits_accumulate <= io_req_bits_accumulate;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
      req_bits_has_acc_bitwidth <= io_req_bits_has_acc_bitwidth;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
      req_bits_block_stride <= io_req_bits_block_stride;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
      req_bits_spad_row_offset <= io_req_bits_spad_row_offset;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
      req_bits_lg_len_req <= io_req_bits_lg_len_req;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
      req_bits_bytes_to_read <= io_req_bits_bytes_to_read;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
      bytesSent <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:50:22, :52:32]
    end
    else if (_GEN_9)	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      bytesSent <= bytesSent_next[6:0];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:50:22, :99:15, generators/gemmini/src/main/scala/gemmini/Util.scala:35:8]
    if (_GEN_14 & _rshift_T < 7'h9)	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:46:19, :113:21, :121:{25,50}, :123:7, :128:14, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      buffer <= ~(_mask_T_2[511:0]) & buffer | _buffer_T_2[511:0];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:46:19, :126:{19,52}, :128:{25,33,59}]
    if (_GEN_14)	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      bytesRead <= _bytesRead_T_2 > current_len_req ? current_len_req[6:0] : _bytesRead_T_2[6:0];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:51:22, :119:32, generators/gemmini/src/main/scala/gemmini/Util.scala:35:{8,11,16,30}]
    else if (_current_lg_len_req_T)	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      bytesRead <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:51:22, :52:32]
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:20];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h15; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        req_valid = _RANDOM[5'h0][0];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        req_bits_shift = _RANDOM[5'h0][6:1];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        req_bits_addr = _RANDOM[5'h0][19:7];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        req_bits_is_acc = _RANDOM[5'h0][20];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        req_bits_accumulate = _RANDOM[5'h0][21];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        req_bits_has_acc_bitwidth = _RANDOM[5'h0][22];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        req_bits_block_stride = {_RANDOM[5'h2][31], _RANDOM[5'h3][14:0]};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        req_bits_spad_row_offset = _RANDOM[5'h3][22:15];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        req_bits_lg_len_req = _RANDOM[5'h3][25:23];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        req_bits_bytes_to_read = {_RANDOM[5'h3][31:26], _RANDOM[5'h4][0]};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
        buffer = {_RANDOM[5'h4][31:2], _RANDOM[5'h5], _RANDOM[5'h6], _RANDOM[5'h7], _RANDOM[5'h8], _RANDOM[5'h9], _RANDOM[5'hA], _RANDOM[5'hB], _RANDOM[5'hC], _RANDOM[5'hD], _RANDOM[5'hE], _RANDOM[5'hF], _RANDOM[5'h10], _RANDOM[5'h11], _RANDOM[5'h12], _RANDOM[5'h13], _RANDOM[5'h14][1:0]};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :46:19]
        bytesSent = _RANDOM[5'h14][8:2];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:46:19, :50:22]
        bytesRead = _RANDOM[5'h14][15:9];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:46:19, :51:22]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_req_ready = _io_req_ready_output;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:64:16, :98:22, :101:78, :103:20]
  assign io_in_ready = _io_in_ready_output;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:66:30]
  assign io_out_valid = _io_out_valid_output;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:68:60]
  assign io_out_bits_data = _io_out_bits_data_T_5[255:0];	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:70:{20,53}]
  assign io_out_bits_addr = req_bits_addr + req_bits_block_stride[12:0] * {5'h0, req_bits_has_acc_bitwidth ? _io_out_bits_addr_total_bytes_sent_T / 8'h20 : _io_out_bits_addr_total_bytes_sent_T / 8'h8};	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :76:{37,61}, :77:53, :78:8, :82:84, :83:85]
  assign io_out_bits_is_acc = req_bits_is_acc;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  assign io_out_bits_accumulate = req_bits_accumulate;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  assign io_out_bits_has_acc_bitwidth = req_bits_has_acc_bitwidth;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16]
  assign io_out_bits_mask_0 = spad_row_offset == 8'h0 & (|({1'h0, spad_row_offset} + _GEN_2));	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :57:30, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_1 = spad_row_offset_1 < 8'h2 & (|(_GEN_3[8:1]));	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_2 = spad_row_offset_2 < 8'h3 & {1'h0, spad_row_offset_2} + _GEN_2 > 9'h2;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_3 = spad_row_offset_3 < 8'h4 & (|(_GEN_4[8:2]));	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_4 = spad_row_offset_4 < 8'h5 & {1'h0, spad_row_offset_4} + _GEN_2 > 9'h4;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_5 = spad_row_offset_5 < 8'h6 & {1'h0, spad_row_offset_5} + _GEN_2 > 9'h5;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_6 = spad_row_offset_6 < 8'h7 & {1'h0, spad_row_offset_6} + _GEN_2 > 9'h6;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_7 = spad_row_offset_7 < 8'h8 & (|(_GEN_5[8:3]));	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:72:30, :73:{9,28}, :74:{11,29}, :83:85]
  assign io_out_bits_mask_8 = spad_row_offset_8 < 8'h9 & {1'h0, spad_row_offset_8} + _GEN_2 > 9'h8;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_9 = spad_row_offset_9 < 8'hA & {1'h0, spad_row_offset_9} + _GEN_2 > 9'h9;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_10 = spad_row_offset_10 < 8'hB & {1'h0, spad_row_offset_10} + _GEN_2 > 9'hA;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_11 = spad_row_offset_11 < 8'hC & {1'h0, spad_row_offset_11} + _GEN_2 > 9'hB;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_12 = spad_row_offset_12 < 8'hD & {1'h0, spad_row_offset_12} + _GEN_2 > 9'hC;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_13 = spad_row_offset_13 < 8'hE & {1'h0, spad_row_offset_13} + _GEN_2 > 9'hD;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_14 = spad_row_offset_14 < 8'hF & {1'h0, spad_row_offset_14} + _GEN_2 > 9'hE;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_15 = spad_row_offset_15 < 8'h10 & (|(_GEN_6[8:4]));	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_16 = spad_row_offset_16 < 8'h11 & {1'h0, spad_row_offset_16} + _GEN_2 > 9'h10;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_17 = spad_row_offset_17 < 8'h12 & {1'h0, spad_row_offset_17} + _GEN_2 > 9'h11;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_18 = spad_row_offset_18 < 8'h13 & {1'h0, spad_row_offset_18} + _GEN_2 > 9'h12;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_19 = spad_row_offset_19 < 8'h14 & {1'h0, spad_row_offset_19} + _GEN_2 > 9'h13;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_20 = spad_row_offset_20 < 8'h15 & {1'h0, spad_row_offset_20} + _GEN_2 > 9'h14;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_21 = spad_row_offset_21 < 8'h16 & {1'h0, spad_row_offset_21} + _GEN_2 > 9'h15;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_22 = spad_row_offset_22 < 8'h17 & {1'h0, spad_row_offset_22} + _GEN_2 > 9'h16;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_23 = spad_row_offset_23 < 8'h18 & {1'h0, spad_row_offset_23} + _GEN_2 > 9'h17;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_24 = spad_row_offset_24 < 8'h19 & {1'h0, spad_row_offset_24} + _GEN_2 > 9'h18;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_25 = spad_row_offset_25 < 8'h1A & {1'h0, spad_row_offset_25} + _GEN_2 > 9'h19;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_26 = spad_row_offset_26 < 8'h1B & {1'h0, spad_row_offset_26} + _GEN_2 > 9'h1A;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_27 = spad_row_offset_27 < 8'h1C & {1'h0, spad_row_offset_27} + _GEN_2 > 9'h1B;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_28 = spad_row_offset_28 < 8'h1D & {1'h0, spad_row_offset_28} + _GEN_2 > 9'h1C;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_29 = spad_row_offset_29 < 8'h1E & {1'h0, spad_row_offset_29} + _GEN_2 > 9'h1D;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_30 = spad_row_offset_30 < 8'h1F & {1'h0, spad_row_offset_30} + _GEN_2 > 9'h1E;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:43:16, :72:30, :73:{9,28}, :74:{11,29}]
  assign io_out_bits_mask_31 = spad_row_offset_31 < 8'h20 & (|(_GEN_7[8:5]));	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:72:30, :73:{9,28}, :74:{11,29}, :82:84]
  assign io_out_bits_last = last_sending;	// @[generators/gemmini/src/main/scala/gemmini/BeatMerger.scala:61:37]
endmodule

