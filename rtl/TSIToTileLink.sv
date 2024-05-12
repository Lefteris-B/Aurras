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

module TSIToTileLink(
  input         clock,
                reset,
                auto_out_a_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_a_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [2:0]  auto_out_a_bits_opcode,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [3:0]  auto_out_a_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [31:0] auto_out_a_bits_address,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [7:0]  auto_out_a_bits_mask,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [63:0] auto_out_a_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_out_d_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_out_d_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [63:0] auto_out_d_bits_data,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        io_tsi_in_ready,	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:37:14]
  input         io_tsi_in_valid,	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:37:14]
  input  [31:0] io_tsi_in_bits,	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:37:14]
  input         io_tsi_out_ready,	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:37:14]
  output        io_tsi_out_valid,	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:37:14]
  output [31:0] io_tsi_out_bits	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:37:14]
);

  reg  [31:0] cmd;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:56:16]
  reg  [63:0] addr;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17]
  reg  [63:0] len;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:58:16]
  reg  [31:0] body_0;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17]
  reg  [31:0] body_1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17]
  reg  [1:0]  bodyValid;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:60:22]
  reg         idx;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:61:16]
  reg  [3:0]  state;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
  wire        _io_tsi_in_ready_T = state == 4'h0;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
  wire        _io_tsi_in_ready_T_1 = state == 4'h1;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
  wire        _io_tsi_in_ready_T_2 = state == 4'h2;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
  wire        _io_tsi_in_ready_T_3 = state == 4'h6;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
  wire        _io_tsi_out_valid_T = state == 4'h5;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22, :71:29]
  wire [63:0] _GEN = {32'h0, addr[31:3] + 29'h1, 3'h0};	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17, :74:22, :75:31, :78:28, :134:24]
  wire [65:0] len_size = {len + 64'h1, 2'h0};	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:58:16, :79:{21,26}]
  wire [65:0] _GEN_0 = {2'h0, _GEN - addr};	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17, :78:28, :79:21, :80:31]
  wire [65:0] raw_size = len_size < _GEN_0 ? len_size : _GEN_0;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:79:21, :80:{21,31}]
  wire [1:0]  rsize = raw_size == 66'h4 ? 2'h2 : raw_size == 66'h2 ? 2'h1 : raw_size == 66'h1 ? 2'h0 : 2'h3;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:79:21, :80:21, src/main/scala/chisel3/util/Mux.scala:77:13]
  wire        pow2size = {1'h0, {1'h0, {1'h0, {1'h0, {1'h0, {1'h0, raw_size[0]} + {1'h0, raw_size[1]}} + {1'h0, {1'h0, raw_size[2]} + {1'h0, raw_size[3]}}} + {1'h0, {1'h0, {1'h0, raw_size[4]} + {1'h0, raw_size[5]}} + {1'h0, {1'h0, raw_size[6]} + {1'h0, raw_size[7]}}}} + {1'h0, {1'h0, {1'h0, {1'h0, raw_size[8]} + {1'h0, raw_size[9]}} + {1'h0, {1'h0, raw_size[10]} + {1'h0, raw_size[11]}}} + {1'h0, {1'h0, {1'h0, raw_size[12]} + {1'h0, raw_size[13]}} + {1'h0, {1'h0, raw_size[14]} + {1'h0, raw_size[15]}}}}} + {1'h0, {1'h0, {1'h0, {1'h0, {1'h0, raw_size[16]} + {1'h0, raw_size[17]}} + {1'h0, {1'h0, raw_size[18]} + {1'h0, raw_size[19]}}} + {1'h0, {1'h0, {1'h0, raw_size[20]} + {1'h0, raw_size[21]}} + {1'h0, {1'h0, raw_size[22]} + {1'h0, raw_size[23]}}}} + {1'h0, {1'h0, {1'h0, {1'h0, raw_size[24]} + {1'h0, raw_size[25]}} + {1'h0, {1'h0, raw_size[26]} + {1'h0, raw_size[27]}}} + {1'h0, {1'h0, {1'h0, raw_size[28]} + {1'h0, raw_size[29]}} + {1'h0, {1'h0, raw_size[30]} + {1'h0, raw_size[31]} + {1'h0, raw_size[32]}}}}}} + {1'h0, {1'h0, {1'h0, {1'h0, {1'h0, {1'h0, raw_size[33]} + {1'h0, raw_size[34]}} + {1'h0, {1'h0, raw_size[35]} + {1'h0, raw_size[36]}}} + {1'h0, {1'h0, {1'h0, raw_size[37]} + {1'h0, raw_size[38]}} + {1'h0, {1'h0, raw_size[39]} + {1'h0, raw_size[40]}}}} + {1'h0, {1'h0, {1'h0, {1'h0, raw_size[41]} + {1'h0, raw_size[42]}} + {1'h0, {1'h0, raw_size[43]} + {1'h0, raw_size[44]}}} + {1'h0, {1'h0, {1'h0, raw_size[45]} + {1'h0, raw_size[46]}} + {1'h0, {1'h0, raw_size[47]} + {1'h0, raw_size[48]}}}}} + {1'h0, {1'h0, {1'h0, {1'h0, {1'h0, raw_size[49]} + {1'h0, raw_size[50]}} + {1'h0, {1'h0, raw_size[51]} + {1'h0, raw_size[52]}}} + {1'h0, {1'h0, {1'h0, raw_size[53]} + {1'h0, raw_size[54]}} + {1'h0, {1'h0, raw_size[55]} + {1'h0, raw_size[56]}}}} + {1'h0, {1'h0, {1'h0, {1'h0, raw_size[57]} + {1'h0, raw_size[58]}} + {1'h0, {1'h0, raw_size[59]} + {1'h0, raw_size[60]}}} + {1'h0, {1'h0, {1'h0, raw_size[61]} + {1'h0, raw_size[62]}} + {1'h0, {1'h0, raw_size[63]} + {1'h0, raw_size[64]} + {1'h0, raw_size[65]}}}}}} == 7'h1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:56:16, :80:21, :84:{26,37}]
  wire [2:0]  byteAddr = pow2size ? addr[2:0] : 3'h0;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17, :84:37, :85:{21,36}]
  wire        get_acquire_a_mask_size = rsize == 2'h2;	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:209:26, src/main/scala/chisel3/util/Mux.scala:77:13]
  wire        get_acquire_a_mask_acc = (&rsize) | get_acquire_a_mask_size & ~(byteAddr[2]);	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:206:21, :209:26, :210:26, :211:20, :215:{29,38}, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:85:21, src/main/scala/chisel3/util/Mux.scala:77:13]
  wire        get_acquire_a_mask_acc_1 = (&rsize) | get_acquire_a_mask_size & byteAddr[2];	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:206:21, :209:26, :210:26, :215:{29,38}, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:85:21, src/main/scala/chisel3/util/Mux.scala:77:13]
  wire        get_acquire_a_mask_size_1 = rsize == 2'h1;	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:209:26, src/main/scala/chisel3/util/Mux.scala:77:13]
  wire        get_acquire_a_mask_eq_2 = ~(byteAddr[2]) & ~(byteAddr[1]);	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:210:26, :211:20, :214:27, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:85:21]
  wire        get_acquire_a_mask_acc_2 = get_acquire_a_mask_acc | get_acquire_a_mask_size_1 & get_acquire_a_mask_eq_2;	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:209:26, :214:27, :215:{29,38}]
  wire        get_acquire_a_mask_eq_3 = ~(byteAddr[2]) & byteAddr[1];	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:210:26, :211:20, :214:27, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:85:21]
  wire        get_acquire_a_mask_acc_3 = get_acquire_a_mask_acc | get_acquire_a_mask_size_1 & get_acquire_a_mask_eq_3;	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:209:26, :214:27, :215:{29,38}]
  wire        get_acquire_a_mask_eq_4 = byteAddr[2] & ~(byteAddr[1]);	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:210:26, :211:20, :214:27, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:85:21]
  wire        get_acquire_a_mask_acc_4 = get_acquire_a_mask_acc_1 | get_acquire_a_mask_size_1 & get_acquire_a_mask_eq_4;	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:209:26, :214:27, :215:{29,38}]
  wire        get_acquire_a_mask_eq_5 = byteAddr[2] & byteAddr[1];	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:210:26, :214:27, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:85:21]
  wire        get_acquire_a_mask_acc_5 = get_acquire_a_mask_acc_1 | get_acquire_a_mask_size_1 & get_acquire_a_mask_eq_5;	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:209:26, :214:27, :215:{29,38}]
  wire        _nodeOut_a_bits_T = state == 4'h7;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
  wire        _nodeOut_a_valid_T_1 = state == 4'h3;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
  wire        _nodeOut_d_ready_T = state == 4'h8;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
  wire        _nodeOut_d_ready_T_1 = state == 4'h4;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
  wire        _GEN_1 = _io_tsi_in_ready_T_2 & io_tsi_in_valid;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:126:25]
  wire        _GEN_2 = _GEN_1 & idx;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:61:16, :126:25, :129:43]
  wire        _GEN_3 = cmd == 32'h1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:56:16, :131:17]
  `ifndef SYNTHESIS	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:137:15]
    always @(posedge clock) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:137:15]
      if (_GEN_2 & ~_GEN_3 & (|cmd) & ~reset) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:56:16, :129:43, :131:{17,32}, :134:24, :137:15]
        if (`ASSERT_VERBOSE_COND_)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:137:15]
          $error("Assertion failed: Bad TSI command\n    at TSIToTileLink.scala:137 assert(false.B, \"Bad TSI command\")\n");	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:137:15]
        if (`STOP_COND_)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:137:15]
          $fatal;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:137:15]
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        _GEN_4 = _nodeOut_a_valid_T_1 & auto_out_a_ready;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:142:30]
  wire        _GEN_5 = _io_tsi_in_ready_T & io_tsi_in_valid;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:25]
  wire        _GEN_6 = _io_tsi_in_ready_T_1 & io_tsi_in_valid;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:117:26]
  wire [94:0] _GEN_7 = {63'h0, io_tsi_in_bits};	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:103:12, src/main/scala/chisel3/util/Mux.scala:77:13]
  wire [94:0] _GEN_8 = {89'h0, idx, 5'h0};	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:61:16, :103:{12,18}]
  wire        _GEN_9 = _nodeOut_d_ready_T_1 & auto_out_d_valid;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:146:31]
  wire        _GEN_10 = _io_tsi_out_valid_T & io_tsi_out_ready;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:71:29, :153:31]
  wire        _GEN_11 = len == 64'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:470:15, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:58:16, :156:15]
  wire        _GEN_12 = _io_tsi_in_ready_T_3 & io_tsi_in_valid;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:160:32]
  wire        _GEN_13 = idx | _GEN_11;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:61:16, :156:15, :163:42]
  wire        _GEN_14 = ~_GEN_12 | _GEN_13;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:153:52, :160:{32,52}, :163:{42,58}]
  wire        _GEN_15 = _nodeOut_d_ready_T & auto_out_d_valid;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:175:31]
  wire        _GEN_16 = ~_GEN_15 | _GEN_11;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:156:15, :160:52, :175:{31,47}, :176:24]
  wire [94:0] _addr_T_2 = _GEN_7 << _GEN_8;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:103:12]
  wire [94:0] _len_T_2 = _GEN_7 << _GEN_8;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:103:12]
  wire        _GEN_17 = _GEN_6 & idx;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:61:16, :109:45, :117:{26,46}, :120:43, :122:13]
  always @(posedge clock) begin
    if (_GEN_5)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:25]
      cmd <= io_tsi_in_bits;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:56:16]
    if (_GEN_15 & ~_GEN_11 | _GEN_9)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:117:46, :146:{31,47}, :149:10, :156:15, :175:{31,47}, :176:24, :179:12]
      addr <= _GEN;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17, :78:28]
    else if (_GEN_6)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:117:26]
      addr <= addr | _addr_T_2[63:0];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17, :103:12, :118:18]
    else if (_GEN_5)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:25]
      addr <= 64'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:470:15, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17]
    if (_GEN_16) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:160:52, :175:47, :176:24]
      if (_GEN_14) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:153:52, :160:52, :163:58]
        if (_GEN_10)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:153:31]
          len <= len - 64'h1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:58:16, :155:16]
        else if (_GEN_1)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:126:25]
          len <= len | _len_T_2[63:0];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:58:16, :103:12, :127:16]
        else if (_GEN_5)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:25]
          len <= 64'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:470:15, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:58:16]
      end
      else	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:153:52, :160:52, :163:58]
        len <= len - 64'h1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:58:16, :167:18]
    end
    else	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:160:52, :175:47, :176:24]
      len <= len - 64'h1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:58:16, :180:18]
    if (_GEN_12 & ~idx)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:61:16, :146:47, :160:{32,52}, :161:15]
      body_0 <= io_tsi_in_bits;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17]
    else if (_GEN_9)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:146:31]
      body_0 <= auto_out_d_bits_data[31:0];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17, :147:37]
    if (_GEN_12 & idx)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:61:16, :146:47, :160:{32,52}, :161:15]
      body_1 <= io_tsi_in_bits;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17]
    else if (_GEN_9)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:146:31]
      body_1 <= auto_out_d_bits_data[63:32];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17, :147:37]
    if (_GEN_16) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:160:52, :175:47, :176:24]
      if (_GEN_12)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:160:32]
        bodyValid <= bodyValid | 2'h1 << idx;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:60:22, :61:16, :162:28, src/main/scala/chisel3/util/Mux.scala:77:13, src/main/scala/chisel3/util/OneHot.scala:58:35]
      else if (_GEN_1 & idx & _GEN_3)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:60:22, :61:16, :126:{25,45}, :129:43, :131:{17,32}, :132:19]
        bodyValid <= 2'h0;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:60:22, :79:21]
    end
    else	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:160:52, :175:47, :176:24]
      bodyValid <= 2'h0;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:60:22, :79:21]
    idx <= _GEN_16 & (_GEN_14 ? (_GEN_10 ? idx - 1'h1 : _GEN_9 ? addr[2] : _GEN_1 ? (idx ? addr[2] : idx - 1'h1) : _GEN_6 ? ~idx & idx - 1'h1 : ~_GEN_5 & idx) : idx - 1'h1);	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17, :61:16, :107:33, :109:{25,45}, :111:9, :117:{26,46}, :119:{9,16}, :120:43, :121:11, :126:{25,45}, :128:{9,16}, :129:43, :130:11, :146:{31,47}, :148:9, :153:{31,52}, :154:{9,16}, :160:52, :163:58, :166:18, :175:47, :176:24]
    if (reset)
      state <= 4'h0;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
    else if (_GEN_15)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:175:31]
      state <= _GEN_11 ? 4'h0 : 4'h6;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22, :156:15, :176:24, :177:13, :183:13]
    else if (_nodeOut_a_bits_T & auto_out_a_ready)	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:171:32]
      state <= 4'h8;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
    else if (_GEN_12 & _GEN_13)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:153:52, :160:{32,52}, :163:{42,58}, :164:13]
      state <= 4'h7;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
    else if (_GEN_10) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:153:31]
      if (_GEN_11)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:156:15]
        state <= 4'h0;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
      else if (idx)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:61:16]
        state <= 4'h3;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
      else if (_GEN_9)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:146:31]
        state <= 4'h5;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22, :71:29]
      else if (_GEN_4)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:142:30]
        state <= 4'h4;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
      else if (_GEN_2) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:129:43]
        if (_GEN_3)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:131:17]
          state <= 4'h6;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
        else if (|cmd) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:56:16, :134:24]
          if (_GEN_17)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:45, :117:46, :120:43, :122:13]
            state <= 4'h2;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
          else if (_GEN_5)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:25]
            state <= 4'h1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
        end
        else	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:134:24]
          state <= 4'h3;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
      end
      else if (_GEN_17)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:45, :117:46, :120:43, :122:13]
        state <= 4'h2;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
      else if (_GEN_5)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:25]
        state <= 4'h1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
    end
    else if (_GEN_9)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:146:31]
      state <= 4'h5;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22, :71:29]
    else if (_GEN_4)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:142:30]
      state <= 4'h4;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
    else if (_GEN_2) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:129:43]
      if (_GEN_3)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:131:17]
        state <= 4'h6;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
      else if (|cmd) begin	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:56:16, :134:24]
        if (_GEN_17)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:45, :117:46, :120:43, :122:13]
          state <= 4'h2;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
        else if (_GEN_5)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:25]
          state <= 4'h1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
      end
      else	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:134:24]
        state <= 4'h3;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
    end
    else if (_GEN_17)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:45, :117:46, :120:43, :122:13]
      state <= 4'h2;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
    else if (_GEN_5)	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:109:25]
      state <= 4'h1;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:67:22]
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
        cmd = _RANDOM[3'h0];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:56:16]
        addr = {_RANDOM[3'h1], _RANDOM[3'h2]};	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17]
        len = {_RANDOM[3'h3], _RANDOM[3'h4]};	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:58:16]
        body_0 = _RANDOM[3'h5];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17]
        body_1 = _RANDOM[3'h6];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17]
        bodyValid = _RANDOM[3'h7][1:0];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:60:22]
        idx = _RANDOM[3'h7][2];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:60:22, :61:16]
        state = _RANDOM[3'h7][6:3];	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:60:22, :67:22]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign auto_out_a_valid = _nodeOut_a_bits_T | _nodeOut_a_valid_T_1;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, :73:59]
  assign auto_out_a_bits_opcode = _nodeOut_a_bits_T ? 3'h1 : 3'h4;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:95:20]
  assign auto_out_a_bits_size = _nodeOut_a_bits_T ? 4'h3 : {2'h0, rsize};	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:464:15, generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:79:21, :95:20, src/main/scala/chisel3/util/Mux.scala:77:13]
  assign auto_out_a_bits_address = {addr[31:3], _nodeOut_a_bits_T | ~pow2size ? 3'h0 : addr[2:0]};	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:57:17, :74:22, :84:37, :85:36, :95:20]
  assign auto_out_a_bits_mask = _nodeOut_a_bits_T ? {{4{bodyValid[1]}}, {4{bodyValid[0]}}} : {get_acquire_a_mask_acc_5 | get_acquire_a_mask_eq_5 & byteAddr[0], get_acquire_a_mask_acc_5 | get_acquire_a_mask_eq_5 & ~(byteAddr[0]), get_acquire_a_mask_acc_4 | get_acquire_a_mask_eq_4 & byteAddr[0], get_acquire_a_mask_acc_4 | get_acquire_a_mask_eq_4 & ~(byteAddr[0]), get_acquire_a_mask_acc_3 | get_acquire_a_mask_eq_3 & byteAddr[0], get_acquire_a_mask_acc_3 | get_acquire_a_mask_eq_3 & ~(byteAddr[0]), get_acquire_a_mask_acc_2 | get_acquire_a_mask_eq_2 & byteAddr[0], get_acquire_a_mask_acc_2 | get_acquire_a_mask_eq_2 & ~(byteAddr[0])};	// @[generators/rocket-chip/src/main/scala/util/Misc.scala:210:26, :211:20, :214:27, :215:29, :222:10, generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:60:22, :77:30, :85:21, :95:20]
  assign auto_out_a_bits_data = _nodeOut_a_bits_T ? {body_1, body_0} : 64'h0;	// @[generators/rocket-chip/src/main/scala/tilelink/Edges.scala:470:15, generators/rocket-chip/src/main/scala/util/package.scala:16:47, generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17, :89:10, :95:20]
  assign auto_out_d_ready = _nodeOut_d_ready_T | _nodeOut_d_ready_T_1;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, :73:59]
  assign io_tsi_in_ready = _io_tsi_in_ready_T | _io_tsi_in_ready_T_1 | _io_tsi_in_ready_T_2 | _io_tsi_in_ready_T_3;	// @[generators/rocket-chip/src/main/scala/util/package.scala:16:47, :73:59]
  assign io_tsi_out_valid = _io_tsi_out_valid_T;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:71:29]
  assign io_tsi_out_bits = idx ? body_1 : body_0;	// @[generators/testchipip/src/main/scala/tsi/TSIToTileLink.scala:59:17, :61:16, :72:19]
endmodule

