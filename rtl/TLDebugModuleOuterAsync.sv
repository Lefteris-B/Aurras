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

module TLDebugModuleOuterAsync(
  output [2:0]  auto_asource_out_a_mem_0_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [8:0]  auto_asource_out_a_mem_0_address,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [31:0] auto_asource_out_a_mem_0_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_asource_out_a_ridx,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_asource_out_a_widx,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_asource_out_a_safe_ridx_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_asource_out_a_safe_widx_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_asource_out_a_safe_source_reset_n,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_asource_out_a_safe_sink_reset_n,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_asource_out_d_mem_0_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [1:0]  auto_asource_out_d_mem_0_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_asource_out_d_mem_0_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [31:0] auto_asource_out_d_mem_0_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_asource_out_d_ridx,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_asource_out_d_widx,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_asource_out_d_safe_ridx_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_asource_out_d_safe_widx_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_asource_out_d_safe_source_reset_n,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_asource_out_d_safe_sink_reset_n,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                auto_int_out_sync_0,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         io_dmi_clock,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
                io_dmi_reset,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output        io_dmi_req_ready,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  input         io_dmi_req_valid,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  input  [6:0]  io_dmi_req_bits_addr,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  input  [31:0] io_dmi_req_bits_data,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  input  [1:0]  io_dmi_req_bits_op,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  input         io_dmi_resp_ready,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output        io_dmi_resp_valid,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output [31:0] io_dmi_resp_bits_data,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output [1:0]  io_dmi_resp_bits_resp,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output        io_ctrl_dmactive,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  input         io_ctrl_dmactiveAck,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output        io_innerCtrl_mem_0_resumereq,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output [9:0]  io_innerCtrl_mem_0_hartsel,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output        io_innerCtrl_mem_0_ackhavereset,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
                io_innerCtrl_mem_0_hrmask_0,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  input         io_innerCtrl_ridx,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output        io_innerCtrl_widx,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  input         io_innerCtrl_safe_ridx_valid,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  output        io_innerCtrl_safe_widx_valid,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
                io_innerCtrl_safe_source_reset_n,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
  input         io_innerCtrl_safe_sink_reset_n,	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
                io_hgDebugInt_0	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:708:16]
);

  wire        _io_innerCtrl_source_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/util/AsyncQueue.scala:216:24]
  wire        _dmactiveAck_dmactiveAckSync_io_q;	// @[generators/rocket-chip/src/main/scala/util/ShiftReg.scala:45:23]
  wire        _asource_auto_in_a_ready;	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
  wire        _asource_auto_in_d_valid;	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
  wire [2:0]  _asource_auto_in_d_bits_opcode;	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
  wire        _asource_auto_in_d_bits_denied;	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
  wire [31:0] _asource_auto_in_d_bits_data;	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
  wire        _asource_auto_in_d_bits_corrupt;	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
  wire        _dmiBypass_auto_node_out_out_a_valid;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire [2:0]  _dmiBypass_auto_node_out_out_a_bits_opcode;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire [8:0]  _dmiBypass_auto_node_out_out_a_bits_address;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire [31:0] _dmiBypass_auto_node_out_out_a_bits_data;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire        _dmiBypass_auto_node_out_out_d_ready;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire        _dmiBypass_auto_node_in_in_a_ready;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire        _dmiBypass_auto_node_in_in_d_valid;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire        _dmiBypass_auto_node_in_in_d_bits_denied;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire [31:0] _dmiBypass_auto_node_in_in_d_bits_data;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire        _dmiBypass_auto_node_in_in_d_bits_corrupt;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  wire        _dmOuter_auto_dmi_in_a_ready;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire        _dmOuter_auto_dmi_in_d_valid;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire [31:0] _dmOuter_auto_dmi_in_d_bits_data;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire        _dmOuter_auto_int_out_0;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire        _dmOuter_io_ctrl_dmactive;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire        _dmOuter_io_innerCtrl_valid;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire        _dmOuter_io_innerCtrl_bits_resumereq;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire [9:0]  _dmOuter_io_innerCtrl_bits_hartsel;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire        _dmOuter_io_innerCtrl_bits_ackhavereset;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire        _dmOuter_io_innerCtrl_bits_hrmask_0;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
  wire        _dmi2tl_auto_out_a_valid;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
  wire [2:0]  _dmi2tl_auto_out_a_bits_opcode;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
  wire [8:0]  _dmi2tl_auto_out_a_bits_address;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
  wire [31:0] _dmi2tl_auto_out_a_bits_data;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
  wire        _dmi2tl_auto_out_d_ready;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
  wire        _dmiXbar_auto_in_a_ready;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire        _dmiXbar_auto_in_d_valid;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire        _dmiXbar_auto_in_d_bits_denied;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire [31:0] _dmiXbar_auto_in_d_bits_data;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire        _dmiXbar_auto_in_d_bits_corrupt;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire        _dmiXbar_auto_out_1_a_valid;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire [2:0]  _dmiXbar_auto_out_1_a_bits_opcode;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire [6:0]  _dmiXbar_auto_out_1_a_bits_address;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire [31:0] _dmiXbar_auto_out_1_a_bits_data;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire        _dmiXbar_auto_out_1_d_ready;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire        _dmiXbar_auto_out_0_a_valid;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire [2:0]  _dmiXbar_auto_out_0_a_bits_opcode;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire [8:0]  _dmiXbar_auto_out_0_a_bits_address;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire [31:0] _dmiXbar_auto_out_0_a_bits_data;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  wire        _dmiXbar_auto_out_0_d_ready;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
  TLXbar_11 dmiXbar (	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .clock                     (io_dmi_clock),
    .reset                     (io_dmi_reset),
    .auto_in_a_ready           (_dmiXbar_auto_in_a_ready),
    .auto_in_a_valid           (_dmi2tl_auto_out_a_valid),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
    .auto_in_a_bits_opcode     (_dmi2tl_auto_out_a_bits_opcode),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
    .auto_in_a_bits_address    (_dmi2tl_auto_out_a_bits_address),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
    .auto_in_a_bits_data       (_dmi2tl_auto_out_a_bits_data),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
    .auto_in_d_ready           (_dmi2tl_auto_out_d_ready),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
    .auto_in_d_valid           (_dmiXbar_auto_in_d_valid),
    .auto_in_d_bits_denied     (_dmiXbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data       (_dmiXbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt    (_dmiXbar_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready        (_dmOuter_auto_dmi_in_a_ready),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .auto_out_1_a_valid        (_dmiXbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode  (_dmiXbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_address (_dmiXbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_data    (_dmiXbar_auto_out_1_a_bits_data),
    .auto_out_1_d_ready        (_dmiXbar_auto_out_1_d_ready),
    .auto_out_1_d_valid        (_dmOuter_auto_dmi_in_d_valid),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .auto_out_1_d_bits_data    (_dmOuter_auto_dmi_in_d_bits_data),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .auto_out_0_a_ready        (_dmiBypass_auto_node_in_in_a_ready),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .auto_out_0_a_valid        (_dmiXbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode  (_dmiXbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_address (_dmiXbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_data    (_dmiXbar_auto_out_0_a_bits_data),
    .auto_out_0_d_ready        (_dmiXbar_auto_out_0_d_ready),
    .auto_out_0_d_valid        (_dmiBypass_auto_node_in_in_d_valid),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .auto_out_0_d_bits_denied  (_dmiBypass_auto_node_in_in_d_bits_denied),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .auto_out_0_d_bits_data    (_dmiBypass_auto_node_in_in_d_bits_data),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .auto_out_0_d_bits_corrupt (_dmiBypass_auto_node_in_in_d_bits_corrupt)	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
  );
  DMIToTL dmi2tl (	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:673:28]
    .auto_out_a_ready        (_dmiXbar_auto_in_a_ready),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_out_a_valid        (_dmi2tl_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_dmi2tl_auto_out_a_bits_opcode),
    .auto_out_a_bits_address (_dmi2tl_auto_out_a_bits_address),
    .auto_out_a_bits_data    (_dmi2tl_auto_out_a_bits_data),
    .auto_out_d_ready        (_dmi2tl_auto_out_d_ready),
    .auto_out_d_valid        (_dmiXbar_auto_in_d_valid),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_out_d_bits_denied  (_dmiXbar_auto_in_d_bits_denied),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_out_d_bits_data    (_dmiXbar_auto_in_d_bits_data),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_out_d_bits_corrupt (_dmiXbar_auto_in_d_bits_corrupt),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .io_dmi_req_ready        (io_dmi_req_ready),
    .io_dmi_req_valid        (io_dmi_req_valid),
    .io_dmi_req_bits_addr    (io_dmi_req_bits_addr),
    .io_dmi_req_bits_data    (io_dmi_req_bits_data),
    .io_dmi_req_bits_op      (io_dmi_req_bits_op),
    .io_dmi_resp_ready       (io_dmi_resp_ready),
    .io_dmi_resp_valid       (io_dmi_resp_valid),
    .io_dmi_resp_bits_data   (io_dmi_resp_bits_data),
    .io_dmi_resp_bits_resp   (io_dmi_resp_bits_resp)
  );
  TLDebugModuleOuter dmOuter (	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .clock                          (io_dmi_clock),
    .reset                          (io_dmi_reset),
    .auto_dmi_in_a_ready            (_dmOuter_auto_dmi_in_a_ready),
    .auto_dmi_in_a_valid            (_dmiXbar_auto_out_1_a_valid),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_dmi_in_a_bits_opcode      (_dmiXbar_auto_out_1_a_bits_opcode),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_dmi_in_a_bits_address     (_dmiXbar_auto_out_1_a_bits_address),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_dmi_in_a_bits_data        (_dmiXbar_auto_out_1_a_bits_data),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_dmi_in_d_ready            (_dmiXbar_auto_out_1_d_ready),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_dmi_in_d_valid            (_dmOuter_auto_dmi_in_d_valid),
    .auto_dmi_in_d_bits_data        (_dmOuter_auto_dmi_in_d_bits_data),
    .auto_int_out_0                 (_dmOuter_auto_int_out_0),
    .io_ctrl_dmactive               (_dmOuter_io_ctrl_dmactive),
    .io_ctrl_dmactiveAck            (_dmactiveAck_dmactiveAckSync_io_q),	// @[generators/rocket-chip/src/main/scala/util/ShiftReg.scala:45:23]
    .io_innerCtrl_ready             (_io_innerCtrl_source_io_enq_ready),	// @[generators/rocket-chip/src/main/scala/util/AsyncQueue.scala:216:24]
    .io_innerCtrl_valid             (_dmOuter_io_innerCtrl_valid),
    .io_innerCtrl_bits_resumereq    (_dmOuter_io_innerCtrl_bits_resumereq),
    .io_innerCtrl_bits_hartsel      (_dmOuter_io_innerCtrl_bits_hartsel),
    .io_innerCtrl_bits_ackhavereset (_dmOuter_io_innerCtrl_bits_ackhavereset),
    .io_innerCtrl_bits_hrmask_0     (_dmOuter_io_innerCtrl_bits_hrmask_0),
    .io_hgDebugInt_0                (io_hgDebugInt_0)
  );
  IntSyncCrossingSource_5 intsource (	// @[generators/rocket-chip/src/main/scala/interrupts/Crossing.scala:28:31]
    .auto_in_0       (_dmOuter_auto_int_out_0),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .auto_out_sync_0 (auto_int_out_sync_0)
  );
  TLBusBypass dmiBypass (	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .clock                            (io_dmi_clock),
    .reset                            (io_dmi_reset),
    .auto_node_out_out_a_ready        (_asource_auto_in_a_ready),	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
    .auto_node_out_out_a_valid        (_dmiBypass_auto_node_out_out_a_valid),
    .auto_node_out_out_a_bits_opcode  (_dmiBypass_auto_node_out_out_a_bits_opcode),
    .auto_node_out_out_a_bits_address (_dmiBypass_auto_node_out_out_a_bits_address),
    .auto_node_out_out_a_bits_data    (_dmiBypass_auto_node_out_out_a_bits_data),
    .auto_node_out_out_d_ready        (_dmiBypass_auto_node_out_out_d_ready),
    .auto_node_out_out_d_valid        (_asource_auto_in_d_valid),	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
    .auto_node_out_out_d_bits_opcode  (_asource_auto_in_d_bits_opcode),	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
    .auto_node_out_out_d_bits_denied  (_asource_auto_in_d_bits_denied),	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
    .auto_node_out_out_d_bits_data    (_asource_auto_in_d_bits_data),	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
    .auto_node_out_out_d_bits_corrupt (_asource_auto_in_d_bits_corrupt),	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
    .auto_node_in_in_a_ready          (_dmiBypass_auto_node_in_in_a_ready),
    .auto_node_in_in_a_valid          (_dmiXbar_auto_out_0_a_valid),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_node_in_in_a_bits_opcode    (_dmiXbar_auto_out_0_a_bits_opcode),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_node_in_in_a_bits_address   (_dmiXbar_auto_out_0_a_bits_address),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_node_in_in_a_bits_data      (_dmiXbar_auto_out_0_a_bits_data),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_node_in_in_d_ready          (_dmiXbar_auto_out_0_d_ready),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:670:28]
    .auto_node_in_in_d_valid          (_dmiBypass_auto_node_in_in_d_valid),
    .auto_node_in_in_d_bits_denied    (_dmiBypass_auto_node_in_in_d_bits_denied),
    .auto_node_in_in_d_bits_data      (_dmiBypass_auto_node_in_in_d_bits_data),
    .auto_node_in_in_d_bits_corrupt   (_dmiBypass_auto_node_in_in_d_bits_corrupt),
    .io_bypass                        (~_dmOuter_io_ctrl_dmactive | ~_dmactiveAck_dmactiveAckSync_io_q)	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27, :737:{37,55,57}, generators/rocket-chip/src/main/scala/util/ShiftReg.scala:45:23]
  );
  TLAsyncCrossingSource asource (	// @[generators/rocket-chip/src/main/scala/tilelink/AsyncCrossing.scala:89:29]
    .clock                          (io_dmi_clock),
    .reset                          (io_dmi_reset),
    .auto_in_a_ready                (_asource_auto_in_a_ready),
    .auto_in_a_valid                (_dmiBypass_auto_node_out_out_a_valid),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .auto_in_a_bits_opcode          (_dmiBypass_auto_node_out_out_a_bits_opcode),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .auto_in_a_bits_address         (_dmiBypass_auto_node_out_out_a_bits_address),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .auto_in_a_bits_data            (_dmiBypass_auto_node_out_out_a_bits_data),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .auto_in_d_ready                (_dmiBypass_auto_node_out_out_d_ready),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:29]
    .auto_in_d_valid                (_asource_auto_in_d_valid),
    .auto_in_d_bits_opcode          (_asource_auto_in_d_bits_opcode),
    .auto_in_d_bits_denied          (_asource_auto_in_d_bits_denied),
    .auto_in_d_bits_data            (_asource_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt         (_asource_auto_in_d_bits_corrupt),
    .auto_out_a_mem_0_opcode        (auto_asource_out_a_mem_0_opcode),
    .auto_out_a_mem_0_address       (auto_asource_out_a_mem_0_address),
    .auto_out_a_mem_0_data          (auto_asource_out_a_mem_0_data),
    .auto_out_a_ridx                (auto_asource_out_a_ridx),
    .auto_out_a_widx                (auto_asource_out_a_widx),
    .auto_out_a_safe_ridx_valid     (auto_asource_out_a_safe_ridx_valid),
    .auto_out_a_safe_widx_valid     (auto_asource_out_a_safe_widx_valid),
    .auto_out_a_safe_source_reset_n (auto_asource_out_a_safe_source_reset_n),
    .auto_out_a_safe_sink_reset_n   (auto_asource_out_a_safe_sink_reset_n),
    .auto_out_d_mem_0_opcode        (auto_asource_out_d_mem_0_opcode),
    .auto_out_d_mem_0_size          (auto_asource_out_d_mem_0_size),
    .auto_out_d_mem_0_source        (auto_asource_out_d_mem_0_source),
    .auto_out_d_mem_0_data          (auto_asource_out_d_mem_0_data),
    .auto_out_d_ridx                (auto_asource_out_d_ridx),
    .auto_out_d_widx                (auto_asource_out_d_widx),
    .auto_out_d_safe_ridx_valid     (auto_asource_out_d_safe_ridx_valid),
    .auto_out_d_safe_widx_valid     (auto_asource_out_d_safe_widx_valid),
    .auto_out_d_safe_source_reset_n (auto_asource_out_d_safe_source_reset_n),
    .auto_out_d_safe_sink_reset_n   (auto_asource_out_d_safe_sink_reset_n)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 dmactiveAck_dmactiveAckSync (	// @[generators/rocket-chip/src/main/scala/util/ShiftReg.scala:45:23]
    .clock (io_dmi_clock),
    .reset (io_dmi_reset),
    .io_d  (io_ctrl_dmactiveAck),
    .io_q  (_dmactiveAck_dmactiveAckSync_io_q)
  );
  AsyncQueueSource_1 io_innerCtrl_source (	// @[generators/rocket-chip/src/main/scala/util/AsyncQueue.scala:216:24]
    .clock                        (io_dmi_clock),
    .reset                        (io_dmi_reset),
    .io_enq_ready                 (_io_innerCtrl_source_io_enq_ready),
    .io_enq_valid                 (_dmOuter_io_innerCtrl_valid),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .io_enq_bits_resumereq        (_dmOuter_io_innerCtrl_bits_resumereq),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .io_enq_bits_hartsel          (_dmOuter_io_innerCtrl_bits_hartsel),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .io_enq_bits_ackhavereset     (_dmOuter_io_innerCtrl_bits_ackhavereset),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .io_enq_bits_hrmask_0         (_dmOuter_io_innerCtrl_bits_hrmask_0),	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
    .io_async_mem_0_resumereq     (io_innerCtrl_mem_0_resumereq),
    .io_async_mem_0_hartsel       (io_innerCtrl_mem_0_hartsel),
    .io_async_mem_0_ackhavereset  (io_innerCtrl_mem_0_ackhavereset),
    .io_async_mem_0_hrmask_0      (io_innerCtrl_mem_0_hrmask_0),
    .io_async_ridx                (io_innerCtrl_ridx),
    .io_async_widx                (io_innerCtrl_widx),
    .io_async_safe_ridx_valid     (io_innerCtrl_safe_ridx_valid),
    .io_async_safe_widx_valid     (io_innerCtrl_safe_widx_valid),
    .io_async_safe_source_reset_n (io_innerCtrl_safe_source_reset_n),
    .io_async_safe_sink_reset_n   (io_innerCtrl_safe_sink_reset_n)
  );
  assign io_ctrl_dmactive = _dmOuter_io_ctrl_dmactive;	// @[generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:695:27]
endmodule
