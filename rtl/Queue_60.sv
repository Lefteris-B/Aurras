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

module Queue_60(
  input         clock,
                reset,
  output        io_enq_ready,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_valid,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [33:0] io_enq_bits_vaddr,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_laddr_is_acc_addr,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_laddr_accumulate,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_laddr_read_full_acc_row,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [2:0]  io_enq_bits_laddr_norm_cmd,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [11:0] io_enq_bits_laddr_garbage,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_laddr_garbage_bit,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [12:0] io_enq_bits_laddr_data,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [2:0]  io_enq_bits_acc_act,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [31:0] io_enq_bits_acc_scale,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_acc_igelu_qb,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_acc_igelu_qc,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_acc_iexp_qln2,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_acc_iexp_qln2_inv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [7:0]  io_enq_bits_acc_norm_stats_id,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [15:0] io_enq_bits_len,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [7:0]  io_enq_bits_block,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_cmd_id,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_status_debug,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_cease,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_wfi,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [31:0] io_enq_bits_status_isa,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [1:0]  io_enq_bits_status_dprv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_status_dv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [1:0]  io_enq_bits_status_prv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_status_v,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_sd,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [22:0] io_enq_bits_status_zero2,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_status_mpv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_gva,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_mbe,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_sbe,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [1:0]  io_enq_bits_status_sxl,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_uxl,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_status_sd_rv32,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [7:0]  io_enq_bits_status_zero1,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_status_tsr,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_tw,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_tvm,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_mxr,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_sum,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_mprv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input  [1:0]  io_enq_bits_status_xs,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_fs,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_mpp,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_vs,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  input         io_enq_bits_status_spp,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_mpie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_ube,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_spie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_upie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_mie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_hie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_sie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_status_uie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_pool_en,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_enq_bits_store_en,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_ready,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_valid,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [33:0] io_deq_bits_vaddr,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_laddr_is_acc_addr,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_laddr_accumulate,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_laddr_read_full_acc_row,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_laddr_garbage_bit,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [12:0] io_deq_bits_laddr_data,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [15:0] io_deq_bits_len,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [7:0]  io_deq_bits_block,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_status_debug,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_cease,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_wfi,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [31:0] io_deq_bits_status_isa,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [1:0]  io_deq_bits_status_dprv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_status_dv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [1:0]  io_deq_bits_status_prv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_status_v,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_sd,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [22:0] io_deq_bits_status_zero2,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_status_mpv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_gva,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_mbe,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_sbe,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [1:0]  io_deq_bits_status_sxl,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_uxl,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_status_sd_rv32,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [7:0]  io_deq_bits_status_zero1,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_status_tsr,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_tw,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_tvm,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_mxr,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_sum,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_mprv,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output [1:0]  io_deq_bits_status_xs,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_fs,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_mpp,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_vs,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
  output        io_deq_bits_status_spp,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_mpie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_ube,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_spie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_upie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_mie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_hie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_sie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_status_uie,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_pool_en,	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
                io_deq_bits_store_en	// @[src/main/scala/chisel3/util/Decoupled.scala:273:14]
);

  wire         _io_enq_ready_output;	// @[src/main/scala/chisel3/util/Decoupled.scala:304:16, :324:{24,39}]
  wire [181:0] _ram_ext_R0_data;	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  reg  [2:0]   enq_ptr_value;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
  reg  [2:0]   deq_ptr_value;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
  reg          maybe_full;	// @[src/main/scala/chisel3/util/Decoupled.scala:277:27]
  wire         ptr_match = enq_ptr_value == deq_ptr_value;	// @[src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:278:33]
  wire         empty = ptr_match & ~maybe_full;	// @[src/main/scala/chisel3/util/Decoupled.scala:277:27, :278:33, :279:{25,28}]
  wire         do_enq = _io_enq_ready_output & io_enq_valid;	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35, :304:16, :324:{24,39}]
  assign _io_enq_ready_output = io_deq_ready | ~(ptr_match & maybe_full);	// @[src/main/scala/chisel3/util/Decoupled.scala:277:27, :278:33, :280:24, :304:{16,19}, :324:{24,39}]
  wire         do_deq = io_deq_ready & ~empty;	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35, :279:25, :303:19]
  always @(posedge clock) begin
    if (reset) begin
      enq_ptr_value <= 3'h0;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
      deq_ptr_value <= 3'h0;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
      maybe_full <= 1'h0;	// @[src/main/scala/chisel3/util/Decoupled.scala:277:27]
    end
    else begin
      if (do_enq) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
        if (enq_ptr_value == 3'h4)	// @[src/main/scala/chisel3/util/Counter.scala:61:40, :73:24]
          enq_ptr_value <= 3'h0;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
        else	// @[src/main/scala/chisel3/util/Counter.scala:73:24]
          enq_ptr_value <= enq_ptr_value + 3'h1;	// @[src/main/scala/chisel3/util/Counter.scala:61:40, :77:24]
      end
      if (do_deq) begin	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
        if (deq_ptr_value == 3'h4)	// @[src/main/scala/chisel3/util/Counter.scala:61:40, :73:24]
          deq_ptr_value <= 3'h0;	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
        else	// @[src/main/scala/chisel3/util/Counter.scala:73:24]
          deq_ptr_value <= deq_ptr_value + 3'h1;	// @[src/main/scala/chisel3/util/Counter.scala:61:40, :77:24]
      end
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
        enq_ptr_value = _RANDOM[/*Zero width*/ 1'b0][2:0];	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
        deq_ptr_value = _RANDOM[/*Zero width*/ 1'b0][5:3];	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
        maybe_full = _RANDOM[/*Zero width*/ 1'b0][6];	// @[src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:277:27]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  ram_5x182 ram_ext (	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
    .R0_addr (deq_ptr_value),	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (enq_ptr_value),	// @[src/main/scala/chisel3/util/Counter.scala:61:40]
    .W0_en   (do_enq),	// @[src/main/scala/chisel3/util/Decoupled.scala:52:35]
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_store_en, io_enq_bits_pool_en, io_enq_bits_status_uie, io_enq_bits_status_sie, io_enq_bits_status_hie, io_enq_bits_status_mie, io_enq_bits_status_upie, io_enq_bits_status_spie, io_enq_bits_status_ube, io_enq_bits_status_mpie, io_enq_bits_status_spp, io_enq_bits_status_vs, io_enq_bits_status_mpp, io_enq_bits_status_fs, io_enq_bits_status_xs, io_enq_bits_status_mprv, io_enq_bits_status_sum, io_enq_bits_status_mxr, io_enq_bits_status_tvm, io_enq_bits_status_tw, io_enq_bits_status_tsr, io_enq_bits_status_zero1, io_enq_bits_status_sd_rv32, io_enq_bits_status_uxl, io_enq_bits_status_sxl, io_enq_bits_status_sbe, io_enq_bits_status_mbe, io_enq_bits_status_gva, io_enq_bits_status_mpv, io_enq_bits_status_zero2, io_enq_bits_status_sd, io_enq_bits_status_v, io_enq_bits_status_prv, io_enq_bits_status_dv, io_enq_bits_status_dprv, io_enq_bits_status_isa, io_enq_bits_status_wfi, io_enq_bits_status_cease, io_enq_bits_status_debug, io_enq_bits_block, io_enq_bits_len, io_enq_bits_laddr_data, io_enq_bits_laddr_garbage_bit, io_enq_bits_laddr_read_full_acc_row, io_enq_bits_laddr_accumulate, io_enq_bits_laddr_is_acc_addr, io_enq_bits_vaddr})	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  );
  assign io_enq_ready = _io_enq_ready_output;	// @[src/main/scala/chisel3/util/Decoupled.scala:304:16, :324:{24,39}]
  assign io_deq_valid = ~empty;	// @[src/main/scala/chisel3/util/Decoupled.scala:279:25, :303:19]
  assign io_deq_bits_vaddr = _ram_ext_R0_data[33:0];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_laddr_is_acc_addr = _ram_ext_R0_data[34];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_laddr_accumulate = _ram_ext_R0_data[35];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_laddr_read_full_acc_row = _ram_ext_R0_data[36];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_laddr_garbage_bit = _ram_ext_R0_data[37];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_laddr_data = _ram_ext_R0_data[50:38];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_len = _ram_ext_R0_data[66:51];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_block = _ram_ext_R0_data[74:67];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_debug = _ram_ext_R0_data[75];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_cease = _ram_ext_R0_data[76];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_wfi = _ram_ext_R0_data[77];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_isa = _ram_ext_R0_data[109:78];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_dprv = _ram_ext_R0_data[111:110];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_dv = _ram_ext_R0_data[112];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_prv = _ram_ext_R0_data[114:113];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_v = _ram_ext_R0_data[115];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_sd = _ram_ext_R0_data[116];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_zero2 = _ram_ext_R0_data[139:117];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_mpv = _ram_ext_R0_data[140];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_gva = _ram_ext_R0_data[141];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_mbe = _ram_ext_R0_data[142];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_sbe = _ram_ext_R0_data[143];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_sxl = _ram_ext_R0_data[145:144];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_uxl = _ram_ext_R0_data[147:146];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_sd_rv32 = _ram_ext_R0_data[148];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_zero1 = _ram_ext_R0_data[156:149];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_tsr = _ram_ext_R0_data[157];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_tw = _ram_ext_R0_data[158];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_tvm = _ram_ext_R0_data[159];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_mxr = _ram_ext_R0_data[160];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_sum = _ram_ext_R0_data[161];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_mprv = _ram_ext_R0_data[162];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_xs = _ram_ext_R0_data[164:163];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_fs = _ram_ext_R0_data[166:165];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_mpp = _ram_ext_R0_data[168:167];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_vs = _ram_ext_R0_data[170:169];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_spp = _ram_ext_R0_data[171];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_mpie = _ram_ext_R0_data[172];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_ube = _ram_ext_R0_data[173];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_spie = _ram_ext_R0_data[174];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_upie = _ram_ext_R0_data[175];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_mie = _ram_ext_R0_data[176];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_hie = _ram_ext_R0_data[177];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_sie = _ram_ext_R0_data[178];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_status_uie = _ram_ext_R0_data[179];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_pool_en = _ram_ext_R0_data[180];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
  assign io_deq_bits_store_en = _ram_ext_R0_data[181];	// @[src/main/scala/chisel3/util/Decoupled.scala:274:95]
endmodule

