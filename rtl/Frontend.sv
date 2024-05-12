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

module Frontend(
  input         clock,
                reset,
                auto_icache_master_out_a_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_icache_master_out_a_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [31:0] auto_icache_master_out_a_bits_address,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_icache_master_out_d_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [2:0]  auto_icache_master_out_d_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [3:0]  auto_icache_master_out_d_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [63:0] auto_icache_master_out_d_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_icache_master_out_d_bits_corrupt,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
                io_cpu_might_request,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_cpu_req_valid,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [33:0] io_cpu_req_bits_pc,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_cpu_req_bits_speculative,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_cpu_resp_ready,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  output        io_cpu_resp_valid,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  output [33:0] io_cpu_resp_bits_pc,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  output [31:0] io_cpu_resp_bits_data,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  output        io_cpu_resp_bits_xcpt_pf_inst,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_cpu_resp_bits_xcpt_gf_inst,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_cpu_resp_bits_xcpt_ae_inst,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_cpu_resp_bits_replay,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_cpu_btb_update_valid,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_cpu_bht_update_valid,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_cpu_flush_icache,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_cpu_progress,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  output        io_ptw_req_bits_valid,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  output [20:0] io_ptw_req_bits_bits_addr,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  output        io_ptw_req_bits_bits_need_gpa,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_ptw_req_bits_bits_vstage1,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_ptw_req_bits_bits_stage2,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_status_debug,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
                io_ptw_pmp_0_cfg_l,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [1:0]  io_ptw_pmp_0_cfg_a,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_0_cfg_x,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [29:0] io_ptw_pmp_0_addr,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [31:0] io_ptw_pmp_0_mask,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_1_cfg_l,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [1:0]  io_ptw_pmp_1_cfg_a,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_1_cfg_x,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [29:0] io_ptw_pmp_1_addr,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [31:0] io_ptw_pmp_1_mask,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_2_cfg_l,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [1:0]  io_ptw_pmp_2_cfg_a,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_2_cfg_x,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [29:0] io_ptw_pmp_2_addr,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [31:0] io_ptw_pmp_2_mask,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_3_cfg_l,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [1:0]  io_ptw_pmp_3_cfg_a,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_3_cfg_x,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [29:0] io_ptw_pmp_3_addr,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [31:0] io_ptw_pmp_3_mask,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_4_cfg_l,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [1:0]  io_ptw_pmp_4_cfg_a,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_4_cfg_x,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [29:0] io_ptw_pmp_4_addr,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [31:0] io_ptw_pmp_4_mask,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_5_cfg_l,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [1:0]  io_ptw_pmp_5_cfg_a,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_5_cfg_x,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [29:0] io_ptw_pmp_5_addr,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [31:0] io_ptw_pmp_5_mask,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_6_cfg_l,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [1:0]  io_ptw_pmp_6_cfg_a,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_6_cfg_x,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [29:0] io_ptw_pmp_6_addr,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [31:0] io_ptw_pmp_6_mask,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_7_cfg_l,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [1:0]  io_ptw_pmp_7_cfg_a,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input         io_ptw_pmp_7_cfg_x,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [29:0] io_ptw_pmp_7_addr,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [31:0] io_ptw_pmp_7_mask,	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
  input  [63:0] io_ptw_customCSRs_csrs_0_value	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
);

  wire [32:0] _io_cpu_npc_T;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:182:28]
  wire        _fq_io_enq_valid_T_6;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:180:52]
  wire [31:0] _tlb_io_resp_paddr;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:101:19]
  wire        _tlb_io_resp_pf_inst;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:101:19]
  wire        _tlb_io_resp_ae_inst;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:101:19]
  wire        _tlb_io_resp_cacheable;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:101:19]
  wire        _fq_io_enq_ready;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:87:64]
  wire [4:0]  _fq_io_mask;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:87:64]
  wire        _icache_io_resp_valid;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:66:26]
  wire [31:0] _icache_io_resp_bits_data;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:66:26]
  wire        _icache_io_resp_bits_ae;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:66:26]
  reg         s1_valid;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:103:21]
  reg         s2_valid;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:104:25]
  wire        s0_valid = io_cpu_req_valid | ~(_fq_io_mask[2]) | ~(_fq_io_mask[3]) & (~s1_valid | ~s2_valid) | ~(_fq_io_mask[4]) & ~s1_valid & ~s2_valid;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:87:64, :103:21, :104:25, :106:{5,16}, :107:{6,17,41,45,55,58}, :108:{6,17,41}, :109:35]
  reg  [33:0] s1_pc;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:111:18]
  reg         s1_speculative;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:112:27]
  reg  [33:0] s2_pc;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:113:22]
  reg         s2_tlb_resp_pf_inst;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24]
  reg         s2_tlb_resp_ae_inst;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24]
  reg         s2_tlb_resp_cacheable;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24]
  wire        _s2_xcpt_T = s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24, :118:37]
  reg         s2_speculative;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:119:31]
  wire [33:0] predicted_npc = {s1_pc[33:2], 2'h0} + 34'h4;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:111:18, :125:25, :152:49]
  reg         s2_replay_REG;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:130:56]
  wire        s2_replay = s2_valid & ~(_fq_io_enq_ready & _fq_io_enq_valid_T_6) | s2_replay_REG;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:87:64, :104:25, :130:{26,29,46,56}, :180:52, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  reg  [1:0]  recent_progress_counter;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:151:40]
  wire        _icache_io_s2_kill_T_2 = s2_speculative & ~(s2_tlb_resp_cacheable & ~(io_ptw_customCSRs_csrs_0_value[3])) | _s2_xcpt_T;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24, :118:37, :119:31, :175:{59,62}, :176:{39,42,71}, generators/rocket-chip/src/main/scala/tile/CustomCSRs.scala:46:69]
  reg         fq_io_enq_valid_REG;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:180:29]
  assign _fq_io_enq_valid_T_6 = fq_io_enq_valid_REG & s2_valid & (_icache_io_resp_valid | _icache_io_s2_kill_T_2);	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:66:26, :104:25, :176:71, :180:{29,52,133}]
  assign _io_cpu_npc_T = io_cpu_req_valid ? io_cpu_req_bits_pc[33:1] : s2_replay ? s2_pc[33:1] : predicted_npc[33:1];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14, :113:22, :125:25, :130:46, :131:16, :182:28]
  `ifndef SYNTHESIS	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:92:9]
    always @(posedge clock) begin	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:92:9]
      if (~reset & ~(~(io_cpu_req_valid | io_cpu_flush_icache | io_cpu_bht_update_valid | io_cpu_btb_update_valid) | io_cpu_might_request)) begin	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:92:{9,10,102,130}]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:92:9]
          $error("Assertion failed\n    at Frontend.scala:92 assert(!(io.cpu.req.valid || io.cpu.sfence.valid || io.cpu.flush_icache || io.cpu.bht_update.valid || io.cpu.btb_update.valid) || io.cpu.might_request)\n");	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:92:9]
        if (`STOP_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:92:9]
          $fatal;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:92:9]
      end
      if (~reset & s2_speculative & io_ptw_customCSRs_csrs_0_value[3] & ~_icache_io_s2_kill_T_2) begin	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:92:9, :119:31, :176:71, :190:{9,113}, generators/rocket-chip/src/main/scala/tile/CustomCSRs.scala:46:69]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:190:9]
          $error("Assertion failed\n    at Frontend.scala:190 assert(!(s2_speculative && io.ptw.customCSRs.asInstanceOf[RocketCustomCSRs].disableSpeculativeICacheRefill && !icache.io.s2_kill))\n");	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:190:9]
        if (`STOP_COND_)	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:190:9]
          $fatal;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:190:9]
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin
    s1_valid <= s0_valid;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:103:21, :109:35]
    s1_pc <= {_io_cpu_npc_T, 1'h0};	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14, :87:64, :101:19, :111:18, :153:24, :182:28, :377:33]
    if (io_cpu_req_valid)	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
      s1_speculative <= io_cpu_req_bits_speculative;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:112:27]
    else if (s2_replay)	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:130:46]
      s1_speculative <= s2_speculative;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:112:27, :119:31]
    else	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:130:46]
      s1_speculative <= s1_speculative | s2_valid & ~s2_speculative;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:104:25, :112:27, :119:31, :137:{41,53,56}]
    if (~s2_replay) begin	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:130:46]
      s2_tlb_resp_pf_inst <= _tlb_io_resp_pf_inst;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:101:19, :117:24]
      s2_tlb_resp_ae_inst <= _tlb_io_resp_ae_inst;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:101:19, :117:24]
      s2_tlb_resp_cacheable <= _tlb_io_resp_cacheable;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:101:19, :117:24]
    end
    fq_io_enq_valid_REG <= s1_valid;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:103:21, :180:29]
    if (reset) begin
      s2_valid <= 1'h0;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14, :87:64, :101:19, :104:25, :153:24]
      s2_pc <= 34'h10000;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:113:22]
      s2_speculative <= 1'h0;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14, :87:64, :101:19, :119:31, :153:24]
      s2_replay_REG <= 1'h1;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:92:9, :130:56]
      recent_progress_counter <= 2'h3;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:124:29, :151:40]
    end
    else begin
      s2_valid <= ~s2_replay & ~io_cpu_req_valid;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:104:25, :130:46, :142:12, :143:{9,21}, :144:{14,17}]
      if (~s2_replay) begin	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:130:46]
        s2_pc <= s1_pc;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:111:18, :113:22]
        s2_speculative <= s1_speculative;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:112:27, :119:31]
      end
      s2_replay_REG <= s2_replay & ~s0_valid;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:109:35, :130:{46,56,67,70}]
      if (io_cpu_progress)	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14]
        recent_progress_counter <= 2'h3;	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:124:29, :151:40]
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:7];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'h8; i += 4'h1) begin
          _RANDOM[i[2:0]] = `RANDOM;
        end
        s1_valid = _RANDOM[3'h0][1];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:103:21]
        s2_valid = _RANDOM[3'h0][2];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:103:21, :104:25]
        s1_pc = {_RANDOM[3'h0][31:3], _RANDOM[3'h1][4:0]};	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:103:21, :111:18]
        s1_speculative = _RANDOM[3'h1][5];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:111:18, :112:27]
        s2_pc = {_RANDOM[3'h1][31:6], _RANDOM[3'h2][7:0]};	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:111:18, :113:22]
        s2_tlb_resp_pf_inst = _RANDOM[3'h5][31];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24]
        s2_tlb_resp_ae_inst = _RANDOM[3'h6][5];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24]
        s2_tlb_resp_cacheable = _RANDOM[3'h6][9];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24]
        s2_speculative = _RANDOM[3'h6][12];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24, :119:31]
        s2_replay_REG = _RANDOM[3'h6][31];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24, :130:56]
        recent_progress_counter = _RANDOM[3'h7][1:0];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:151:40]
        fq_io_enq_valid_REG = _RANDOM[3'h7][2];	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:151:40, :180:29]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  ICache icache (	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:66:26]
    .clock                          (clock),
    .reset                          (reset),
    .auto_master_out_a_ready        (auto_icache_master_out_a_ready),
    .auto_master_out_a_valid        (auto_icache_master_out_a_valid),
    .auto_master_out_a_bits_address (auto_icache_master_out_a_bits_address),
    .auto_master_out_d_valid        (auto_icache_master_out_d_valid),
    .auto_master_out_d_bits_opcode  (auto_icache_master_out_d_bits_opcode),
    .auto_master_out_d_bits_size    (auto_icache_master_out_d_bits_size),
    .auto_master_out_d_bits_data    (auto_icache_master_out_d_bits_data),
    .auto_master_out_d_bits_corrupt (auto_icache_master_out_d_bits_corrupt),
    .io_req_valid                   (s0_valid),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:109:35]
    .io_req_bits_addr               ({_io_cpu_npc_T[31:0], 1'h0}),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:81:14, :87:64, :101:19, :153:24, :170:27, :182:28]
    .io_s1_paddr                    (_tlb_io_resp_paddr),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:101:19]
    .io_s1_kill                     (io_cpu_req_valid | s2_replay),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:130:46, :174:56]
    .io_s2_kill                     (_icache_io_s2_kill_T_2),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:176:71]
    .io_resp_valid                  (_icache_io_resp_valid),
    .io_resp_bits_data              (_icache_io_resp_bits_data),
    .io_resp_bits_ae                (_icache_io_resp_bits_ae),
    .io_invalidate                  (io_cpu_flush_icache)
  );
  ShiftQueue fq (	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:87:64]
    .clock                    (clock),
    .reset                    (reset | io_cpu_req_valid),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:87:35]
    .io_enq_ready             (_fq_io_enq_ready),
    .io_enq_valid             (_fq_io_enq_valid_T_6),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:180:52]
    .io_enq_bits_pc           (s2_pc),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:113:22]
    .io_enq_bits_data         (_icache_io_resp_bits_data),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:66:26]
    .io_enq_bits_xcpt_pf_inst (s2_tlb_resp_pf_inst),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:117:24]
    .io_enq_bits_xcpt_ae_inst (_icache_io_resp_valid & _icache_io_resp_bits_ae | s2_tlb_resp_ae_inst),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:66:26, :117:24, :189:23, :191:{30,57,87}]
    .io_enq_bits_replay       (_icache_io_s2_kill_T_2 & ~_icache_io_resp_valid & ~_s2_xcpt_T),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:66:26, :118:37, :176:71, :186:{80,102,105}]
    .io_deq_ready             (io_cpu_resp_ready),
    .io_deq_valid             (io_cpu_resp_valid),
    .io_deq_bits_pc           (io_cpu_resp_bits_pc),
    .io_deq_bits_data         (io_cpu_resp_bits_data),
    .io_deq_bits_xcpt_pf_inst (io_cpu_resp_bits_xcpt_pf_inst),
    .io_deq_bits_xcpt_gf_inst (io_cpu_resp_bits_xcpt_gf_inst),
    .io_deq_bits_xcpt_ae_inst (io_cpu_resp_bits_xcpt_ae_inst),
    .io_deq_bits_replay       (io_cpu_resp_bits_replay),
    .io_mask                  (_fq_io_mask)
  );
  TLB_2 tlb (	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:101:19]
    .io_req_bits_vaddr             (s1_pc),	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:111:18]
    .io_resp_paddr                 (_tlb_io_resp_paddr),
    .io_resp_pf_inst               (_tlb_io_resp_pf_inst),
    .io_resp_ae_inst               (_tlb_io_resp_ae_inst),
    .io_resp_cacheable             (_tlb_io_resp_cacheable),
    .io_ptw_req_bits_valid         (io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr     (io_ptw_req_bits_bits_addr),
    .io_ptw_req_bits_bits_need_gpa (io_ptw_req_bits_bits_need_gpa),
    .io_ptw_req_bits_bits_vstage1  (io_ptw_req_bits_bits_vstage1),
    .io_ptw_req_bits_bits_stage2   (io_ptw_req_bits_bits_stage2),
    .io_ptw_status_debug           (io_ptw_status_debug),
    .io_ptw_pmp_0_cfg_l            (io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a            (io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x            (io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_addr             (io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask             (io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l            (io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a            (io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x            (io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_addr             (io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask             (io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l            (io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a            (io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x            (io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_addr             (io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask             (io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l            (io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a            (io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x            (io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_addr             (io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask             (io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l            (io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a            (io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x            (io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_addr             (io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask             (io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l            (io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a            (io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x            (io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_addr             (io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask             (io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l            (io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a            (io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x            (io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_addr             (io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask             (io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l            (io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a            (io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x            (io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_addr             (io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask             (io_ptw_pmp_7_mask),
    .io_kill                       (~s2_valid | s2_speculative & recent_progress_counter == 2'h0)	// @[generators/rocket-chip/src/main/scala/rocket/Frontend.scala:104:25, :107:58, :119:31, :151:40, :152:49, :156:55, :167:28]
  );
endmodule
