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

module MultiHeadedQueue(
  input         clock,
                reset,
  output        io_enq_ready,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  input         io_enq_valid,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  input  [6:0]  io_enq_bits_cmd_inst_funct,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  input  [63:0] io_enq_bits_cmd_rs1,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
                io_enq_bits_cmd_rs2,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  input  [5:0]  io_enq_bits_rob_id_bits,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  output        io_deq_valid_0,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
                io_deq_valid_1,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  output [6:0]  io_deq_bits_0_cmd_inst_funct,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  output [63:0] io_deq_bits_0_cmd_rs1,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
                io_deq_bits_0_cmd_rs2,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  output [5:0]  io_deq_bits_0_rob_id_bits,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  output [6:0]  io_deq_bits_1_cmd_inst_funct,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  output [63:0] io_deq_bits_1_cmd_rs1,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
                io_deq_bits_1_cmd_rs2,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  output [5:0]  io_deq_bits_1_rob_id_bits,	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
  input         io_deq_pop	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
);

  reg  [6:0]  regs_0_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
  reg  [63:0] regs_0_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
  reg  [63:0] regs_0_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
  reg  [5:0]  regs_0_rob_id_bits;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
  reg  [6:0]  regs_1_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
  reg  [63:0] regs_1_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
  reg  [63:0] regs_1_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
  reg  [5:0]  regs_1_rob_id_bits;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
  reg         raddr;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:23:22]
  reg         waddr;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:24:22]
  reg  [1:0]  len;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:25:20]
  wire        _raddr_T_11 = 1'h1 - raddr;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14, :23:22, generators/gemmini/src/main/scala/gemmini/Util.scala:13:57]
  wire        _io_deq_bits_1_T_19 = raddr ? 1'h1 - _raddr_T_11 - 1'h1 : raddr - 1'h1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14, :23:22, generators/gemmini/src/main/scala/gemmini/Util.scala:13:{10,48,57,62,71}]
  wire [1:0]  _GEN = {1'h0, io_deq_pop};	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, generators/gemmini/src/main/scala/gemmini/Util.scala:13:22]
  `ifndef SYNTHESIS	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:48:9]
    always @(posedge clock) begin	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:48:9]
      if (~reset & _GEN > len) begin	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:25:20, :48:{9,21}, generators/gemmini/src/main/scala/gemmini/Util.scala:13:22]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:48:9]
          $error("Assertion failed\n    at MultiHeadedQueue.scala:48 assert(io.deq.pop <= len && io.deq.pop <= heads.U && io.deq.pop <= maxpop.U)\n");	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:48:9]
        if (`STOP_COND_)	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:48:9]
          $fatal;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:48:9]
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        _len_T_4 = ~(len[1]) & io_enq_valid;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:25:20, :27:23, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  always @(posedge clock) begin
    if (_len_T_4 & ~waddr) begin	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :24:22, :36:22, :37:17, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      regs_0_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
      regs_0_cmd_rs1 <= io_enq_bits_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
      regs_0_cmd_rs2 <= io_enq_bits_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
      regs_0_rob_id_bits <= io_enq_bits_rob_id_bits;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
    end
    if (_len_T_4 & waddr) begin	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :24:22, :36:22, :37:17, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      regs_1_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
      regs_1_cmd_rs1 <= io_enq_bits_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
      regs_1_cmd_rs2 <= io_enq_bits_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
      regs_1_rob_id_bits <= io_enq_bits_rob_id_bits;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
    end
    if (reset) begin
      raddr <= 1'h0;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :23:22]
      waddr <= 1'h0;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :24:22]
      len <= 2'h0;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:25:20]
    end
    else begin
      if (io_deq_pop) begin	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14]
        if (raddr >= 1'h1 - io_deq_pop - 1'h1 & io_deq_pop)	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14, :23:22, generators/gemmini/src/main/scala/gemmini/Util.scala:13:{13,22,26,32}]
          raddr <= io_deq_pop - _raddr_T_11 - 1'h1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:23:22, generators/gemmini/src/main/scala/gemmini/Util.scala:13:{48,57,62}]
        else	// @[generators/gemmini/src/main/scala/gemmini/Util.scala:13:32]
          raddr <= raddr + io_deq_pop;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:23:22, generators/gemmini/src/main/scala/gemmini/Util.scala:13:71]
        len <= len - _GEN + {1'h0, _len_T_4};	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :25:20, :45:{16,29}, generators/gemmini/src/main/scala/gemmini/Util.scala:13:22, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      end
      else if (_len_T_4)	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
        len <= len + 2'h1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:25:20, :39:16, generators/gemmini/src/main/scala/gemmini/Util.scala:13:57]
      if (_len_T_4) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
        if (waddr)	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:24:22]
          waddr <= 1'h1 - (1'h1 - waddr) - 1'h1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:8:14, :24:22, generators/gemmini/src/main/scala/gemmini/Util.scala:13:{48,57,62}]
        else	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:24:22]
          waddr <= waddr - 1'h1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:24:22, generators/gemmini/src/main/scala/gemmini/Util.scala:13:71]
      end
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:17];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h12; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        regs_0_cmd_inst_funct = _RANDOM[5'h0][6:0];	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
        regs_0_cmd_rs1 = {_RANDOM[5'h1], _RANDOM[5'h2]};	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
        regs_0_cmd_rs2 = {_RANDOM[5'h3], _RANDOM[5'h4]};	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
        regs_0_rob_id_bits = _RANDOM[5'h8][15:10];	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
        regs_1_cmd_inst_funct = _RANDOM[5'h8][24:18];	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
        regs_1_cmd_rs1 = {_RANDOM[5'h9][31:18], _RANDOM[5'hA], _RANDOM[5'hB][17:0]};	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
        regs_1_cmd_rs2 = {_RANDOM[5'hB][31:18], _RANDOM[5'hC], _RANDOM[5'hD][17:0]};	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
        regs_1_rob_id_bits = {_RANDOM[5'h10][31:28], _RANDOM[5'h11][1:0]};	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17]
        raddr = _RANDOM[5'h11][4];	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :23:22]
        waddr = _RANDOM[5'h11][5];	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :24:22]
        len = _RANDOM[5'h11][7:6];	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :25:20]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_enq_ready = ~(len[1]);	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:25:20, :27:23]
  assign io_deq_valid_0 = |len;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:25:20, :31:28]
  assign io_deq_valid_1 = len[1];	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:25:20, :31:28]
  assign io_deq_bits_0_cmd_inst_funct = raddr ? regs_1_cmd_inst_funct : regs_0_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :23:22, :32:20]
  assign io_deq_bits_0_cmd_rs1 = raddr ? regs_1_cmd_rs1 : regs_0_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :23:22, :32:20]
  assign io_deq_bits_0_cmd_rs2 = raddr ? regs_1_cmd_rs2 : regs_0_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :23:22, :32:20]
  assign io_deq_bits_0_rob_id_bits = raddr ? regs_1_rob_id_bits : regs_0_rob_id_bits;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :23:22, :32:20]
  assign io_deq_bits_1_cmd_inst_funct = _io_deq_bits_1_T_19 ? regs_1_cmd_inst_funct : regs_0_cmd_inst_funct;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :32:20, generators/gemmini/src/main/scala/gemmini/Util.scala:13:10]
  assign io_deq_bits_1_cmd_rs1 = _io_deq_bits_1_T_19 ? regs_1_cmd_rs1 : regs_0_cmd_rs1;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :32:20, generators/gemmini/src/main/scala/gemmini/Util.scala:13:10]
  assign io_deq_bits_1_cmd_rs2 = _io_deq_bits_1_T_19 ? regs_1_cmd_rs2 : regs_0_cmd_rs2;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :32:20, generators/gemmini/src/main/scala/gemmini/Util.scala:13:10]
  assign io_deq_bits_1_rob_id_bits = _io_deq_bits_1_T_19 ? regs_1_rob_id_bits : regs_0_rob_id_bits;	// @[generators/gemmini/src/main/scala/gemmini/MultiHeadedQueue.scala:22:17, :32:20, generators/gemmini/src/main/scala/gemmini/Util.scala:13:10]
endmodule
