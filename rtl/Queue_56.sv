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

module Queue_56(
  input         clock,
                reset,
  output        io_enq_ready,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_valid,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [2:0]  io_enq_bits_opcode,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [1:0]  io_enq_bits_param,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [3:0]  io_enq_bits_size,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_source,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [2:0]  io_enq_bits_sink,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_denied,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [63:0] io_enq_bits_data,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_corrupt,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_ready,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_valid,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [2:0]  io_deq_bits_opcode,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [1:0]  io_deq_bits_param,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [3:0]  io_deq_bits_size,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_source,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [2:0]  io_deq_bits_sink,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_denied,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [63:0] io_deq_bits_data,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_corrupt	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
);

  wire [81:0] _ram_ext_R0_data;	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  reg         wrap;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
  reg         wrap_1;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
  reg         maybe_full;	// @[src/main/scala/chisel3/util/Decoupled.scala:277:27]
  wire        ptr_match = wrap == wrap_1;	// @[src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:278:33]
  wire        empty = ptr_match & ~maybe_full;	// @[src/main/scala/chisel3/util/Decoupled.scala:277:27, :278:33, :279:{25,28}]
  wire        full = ptr_match & maybe_full;	// @[src/main/scala/chisel3/util/Decoupled.scala:277:27, :278:33, :280:24]
  wire        do_enq = ~full & io_enq_valid;	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35, :280:24, :304:19]
  wire        do_deq = io_deq_ready & ~empty;	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35, :279:25, :303:19]
  always @(posedge clock) begin
    if (reset) begin
      wrap <= 1'h0;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
      wrap_1 <= 1'h0;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
      maybe_full <= 1'h0;	// @[src/main/scala/chisel3/util/Decoupled.scala:277:27]
    end
    else begin
      if (do_enq)	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
        wrap <= wrap - 1'h1;	// @[src/main/scala/chisel3/util/Counter.scala:61:40, :77:24]
      if (do_deq)	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
        wrap_1 <= wrap_1 - 1'h1;	// @[src/main/scala/chisel3/util/Counter.scala:61:40, :77:24]
      if (~(do_enq == do_deq))	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35, :277:27, :294:{15,27}, :295:16]
        maybe_full <= do_enq;	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35, :277:27]
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
        wrap = _RANDOM[/*Zero width*/ 1'b0][0];	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
        wrap_1 = _RANDOM[/*Zero width*/ 1'b0][1];	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
        maybe_full = _RANDOM[/*Zero width*/ 1'b0][2];	// @[src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:277:27]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  ram_2x82 ram_ext (	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
    .R0_addr (wrap_1),	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (wrap),	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
    .W0_en   (do_enq),	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_corrupt, io_enq_bits_data, io_enq_bits_denied, io_enq_bits_sink, io_enq_bits_source, io_enq_bits_size, io_enq_bits_param, io_enq_bits_opcode})	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  );
  assign io_enq_ready = ~full;	// @[src/main/scala/chisel3/util/Decoupled.scala:280:24, :304:19]
  assign io_deq_valid = ~empty;	// @[src/main/scala/chisel3/util/Decoupled.scala:279:25, :303:19]
  assign io_deq_bits_opcode = _ram_ext_R0_data[2:0];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_param = _ram_ext_R0_data[4:3];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_size = _ram_ext_R0_data[8:5];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_source = _ram_ext_R0_data[12:9];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_sink = _ram_ext_R0_data[15:13];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_denied = _ram_ext_R0_data[16];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_data = _ram_ext_R0_data[80:17];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_corrupt = _ram_ext_R0_data[81];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
endmodule

