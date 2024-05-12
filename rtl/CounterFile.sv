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

module CounterFile(
  input         clock,
                reset,
                io_counter_reset,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_snapshot,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_snapshot_reset,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
  input  [2:0]  io_addr,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
  output [63:0] io_data,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
  input         io_config_address_valid,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
  input  [5:0]  io_config_address_bits,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
  input         io_external,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_1,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_2,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_3,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_4,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_5,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_6,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_7,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_8,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_9,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_10,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_11,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_12,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_13,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_14,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_16,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_17,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_18,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_19,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_20,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_21,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_22,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_23,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_24,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_25,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_26,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_27,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_28,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_29,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_30,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_31,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_32,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_33,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_34,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_35,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_36,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_37,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_38,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_39,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_40,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_41,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_42,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_event_signal_43,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
  input  [31:0] io_event_io_external_values_1,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_external_values_2,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_external_values_3,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_external_values_4,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_external_values_5,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_external_values_6,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
                io_event_io_external_values_7,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
  output        io_event_io_external_reset	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14]
);

  reg  [6:0]       counter_config_0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
  reg  [6:0]       counter_config_1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
  reg  [6:0]       counter_config_2;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
  reg  [6:0]       counter_config_3;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
  reg  [6:0]       counter_config_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
  reg  [6:0]       counter_config_5;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
  reg  [6:0]       counter_config_6;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
  reg  [6:0]       counter_config_7;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
  reg              counter_is_external_0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
  reg              counter_is_external_1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
  reg              counter_is_external_2;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
  reg              counter_is_external_3;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
  reg              counter_is_external_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
  reg              counter_is_external_5;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
  reg              counter_is_external_6;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
  reg              counter_is_external_7;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
  reg  [63:0]      counter_snapshot_0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
  reg  [63:0]      counter_snapshot_1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
  reg  [63:0]      counter_snapshot_2;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
  reg  [63:0]      counter_snapshot_3;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
  reg  [63:0]      counter_snapshot_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
  reg  [63:0]      counter_snapshot_5;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
  reg  [63:0]      counter_snapshot_6;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
  reg  [63:0]      counter_snapshot_7;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
  reg  [63:0]      counters_0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
  reg  [63:0]      counters_1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
  reg  [63:0]      counters_2;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
  reg  [63:0]      counters_3;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
  reg  [63:0]      counters_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
  reg  [63:0]      counters_5;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
  reg  [63:0]      counters_6;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
  reg  [63:0]      counters_7;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
  reg              snapshot_enable;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:171:34]
  wire [7:0]       _GEN = {{counter_is_external_7}, {counter_is_external_6}, {counter_is_external_5}, {counter_is_external_4}, {counter_is_external_3}, {counter_is_external_2}, {counter_is_external_1}, {counter_is_external_0}};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32, :181:10]
  wire [7:0][31:0] _GEN_0 = {{io_event_io_external_values_7}, {io_event_io_external_values_6}, {io_event_io_external_values_5}, {io_event_io_external_values_4}, {io_event_io_external_values_3}, {io_event_io_external_values_2}, {io_event_io_external_values_1}, {32'h0}};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :181:10]
  wire [7:0][6:0]  _GEN_1 = {{counter_config_7}, {counter_config_6}, {counter_config_5}, {counter_config_4}, {counter_config_3}, {counter_config_2}, {counter_config_1}, {counter_config_0}};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
  wire [7:0][63:0] _GEN_2 = {{counters_7}, {counters_6}, {counters_5}, {counters_4}, {counters_3}, {counters_2}, {counters_1}, {counters_0}};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27, :181:10]
  wire [7:0][63:0] _GEN_3 = {{counter_snapshot_7}, {counter_snapshot_6}, {counter_snapshot_5}, {counter_snapshot_4}, {counter_snapshot_3}, {counter_snapshot_2}, {counter_snapshot_1}, {counter_snapshot_0}};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35, :198:19]
  wire [6:0]       _GEN_4 = {1'h0, io_config_address_bits};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :202:31]
  wire [18:0]      _GEN_5 = '{1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0, 1'h0};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:209:47]
  wire [63:0]      _GEN_6 = {_GEN_5, {{1'h0}, {io_event_io_event_signal_43}, {io_event_io_event_signal_42}, {io_event_io_event_signal_41}, {io_event_io_event_signal_40}, {io_event_io_event_signal_39}, {io_event_io_event_signal_38}, {io_event_io_event_signal_37}, {io_event_io_event_signal_36}, {io_event_io_event_signal_35}, {io_event_io_event_signal_34}, {io_event_io_event_signal_33}, {io_event_io_event_signal_32}, {io_event_io_event_signal_31}, {io_event_io_event_signal_30}, {io_event_io_event_signal_29}, {io_event_io_event_signal_28}, {io_event_io_event_signal_27}, {io_event_io_event_signal_26}, {io_event_io_event_signal_25}, {io_event_io_event_signal_24}, {io_event_io_event_signal_23}, {io_event_io_event_signal_22}, {io_event_io_event_signal_21}, {io_event_io_event_signal_20}, {io_event_io_event_signal_19}, {io_event_io_event_signal_18}, {io_event_io_event_signal_17}, {io_event_io_event_signal_16}, {1'h0}, {io_event_io_event_signal_14}, {io_event_io_event_signal_13}, {io_event_io_event_signal_12}, {io_event_io_event_signal_11}, {io_event_io_event_signal_10}, {io_event_io_event_signal_9}, {io_event_io_event_signal_8}, {io_event_io_event_signal_7}, {io_event_io_event_signal_6}, {io_event_io_event_signal_5}, {io_event_io_event_signal_4}, {io_event_io_event_signal_3}, {io_event_io_event_signal_2}, {io_event_io_event_signal_1}, {1'h0}}};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :209:47]
  wire             _GEN_7 = io_config_address_valid & io_addr == 3'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
  wire             _GEN_8 = io_config_address_valid & io_addr == 3'h1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
  wire             _GEN_9 = io_config_address_valid & io_addr == 3'h2;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
  wire             _GEN_10 = io_config_address_valid & io_addr == 3'h3;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
  wire             _GEN_11 = io_config_address_valid & io_addr == 3'h4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
  wire             _GEN_12 = io_config_address_valid & io_addr == 3'h5;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
  wire             _GEN_13 = io_config_address_valid & io_addr == 3'h6;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
  wire             _GEN_14 = io_config_address_valid & (&io_addr);	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
  always @(posedge clock) begin
    if (reset) begin
      counter_config_0 <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:{31,62}]
      counter_config_1 <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:{31,62}]
      counter_config_2 <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:{31,62}]
      counter_config_3 <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:{31,62}]
      counter_config_4 <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:{31,62}]
      counter_config_5 <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:{31,62}]
      counter_config_6 <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:{31,62}]
      counter_config_7 <= 7'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:{31,62}]
    end
    else begin
      if (_GEN_7)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counter_config_0 <= _GEN_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :202:31]
      if (_GEN_8)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counter_config_1 <= _GEN_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :202:31]
      if (_GEN_9)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counter_config_2 <= _GEN_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :202:31]
      if (_GEN_10)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counter_config_3 <= _GEN_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :202:31]
      if (_GEN_11)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counter_config_4 <= _GEN_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :202:31]
      if (_GEN_12)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counter_config_5 <= _GEN_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :202:31]
      if (_GEN_13)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counter_config_6 <= _GEN_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :202:31]
      if (_GEN_14)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counter_config_7 <= _GEN_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :202:31]
    end
    if (_GEN_7)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
      counter_is_external_0 <= io_external;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
    if (_GEN_8)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
      counter_is_external_1 <= io_external;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
    if (_GEN_9)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
      counter_is_external_2 <= io_external;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
    if (_GEN_10)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
      counter_is_external_3 <= io_external;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
    if (_GEN_11)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
      counter_is_external_4 <= io_external;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
    if (_GEN_12)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
      counter_is_external_5 <= io_external;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
    if (_GEN_13)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
      counter_is_external_6 <= io_external;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
    if (_GEN_14)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
      counter_is_external_7 <= io_external;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:165:32]
    if (reset | io_counter_reset) begin	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:168:26]
      counter_snapshot_0 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:{35,66}]
      counter_snapshot_1 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:{35,66}]
      counter_snapshot_2 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:{35,66}]
      counter_snapshot_3 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:{35,66}]
      counter_snapshot_4 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:{35,66}]
      counter_snapshot_5 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:{35,66}]
      counter_snapshot_6 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:{35,66}]
      counter_snapshot_7 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:{35,66}]
      counters_0 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      counters_1 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      counters_2 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      counters_3 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      counters_4 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      counters_5 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      counters_6 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      counters_7 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      snapshot_enable <= 1'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :171:34]
    end
    else begin
      if (io_snapshot_reset | ~io_snapshot) begin	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35, :187:30, :189:31]
      end
      else begin	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35, :187:30, :189:31]
        counter_snapshot_0 <= _GEN[io_addr] ? {32'h0, _GEN_0[counter_config_0[2:0]]} : counters_0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :164:31, :169:35, :170:27, :181:10]
        counter_snapshot_1 <= _GEN[io_addr] ? {32'h0, _GEN_0[counter_config_1[2:0]]} : counters_1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :164:31, :169:35, :170:27, :181:10]
        counter_snapshot_2 <= _GEN[io_addr] ? {32'h0, _GEN_0[counter_config_2[2:0]]} : counters_2;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :164:31, :169:35, :170:27, :181:10]
        counter_snapshot_3 <= _GEN[io_addr] ? {32'h0, _GEN_0[counter_config_3[2:0]]} : counters_3;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :164:31, :169:35, :170:27, :181:10]
        counter_snapshot_4 <= _GEN[io_addr] ? {32'h0, _GEN_0[counter_config_4[2:0]]} : counters_4;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :164:31, :169:35, :170:27, :181:10]
        counter_snapshot_5 <= _GEN[io_addr] ? {32'h0, _GEN_0[counter_config_5[2:0]]} : counters_5;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :164:31, :169:35, :170:27, :181:10]
        counter_snapshot_6 <= _GEN[io_addr] ? {32'h0, _GEN_0[counter_config_6[2:0]]} : counters_6;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :164:31, :169:35, :170:27, :181:10]
        counter_snapshot_7 <= _GEN[io_addr] ? {32'h0, _GEN_0[counter_config_7[2:0]]} : counters_7;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :164:31, :169:35, :170:27, :181:10]
      end
      if (_GEN_6[counter_config_0[5:0]] & ~_GEN_7)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31, :209:47, :210:{15,64}, :211:19]
        counters_0 <= counters_0 + 64'h1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27, :211:30]
      else if (_GEN_7)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counters_0 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      if (_GEN_6[counter_config_1[5:0]] & ~_GEN_8)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31, :209:47, :210:{15,64}, :211:19]
        counters_1 <= counters_1 + 64'h1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27, :211:30]
      else if (_GEN_8)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counters_1 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      if (_GEN_6[counter_config_2[5:0]] & ~_GEN_9)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31, :209:47, :210:{15,64}, :211:19]
        counters_2 <= counters_2 + 64'h1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27, :211:30]
      else if (_GEN_9)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counters_2 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      if (_GEN_6[counter_config_3[5:0]] & ~_GEN_10)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31, :209:47, :210:{15,64}, :211:19]
        counters_3 <= counters_3 + 64'h1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27, :211:30]
      else if (_GEN_10)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counters_3 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      if (_GEN_6[counter_config_4[5:0]] & ~_GEN_11)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31, :209:47, :210:{15,64}, :211:19]
        counters_4 <= counters_4 + 64'h1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27, :211:30]
      else if (_GEN_11)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counters_4 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      if (_GEN_6[counter_config_5[5:0]] & ~_GEN_12)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31, :209:47, :210:{15,64}, :211:19]
        counters_5 <= counters_5 + 64'h1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27, :211:30]
      else if (_GEN_12)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counters_5 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      if (_GEN_6[counter_config_6[5:0]] & ~_GEN_13)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31, :209:47, :210:{15,64}, :211:19]
        counters_6 <= counters_6 + 64'h1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27, :211:30]
      else if (_GEN_13)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counters_6 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      if (_GEN_6[counter_config_7[5:0]] & ~_GEN_14)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31, :209:47, :210:{15,64}, :211:19]
        counters_7 <= counters_7 + 64'h1;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27, :211:30]
      else if (_GEN_14)	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :201:36, :202:31]
        counters_7 <= 64'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:66, :170:27]
      snapshot_enable <= ~io_snapshot_reset & (io_snapshot | snapshot_enable);	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:171:34, :187:30, :188:23, :189:31, :190:23]
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:34];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [5:0] i = 6'h0; i < 6'h23; i += 6'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        counter_config_0 = _RANDOM[6'h0][6:0];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
        counter_config_1 = _RANDOM[6'h0][13:7];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
        counter_config_2 = _RANDOM[6'h0][20:14];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
        counter_config_3 = _RANDOM[6'h0][27:21];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
        counter_config_4 = {_RANDOM[6'h0][31:28], _RANDOM[6'h1][2:0]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
        counter_config_5 = _RANDOM[6'h1][9:3];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
        counter_config_6 = _RANDOM[6'h1][16:10];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
        counter_config_7 = _RANDOM[6'h1][23:17];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31]
        counter_is_external_0 = _RANDOM[6'h1][24];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :165:32]
        counter_is_external_1 = _RANDOM[6'h1][25];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :165:32]
        counter_is_external_2 = _RANDOM[6'h1][26];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :165:32]
        counter_is_external_3 = _RANDOM[6'h1][27];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :165:32]
        counter_is_external_4 = _RANDOM[6'h1][28];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :165:32]
        counter_is_external_5 = _RANDOM[6'h1][29];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :165:32]
        counter_is_external_6 = _RANDOM[6'h1][30];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :165:32]
        counter_is_external_7 = _RANDOM[6'h1][31];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:164:31, :165:32]
        counter_snapshot_0 = {_RANDOM[6'h2], _RANDOM[6'h3]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
        counter_snapshot_1 = {_RANDOM[6'h4], _RANDOM[6'h5]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
        counter_snapshot_2 = {_RANDOM[6'h6], _RANDOM[6'h7]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
        counter_snapshot_3 = {_RANDOM[6'h8], _RANDOM[6'h9]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
        counter_snapshot_4 = {_RANDOM[6'hA], _RANDOM[6'hB]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
        counter_snapshot_5 = {_RANDOM[6'hC], _RANDOM[6'hD]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
        counter_snapshot_6 = {_RANDOM[6'hE], _RANDOM[6'hF]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
        counter_snapshot_7 = {_RANDOM[6'h10], _RANDOM[6'h11]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:169:35]
        counters_0 = {_RANDOM[6'h12], _RANDOM[6'h13]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
        counters_1 = {_RANDOM[6'h14], _RANDOM[6'h15]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
        counters_2 = {_RANDOM[6'h16], _RANDOM[6'h17]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
        counters_3 = {_RANDOM[6'h18], _RANDOM[6'h19]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
        counters_4 = {_RANDOM[6'h1A], _RANDOM[6'h1B]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
        counters_5 = {_RANDOM[6'h1C], _RANDOM[6'h1D]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
        counters_6 = {_RANDOM[6'h1E], _RANDOM[6'h1F]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
        counters_7 = {_RANDOM[6'h20], _RANDOM[6'h21]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:170:27]
        snapshot_enable = _RANDOM[6'h22][0];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:171:34]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_data = snapshot_enable ? _GEN_3[io_addr] : _GEN[io_addr] ? {32'h0, _GEN_0[_GEN_1[io_addr][2:0]]} : _GEN_2[io_addr];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:161:14, :171:34, :181:10, :198:19]
  assign io_event_io_external_reset = io_counter_reset;
endmodule

