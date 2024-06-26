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

module CounterController(
  input         clock,
                reset,
  output        io_in_ready,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  input         io_in_valid,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  input  [4:0]  io_in_bits_inst_rd,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  input  [63:0] io_in_bits_rs1,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  input         io_out_ready,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  output        io_out_valid,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  output [4:0]  io_out_bits_rd,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  output [63:0] io_out_bits_data,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  input         io_event_io_event_signal_1,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_2,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_3,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_4,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_5,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_6,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_7,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_8,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_9,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_10,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_11,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_12,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_13,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_14,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_16,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_17,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_18,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_19,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_20,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_21,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_22,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_23,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_24,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_25,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_26,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_27,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_28,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_29,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_30,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_31,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_32,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_33,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_34,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_35,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_36,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_37,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_38,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_39,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_40,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_41,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_42,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_event_signal_43,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  input  [31:0] io_event_io_external_values_1,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_external_values_2,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_external_values_3,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_external_values_4,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_external_values_5,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_external_values_6,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
                io_event_io_external_values_7,	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
  output        io_event_io_external_reset	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:219:14]
);

  wire [63:0] _counterfile_io_data;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:228:29]
  reg  [4:0]  out_reg_rd;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22]
  reg  [63:0] out_reg_data;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22]
  reg         out_valid_reg;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:232:32]
  wire        _counterfile_io_config_address_valid_T_1 = ~out_valid_reg & io_in_valid;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:232:32, :244:20, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire        _GEN = io_out_ready & out_valid_reg;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:232:32, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  always @(posedge clock) begin
    if (_GEN | ~_counterfile_io_config_address_valid_T_1) begin	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22, :253:24, :255:30, src/main/scala/chisel3/util/Decoupled.scala:52:35]
    end
    else begin	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22, :253:24, :255:30]
      out_reg_rd <= io_in_bits_inst_rd;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22]
      out_reg_data <= _counterfile_io_data;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:228:29, :231:22]
    end
    if (reset)
      out_valid_reg <= 1'h0;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22, :232:32]
    else
      out_valid_reg <= ~_GEN & (_counterfile_io_config_address_valid_T_1 | out_valid_reg);	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:232:32, :253:24, :254:21, :255:30, :256:21, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:2];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        out_reg_rd = _RANDOM[2'h0][4:0];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22]
        out_reg_data = {_RANDOM[2'h0][31:5], _RANDOM[2'h1], _RANDOM[2'h2][4:0]};	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22]
        out_valid_reg = _RANDOM[2'h2][5];	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22, :232:32]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  CounterFile counterfile (	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:228:29]
    .clock                         (clock),
    .reset                         (reset),
    .io_counter_reset              (io_in_bits_rs1[0] & _counterfile_io_config_address_valid_T_1),	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:246:{51,55}, src/main/scala/chisel3/util/Decoupled.scala:52:35]
    .io_snapshot                   (io_in_bits_rs1[2] & _counterfile_io_config_address_valid_T_1),	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:248:{46,50}, src/main/scala/chisel3/util/Decoupled.scala:52:35]
    .io_snapshot_reset             (io_in_bits_rs1[1] & _counterfile_io_config_address_valid_T_1),	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:247:{52,56}, src/main/scala/chisel3/util/Decoupled.scala:52:35]
    .io_addr                       (io_in_bits_rs1[6:4]),	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:245:42]
    .io_data                       (_counterfile_io_data),
    .io_config_address_valid       (io_in_bits_rs1[3] & _counterfile_io_config_address_valid_T_1),	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:249:{58,62}, src/main/scala/chisel3/util/Decoupled.scala:52:35]
    .io_config_address_bits        (io_in_bits_rs1[17:12]),	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:250:57]
    .io_external                   (io_in_bits_rs1[31]),	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:251:46]
    .io_event_io_event_signal_1    (io_event_io_event_signal_1),
    .io_event_io_event_signal_2    (io_event_io_event_signal_2),
    .io_event_io_event_signal_3    (io_event_io_event_signal_3),
    .io_event_io_event_signal_4    (io_event_io_event_signal_4),
    .io_event_io_event_signal_5    (io_event_io_event_signal_5),
    .io_event_io_event_signal_6    (io_event_io_event_signal_6),
    .io_event_io_event_signal_7    (io_event_io_event_signal_7),
    .io_event_io_event_signal_8    (io_event_io_event_signal_8),
    .io_event_io_event_signal_9    (io_event_io_event_signal_9),
    .io_event_io_event_signal_10   (io_event_io_event_signal_10),
    .io_event_io_event_signal_11   (io_event_io_event_signal_11),
    .io_event_io_event_signal_12   (io_event_io_event_signal_12),
    .io_event_io_event_signal_13   (io_event_io_event_signal_13),
    .io_event_io_event_signal_14   (io_event_io_event_signal_14),
    .io_event_io_event_signal_16   (io_event_io_event_signal_16),
    .io_event_io_event_signal_17   (io_event_io_event_signal_17),
    .io_event_io_event_signal_18   (io_event_io_event_signal_18),
    .io_event_io_event_signal_19   (io_event_io_event_signal_19),
    .io_event_io_event_signal_20   (io_event_io_event_signal_20),
    .io_event_io_event_signal_21   (io_event_io_event_signal_21),
    .io_event_io_event_signal_22   (io_event_io_event_signal_22),
    .io_event_io_event_signal_23   (io_event_io_event_signal_23),
    .io_event_io_event_signal_24   (io_event_io_event_signal_24),
    .io_event_io_event_signal_25   (io_event_io_event_signal_25),
    .io_event_io_event_signal_26   (io_event_io_event_signal_26),
    .io_event_io_event_signal_27   (io_event_io_event_signal_27),
    .io_event_io_event_signal_28   (io_event_io_event_signal_28),
    .io_event_io_event_signal_29   (io_event_io_event_signal_29),
    .io_event_io_event_signal_30   (io_event_io_event_signal_30),
    .io_event_io_event_signal_31   (io_event_io_event_signal_31),
    .io_event_io_event_signal_32   (io_event_io_event_signal_32),
    .io_event_io_event_signal_33   (io_event_io_event_signal_33),
    .io_event_io_event_signal_34   (io_event_io_event_signal_34),
    .io_event_io_event_signal_35   (io_event_io_event_signal_35),
    .io_event_io_event_signal_36   (io_event_io_event_signal_36),
    .io_event_io_event_signal_37   (io_event_io_event_signal_37),
    .io_event_io_event_signal_38   (io_event_io_event_signal_38),
    .io_event_io_event_signal_39   (io_event_io_event_signal_39),
    .io_event_io_event_signal_40   (io_event_io_event_signal_40),
    .io_event_io_event_signal_41   (io_event_io_event_signal_41),
    .io_event_io_event_signal_42   (io_event_io_event_signal_42),
    .io_event_io_event_signal_43   (io_event_io_event_signal_43),
    .io_event_io_external_values_1 (io_event_io_external_values_1),
    .io_event_io_external_values_2 (io_event_io_external_values_2),
    .io_event_io_external_values_3 (io_event_io_external_values_3),
    .io_event_io_external_values_4 (io_event_io_external_values_4),
    .io_event_io_external_values_5 (io_event_io_external_values_5),
    .io_event_io_external_values_6 (io_event_io_external_values_6),
    .io_event_io_external_values_7 (io_event_io_external_values_7),
    .io_event_io_external_reset    (io_event_io_external_reset)
  );
  assign io_in_ready = ~out_valid_reg;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:232:32, :244:20]
  assign io_out_valid = out_valid_reg;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:232:32]
  assign io_out_bits_rd = out_reg_rd;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22]
  assign io_out_bits_data = out_reg_data;	// @[generators/gemmini/src/main/scala/gemmini/CounterFile.scala:231:22]
endmodule

