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

module Pipeline_11(
  input         clock,
                reset,
  output        io_in_ready,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  input         io_in_valid,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  input  [6:0]  io_in_bits_cmd_inst_funct,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  input  [63:0] io_in_bits_cmd_rs1,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
                io_in_bits_cmd_rs2,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  input  [67:0] io_in_bits_dram_addr,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  input  [50:0] io_in_bits_spad_addr,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  input  [19:0] io_in_bits_I,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  input  [17:0] io_in_bits_K,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  input         io_out_ready,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  output        io_out_valid,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  output [6:0]  io_out_bits_cmd_inst_funct,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  output [63:0] io_out_bits_cmd_rs1,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
                io_out_bits_cmd_rs2,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  output [67:0] io_out_bits_dram_addr,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  output [50:0] io_out_bits_spad_addr,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  output [19:0] io_out_bits_I,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  output [17:0] io_out_bits_K,	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
  output        io_busy	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14]
);

  reg  [6:0]  stages_0_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [63:0] stages_0_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [63:0] stages_0_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [67:0] stages_0_dram_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [50:0] stages_0_spad_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [19:0] stages_0_I;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [17:0] stages_0_K;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [6:0]  stages_1_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [63:0] stages_1_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [63:0] stages_1_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [67:0] stages_1_dram_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [50:0] stages_1_spad_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [19:0] stages_1_I;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg  [17:0] stages_1_K;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  reg         valids_0;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:22:25]
  reg         valids_1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:22:25]
  wire        stalling_1 = valids_1 & ~io_out_ready;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:22:25, :28:{34,37}]
  wire        stalling_0 = valids_0 & stalling_1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:22:25, :28:34, :30:16]
  wire        _GEN = ~stalling_0 & io_in_valid;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:27:20, :30:16, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  always @(posedge clock) begin
    if (_GEN) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
      stages_0_cmd_inst_funct <= io_in_bits_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_0_cmd_rs1 <= io_in_bits_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_0_cmd_rs2 <= io_in_bits_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_0_dram_addr <= io_in_bits_dram_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_0_spad_addr <= io_in_bits_spad_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_0_I <= io_in_bits_I;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_0_K <= io_in_bits_K;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
    end
    if (~stalling_1) begin	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:28:34]
      stages_1_cmd_inst_funct <= stages_0_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_1_cmd_rs1 <= stages_0_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_1_cmd_rs2 <= stages_0_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_1_dram_addr <= stages_0_dram_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_1_spad_addr <= stages_0_spad_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_1_I <= stages_0_I;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
      stages_1_K <= stages_0_K;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
    end
    if (reset) begin
      valids_0 <= 1'h0;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14, :22:25]
      valids_1 <= 1'h0;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:7:14, :22:25]
    end
    else begin
      valids_0 <= _GEN | stalling_1 & valids_0;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:22:25, :28:34, :40:17, :41:12, :45:22, :46:19, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      valids_1 <= valids_0 | ~io_out_ready & valids_1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:22:25, :36:24, :37:19, :49:16, :50:12]
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:26];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h1B; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        stages_0_cmd_inst_funct = _RANDOM[5'h0][6:0];	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_0_cmd_rs1 = {_RANDOM[5'h1], _RANDOM[5'h2]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_0_cmd_rs2 = {_RANDOM[5'h3], _RANDOM[5'h4]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_0_dram_addr = {_RANDOM[5'h8][31:9], _RANDOM[5'h9], _RANDOM[5'hA][12:0]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_0_spad_addr = {_RANDOM[5'hA][31:13], _RANDOM[5'hB]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_0_I = _RANDOM[5'hC][19:0];	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_0_K = {_RANDOM[5'hC][31:20], _RANDOM[5'hD][5:0]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_1_cmd_inst_funct = _RANDOM[5'hD][12:6];	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_1_cmd_rs1 = {_RANDOM[5'hE][31:6], _RANDOM[5'hF], _RANDOM[5'h10][5:0]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_1_cmd_rs2 = {_RANDOM[5'h10][31:6], _RANDOM[5'h11], _RANDOM[5'h12][5:0]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_1_dram_addr = {_RANDOM[5'h15][31:15], _RANDOM[5'h16], _RANDOM[5'h17][18:0]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_1_spad_addr = {_RANDOM[5'h17][31:19], _RANDOM[5'h18], _RANDOM[5'h19][5:0]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_1_I = _RANDOM[5'h19][25:6];	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        stages_1_K = {_RANDOM[5'h19][31:26], _RANDOM[5'h1A][11:0]};	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
        valids_0 = _RANDOM[5'h1A][12];	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21, :22:25]
        valids_1 = _RANDOM[5'h1A][13];	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21, :22:25]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = ~stalling_0;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:27:20, :30:16]
  assign io_out_valid = valids_1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:22:25]
  assign io_out_bits_cmd_inst_funct = stages_1_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  assign io_out_bits_cmd_rs1 = stages_1_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  assign io_out_bits_cmd_rs2 = stages_1_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  assign io_out_bits_dram_addr = stages_1_dram_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  assign io_out_bits_spad_addr = stages_1_spad_addr;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  assign io_out_bits_I = stages_1_I;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  assign io_out_bits_K = stages_1_K;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:21:21]
  assign io_busy = io_in_valid | valids_0 | valids_1;	// @[generators/gemmini/src/main/scala/gemmini/Pipeline.scala:22:25, :24:28]
endmodule

