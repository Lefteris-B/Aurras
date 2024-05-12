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

module TLXbar_10(
  input         clock,
                reset,
  output        auto_in_1_a_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_1_a_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_1_a_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_1_a_bits_param,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_in_1_a_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_1_a_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [31:0] auto_in_1_a_bits_address,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [7:0]  auto_in_1_a_bits_mask,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [63:0] auto_in_1_a_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_1_a_bits_corrupt,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_1_d_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_1_d_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_in_1_d_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [1:0]  auto_in_1_d_bits_param,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_in_1_d_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_in_1_d_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_1_d_bits_sink,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_1_d_bits_denied,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [63:0] auto_in_1_d_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_1_d_bits_corrupt,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_0_a_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_0_a_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_0_a_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_0_a_bits_param,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_in_0_a_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_in_0_a_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [31:0] auto_in_0_a_bits_address,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [7:0]  auto_in_0_a_bits_mask,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [63:0] auto_in_0_a_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_0_a_bits_corrupt,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_0_d_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_0_d_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_in_0_d_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [1:0]  auto_in_0_d_bits_param,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_in_0_d_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_in_0_d_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_in_0_d_bits_sink,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_0_d_bits_denied,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [63:0] auto_in_0_d_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_0_d_bits_corrupt,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_a_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_a_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_out_a_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_out_a_bits_param,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_out_a_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_out_a_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [31:0] auto_out_a_bits_address,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [7:0]  auto_out_a_bits_mask,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [63:0] auto_out_a_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_a_bits_corrupt,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_out_d_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_d_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_out_d_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [1:0]  auto_out_d_bits_param,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_out_d_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_out_d_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_out_d_bits_sink,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_d_bits_denied,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [63:0] auto_out_d_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_d_bits_corrupt	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
);

  reg  [8:0]  beatsLeft;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:60:30]
  wire        idle = beatsLeft == 9'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:60:30, :61:28, generators/rocket-chip/src/main/scala/tilelink/Edges.scala:222:14]
  wire [1:0]  readys_valid = {auto_in_1_a_valid, auto_in_0_a_valid};	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:68:51]
  reg  [1:0]  readys_mask;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:23:23]
  wire [1:0]  _readys_filter_T_1 = readys_valid & ~readys_mask;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:23:23, :24:{28,30}, :68:51]
  wire [1:0]  readys_readys = ~({readys_mask[1], _readys_filter_T_1[1] | readys_mask[0]} & ({_readys_filter_T_1[0], auto_in_1_a_valid} | _readys_filter_T_1));	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:23:23, :24:28, :25:58, :26:{18,29,39}, generators/rocket-chip/src/main/scala/util/package.scala:254:43]
  wire        winner_0 = readys_readys[0] & auto_in_0_a_valid;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:26:18, :68:76, :71:69]
  wire        winner_1 = readys_readys[1] & auto_in_1_a_valid;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:26:18, :68:76, :71:69]
  wire        _out_0_a_valid_T = auto_in_0_a_valid | auto_in_1_a_valid;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:79:31]
  `ifndef SYNTHESIS	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:77:13]
    always @(posedge clock) begin	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:77:13]
      if (~reset & ~(~winner_0 | ~winner_1)) begin	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:71:69, :77:{13,56,59,62}]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:77:13]
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:77:13]
        if (`STOP_COND_)	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:77:13]
          $fatal;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:77:13]
      end
      if (~reset & ~(~_out_0_a_valid_T | winner_0 | winner_1)) begin	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:71:69, :77:13, :79:{14,15,31,36}]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:79:14]
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:79:14]
        if (`STOP_COND_)	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:79:14]
          $fatal;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:79:14]
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg         state_0;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:88:26]
  reg         state_1;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:88:26]
  wire        muxState_0 = idle ? winner_0 : state_0;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:61:28, :71:69, :88:26, :89:25]
  wire        muxState_1 = idle ? winner_1 : state_1;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:61:28, :71:69, :88:26, :89:25]
  wire        out_0_a_valid = idle ? _out_0_a_valid_T : state_0 & auto_in_0_a_valid | state_1 & auto_in_1_a_valid;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:61:28, :79:31, :88:26, :96:24, src/main/scala/chisel3/util/Mux.scala:30:73]
  wire [26:0] _beatsAI_decode_T_5 = 27'hFFF << auto_in_1_a_bits_size;	// @[generators/rocket-chip/src/main/scala/util/package.scala:235:71]
  wire [26:0] _beatsAI_decode_T_1 = 27'hFFF << auto_in_0_a_bits_size;	// @[generators/rocket-chip/src/main/scala/util/package.scala:235:71]
  wire [1:0]  _readys_mask_T = readys_readys & readys_valid;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:26:18, :28:29, :68:51]
  wire        latch = idle & auto_out_a_ready;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:61:28, :62:24]
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 9'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:60:30, generators/rocket-chip/src/main/scala/tilelink/Edges.scala:222:14]
      readys_mask <= 2'h3;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:23:23]
      state_0 <= 1'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:88:26]
      state_1 <= 1'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:88:26]
    end
    else begin
      if (latch)	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:62:24]
        beatsLeft <= (winner_0 & ~(auto_in_0_a_bits_opcode[2]) ? ~(_beatsAI_decode_T_1[11:3]) : 9'h0) | (winner_1 & ~(auto_in_1_a_bits_opcode[2]) ? ~(_beatsAI_decode_T_5[11:3]) : 9'h0);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:60:30, :71:69, :82:69, :84:44, generators/rocket-chip/src/main/scala/tilelink/Edges.scala:93:{28,37}, :222:14, generators/rocket-chip/src/main/scala/util/package.scala:235:{46,71,76}]
      else	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:62:24]
        beatsLeft <= beatsLeft - {8'h0, auto_out_a_ready & out_0_a_valid};	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:60:30, :85:52, :96:24, generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:74, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      if (latch & (|readys_valid))	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:27:{18,27}, :62:24, :68:51]
        readys_mask <= _readys_mask_T | {_readys_mask_T[0], 1'h0};	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:23:23, :28:29, generators/rocket-chip/src/main/scala/util/package.scala:245:{43,53}]
      if (idle) begin	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:61:28]
        state_0 <= winner_0;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:71:69, :88:26]
        state_1 <= winner_1;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:71:69, :88:26]
      end
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:0];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        beatsLeft = _RANDOM[/*Zero width*/ 1'b0][8:0];	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:60:30]
        readys_mask = _RANDOM[/*Zero width*/ 1'b0][10:9];	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:23:23, :60:30]
        state_0 = _RANDOM[/*Zero width*/ 1'b0][11];	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:60:30, :88:26]
        state_1 = _RANDOM[/*Zero width*/ 1'b0][12];	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:60:30, :88:26]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign auto_in_1_a_ready = auto_out_a_ready & (idle ? readys_readys[1] : state_1);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:26:18, :61:28, :68:76, :88:26, :92:24, :94:31]
  assign auto_in_1_d_valid = auto_out_d_valid & ~(auto_out_d_bits_source[3]);	// @[generators/rocket-chip/src/main/scala/diplomacy/Parameters.scala:54:{10,32}, generators/rocket-chip/src/main/scala/tilelink/Xbar.scala:351:40]
  assign auto_in_1_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_1_d_bits_param = auto_out_d_bits_param;
  assign auto_in_1_d_bits_size = auto_out_d_bits_size;
  assign auto_in_1_d_bits_source = auto_out_d_bits_source[2:0];	// @[generators/rocket-chip/src/main/scala/tilelink/Xbar.scala:152:69]
  assign auto_in_1_d_bits_sink = auto_out_d_bits_sink;
  assign auto_in_1_d_bits_denied = auto_out_d_bits_denied;
  assign auto_in_1_d_bits_data = auto_out_d_bits_data;
  assign auto_in_1_d_bits_corrupt = auto_out_d_bits_corrupt;
  assign auto_in_0_a_ready = auto_out_a_ready & (idle ? readys_readys[0] : state_0);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:26:18, :61:28, :68:76, :88:26, :92:24, :94:31]
  assign auto_in_0_d_valid = auto_out_d_valid & auto_out_d_bits_source[3];	// @[generators/rocket-chip/src/main/scala/diplomacy/Parameters.scala:54:10, generators/rocket-chip/src/main/scala/tilelink/Xbar.scala:351:40]
  assign auto_in_0_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_0_d_bits_param = auto_out_d_bits_param;
  assign auto_in_0_d_bits_size = auto_out_d_bits_size;
  assign auto_in_0_d_bits_source = auto_out_d_bits_source[2:0];	// @[generators/rocket-chip/src/main/scala/tilelink/Xbar.scala:152:69]
  assign auto_in_0_d_bits_sink = auto_out_d_bits_sink;
  assign auto_in_0_d_bits_denied = auto_out_d_bits_denied;
  assign auto_in_0_d_bits_data = auto_out_d_bits_data;
  assign auto_in_0_d_bits_corrupt = auto_out_d_bits_corrupt;
  assign auto_out_a_valid = out_0_a_valid;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:96:24]
  assign auto_out_a_bits_opcode = (muxState_0 ? auto_in_0_a_bits_opcode : 3'h0) | (muxState_1 ? auto_in_1_a_bits_opcode : 3'h0);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:89:25, generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:74, src/main/scala/chisel3/util/Mux.scala:30:73]
  assign auto_out_a_bits_param = (muxState_0 ? auto_in_0_a_bits_param : 3'h0) | (muxState_1 ? auto_in_1_a_bits_param : 3'h0);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:89:25, generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:74, src/main/scala/chisel3/util/Mux.scala:30:73]
  assign auto_out_a_bits_size = (muxState_0 ? auto_in_0_a_bits_size : 4'h0) | (muxState_1 ? auto_in_1_a_bits_size : 4'h0);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:89:25, generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:74, src/main/scala/chisel3/util/Mux.scala:30:73]
  assign auto_out_a_bits_source = (muxState_0 ? {1'h1, auto_in_0_a_bits_source} : 4'h0) | (muxState_1 ? {1'h0, auto_in_1_a_bits_source} : 4'h0);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:89:25, generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:74, generators/rocket-chip/src/main/scala/tilelink/Xbar.scala:162:{29,55}, src/main/scala/chisel3/util/Mux.scala:30:73]
  assign auto_out_a_bits_address = (muxState_0 ? auto_in_0_a_bits_address : 32'h0) | (muxState_1 ? auto_in_1_a_bits_address : 32'h0);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:89:25, generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:74, src/main/scala/chisel3/util/Mux.scala:30:73]
  assign auto_out_a_bits_mask = (muxState_0 ? auto_in_0_a_bits_mask : 8'h0) | (muxState_1 ? auto_in_1_a_bits_mask : 8'h0);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:89:25, generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:74, src/main/scala/chisel3/util/Mux.scala:30:73]
  assign auto_out_a_bits_data = (muxState_0 ? auto_in_0_a_bits_data : 64'h0) | (muxState_1 ? auto_in_1_a_bits_data : 64'h0);	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:89:25, generators/rocket-chip/src/main/scala/tilelink/Bundles.scala:259:74, src/main/scala/chisel3/util/Mux.scala:30:73]
  assign auto_out_a_bits_corrupt = muxState_0 & auto_in_0_a_bits_corrupt | muxState_1 & auto_in_1_a_bits_corrupt;	// @[generators/rocket-chip/src/main/scala/tilelink/Arbiter.scala:89:25, src/main/scala/chisel3/util/Mux.scala:30:73]
  assign auto_out_d_ready = auto_out_d_bits_source[3] & auto_in_0_d_ready | ~(auto_out_d_bits_source[3]) & auto_in_1_d_ready;	// @[generators/rocket-chip/src/main/scala/diplomacy/Parameters.scala:54:{10,32}, src/main/scala/chisel3/util/Mux.scala:30:73]
endmodule

