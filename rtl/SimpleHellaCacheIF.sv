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

module SimpleHellaCacheIF(
  input         clock,
                reset,
                io_cache_req_ready,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
  output        io_cache_req_valid,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
  output [63:0] io_cache_s1_data_data,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
  output [7:0]  io_cache_s1_data_mask,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
  input         io_cache_s2_nack,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
                io_cache_resp_valid,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
  input  [6:0]  io_cache_resp_bits_tag,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
  input         io_cache_s2_xcpt_ma_ld,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
                io_cache_s2_xcpt_ma_st,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
                io_cache_s2_xcpt_pf_ld,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
                io_cache_s2_xcpt_pf_st,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
                io_cache_s2_xcpt_ae_ld,	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
                io_cache_s2_xcpt_ae_st	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14]
);

  wire        _req_arb_io_in_0_ready;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:104:23]
  wire        _req_arb_io_out_valid;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:104:23]
  wire        _replayq_io_replay_valid;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:103:23]
  reg         s1_req_fire;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:119:28]
  reg         s2_req_fire;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:120:28]
  reg  [6:0]  s1_req_tag;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:121:27]
  reg  [6:0]  s2_req_tag;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:122:27]
  reg         REG;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:124:18]
  reg  [63:0] io_cache_s1_data_r_data;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:129:32]
  reg  [7:0]  io_cache_s1_data_r_mask;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:129:32]
  `ifndef SYNTHESIS	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:124:9]
    always @(posedge clock) begin	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:124:9]
      if (~reset & ~(~REG | ~s2_req_fire | io_cache_s2_nack)) begin	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:120:28, :124:{9,10,18,40,53}]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:124:9]
          $error("Assertion failed\n    at SimpleHellaCacheIF.scala:124 assert(!RegNext(io.cache.s2_nack) || !s2_req_fire || io.cache.s2_nack)\n");	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:124:9]
        if (`STOP_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:124:9]
          $fatal;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:124:9]
      end
      if (~reset & ~(~io_cache_s2_nack | ~io_cache_req_ready)) begin	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:124:9, :125:{9,10,28,31}]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:125:9]
          $error("Assertion failed\n    at SimpleHellaCacheIF.scala:125 assert(!io.cache.s2_nack || !io.cache.req.ready)\n");	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:125:9]
        if (`STOP_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:125:9]
          $fatal;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:125:9]
      end
      if (~reset & ~(~s2_req_fire | {io_cache_s2_xcpt_ma_ld, io_cache_s2_xcpt_ma_st, io_cache_s2_xcpt_pf_ld, io_cache_s2_xcpt_pf_st, io_cache_s2_xcpt_ae_ld, io_cache_s2_xcpt_ae_st} == 6'h0)) begin	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14, :103:23, :104:23, :120:28, :124:{9,40}, :137:{9,23,44,51}]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:137:9]
          $error("Assertion failed: SimpleHellaCacheIF exception\n    at SimpleHellaCacheIF.scala:137 assert(!s2_req_fire || !io.cache.s2_xcpt.asUInt.orR, \"SimpleHellaCacheIF exception\")\n");	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:137:9]
        if (`STOP_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:137:9]
          $fatal;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:137:9]
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        s0_req_fire = io_cache_req_ready & _req_arb_io_out_valid;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:104:23, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  always @(posedge clock) begin
    s1_req_fire <= s0_req_fire;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:119:28, src/main/scala/chisel3/util/Decoupled.scala:52:35]
    s2_req_fire <= s1_req_fire;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:119:28, :120:28]
    s1_req_tag <= 7'h0;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14, :103:23, :104:23, :121:27]
    s2_req_tag <= s1_req_tag;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:121:27, :122:27]
    REG <= io_cache_s2_nack;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:124:18]
    if (s0_req_fire) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      io_cache_s1_data_r_data <= 64'h0;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:103:23, :104:23, :129:32]
      io_cache_s1_data_r_mask <= 8'h0;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:97:14, :103:23, :104:23, :129:32]
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
        for (logic [2:0] i = 3'h0; i < 3'h5; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        s1_req_fire = _RANDOM[3'h0][0];	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:119:28]
        s2_req_fire = _RANDOM[3'h0][1];	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:119:28, :120:28]
        s1_req_tag = _RANDOM[3'h0][8:2];	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:119:28, :121:27]
        s2_req_tag = _RANDOM[3'h0][15:9];	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:119:28, :122:27]
        REG = _RANDOM[3'h0][16];	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:119:28, :124:18]
        io_cache_s1_data_r_data = {_RANDOM[3'h2][31:8], _RANDOM[3'h3], _RANDOM[3'h4][7:0]};	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:129:32]
        io_cache_s1_data_r_mask = _RANDOM[3'h4][15:8];	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:129:32]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SimpleHellaCacheIFReplayQueue replayq (	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:103:23]
    .clock            (clock),
    .reset            (reset),
    .io_nack_valid    (io_cache_s2_nack & s2_req_fire),	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:120:28, :132:45]
    .io_nack_bits     (s2_req_tag[5:0]),	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:122:27, :133:24]
    .io_resp_valid    (io_cache_resp_valid),
    .io_resp_bits_tag (io_cache_resp_bits_tag),
    .io_replay_ready  (_req_arb_io_in_0_ready),	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:104:23]
    .io_replay_valid  (_replayq_io_replay_valid)
  );
  Arbiter_10 req_arb (	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:104:23]
    .io_in_0_ready (_req_arb_io_in_0_ready),
    .io_in_0_valid (_replayq_io_replay_valid),	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:103:23]
    .io_out_ready  (io_cache_req_ready),
    .io_out_valid  (_req_arb_io_out_valid)
  );
  assign io_cache_req_valid = _req_arb_io_out_valid;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:104:23]
  assign io_cache_s1_data_data = io_cache_s1_data_r_data;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:129:32]
  assign io_cache_s1_data_mask = io_cache_s1_data_r_mask;	// @[generators/rocket-chip/src/main/scala/rocket/SimpleHellaCacheIF.scala:129:32]
endmodule

