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

module GenericDeserializer(
  input         clock,
                reset,
  output        io_in_ready,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
  input         io_in_valid,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
  input  [31:0] io_in_bits,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
  input         io_out_ready,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
  output        io_out_valid,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
  output [2:0]  io_out_bits_chanId,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
                io_out_bits_opcode,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
                io_out_bits_param,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
  output [7:0]  io_out_bits_size,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
                io_out_bits_source,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
  output [63:0] io_out_bits_address,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
                io_out_bits_data,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
  output        io_out_bits_corrupt,	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
  output [8:0]  io_out_bits_union	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:240:14]
);

  reg  [31:0] data_0;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
  reg  [31:0] data_1;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
  reg  [31:0] data_2;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
  reg  [31:0] data_3;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
  reg  [31:0] data_4;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
  reg  [31:0] data_5;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
  reg         receiving;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:250:26]
  reg  [2:0]  recvCount;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
  wire        wrap_wrap = recvCount == 3'h5;	// @[src/main/scala/chisel3/util/Counter.scala:61:40, :73:24]
  wire        _GEN = receiving & io_in_valid;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:250:26, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  always @(posedge clock) begin
    if (_GEN & recvCount == 3'h0)	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :258:21, :259:21, src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      data_0 <= io_in_bits;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
    if (_GEN & recvCount == 3'h1)	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :258:21, :259:21, src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      data_1 <= io_in_bits;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
    if (_GEN & recvCount == 3'h2)	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :258:21, :259:21, src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      data_2 <= io_in_bits;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
    if (_GEN & recvCount == 3'h3)	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :258:21, :259:21, src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      data_3 <= io_in_bits;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
    if (_GEN & recvCount == 3'h4)	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :258:21, :259:21, src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      data_4 <= io_in_bits;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
    if (_GEN & recvCount == 3'h5)	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :258:21, :259:21, src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      data_5 <= io_in_bits;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
    if (reset) begin
      receiving <= 1'h1;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:250:26]
      recvCount <= 3'h0;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
    end
    else begin
      receiving <= io_out_ready & ~receiving | ~(_GEN & wrap_wrap) & receiving;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:250:26, :254:19, :262:{19,31}, :264:{22,34}, src/main/scala/chisel3/util/Counter.scala:73:24, :117:24, :118:{16,23}, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      if (_GEN) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
        if (wrap_wrap)	// @[src/main/scala/chisel3/util/Counter.scala:73:24]
          recvCount <= 3'h0;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
        else	// @[src/main/scala/chisel3/util/Counter.scala:73:24]
          recvCount <= recvCount + 3'h1;	// @[src/main/scala/chisel3/util/Counter.scala:61:40, :77:24]
      end
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:6];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h7; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        data_0 = _RANDOM[3'h0];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
        data_1 = _RANDOM[3'h1];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
        data_2 = _RANDOM[3'h2];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
        data_3 = _RANDOM[3'h3];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
        data_4 = _RANDOM[3'h4];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
        data_5 = _RANDOM[3'h5];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17]
        receiving = _RANDOM[3'h6][0];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:250:26]
        recvCount = _RANDOM[3'h6][3:1];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:250:26, src/main/scala/chisel3/util/Counter.scala:61:40]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = receiving;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:250:26]
  assign io_out_valid = ~receiving;	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:250:26, :254:19]
  assign io_out_bits_chanId = data_5[3:1];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :255:38]
  assign io_out_bits_opcode = {data_5[0], data_4[31:30]};	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :255:38]
  assign io_out_bits_param = data_4[29:27];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :255:38]
  assign io_out_bits_size = data_4[26:19];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :255:38]
  assign io_out_bits_source = data_4[18:11];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :255:38]
  assign io_out_bits_address = {data_4[10:0], data_3, data_2[31:11]};	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :255:38]
  assign io_out_bits_data = {data_2[10:0], data_1, data_0[31:11]};	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :255:38]
  assign io_out_bits_corrupt = data_0[10];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :255:38]
  assign io_out_bits_union = data_0[9:1];	// @[generators/testchipip/src/main/scala/serdes/Serdes.scala:248:17, :255:38]
endmodule

