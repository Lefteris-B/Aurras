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

module TLROM(
  output        auto_in_a_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_a_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [1:0]  auto_in_a_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [13:0] auto_in_a_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input  [16:0] auto_in_a_bits_address,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  input         auto_in_d_ready,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output        auto_in_d_valid,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [1:0]  auto_in_d_bits_size,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [13:0] auto_in_d_bits_source,	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
  output [63:0] auto_in_d_bits_data	// @[generators/rocket-chip/src/main/scala/diplomacy/LazyModule.scala:367:18]
);

  wire [511:0][63:0] _GEN =
    '{64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h0,
      64'h73747075,
      64'h727265746E690074,
      64'h6E657261702D7470,
      64'h75727265746E6900,
      64'h736B636F6C630076,
      64'h65646E2C76637369,
      64'h7200797469726F69,
      64'h72702D78616D2C76,
      64'h6373697200686361,
      64'h7474612D67756265,
      64'h64006465646E6574,
      64'h78652D7374707572,
      64'h7265746E69007365,
      64'h6D616E2D74757074,
      64'h756F2D6B636F6C63,
      64'h736C6C65632D6B,
      64'h636F6C632300746E,
      64'h756F632D7268736D,
      64'h2C65766966697300,
      64'h64656966696E752D,
      64'h6568636163006C65,
      64'h76656C2D65686361,
      64'h630073656D616E2D,
      64'h676572007365676E,
      64'h617200656C646E61,
      64'h68700072656C6C6F,
      64'h72746E6F632D7470,
      64'h75727265746E6900,
      64'h736C6C65632D7470,
      64'h75727265746E6923,
      64'h73757461747300,
      64'h736E6F6967657270,
      64'h6D702C7663736972,
      64'h79746972616C75,
      64'h6E617267706D702C,
      64'h7663736972006173,
      64'h692C766373697200,
      64'h6765720065686361,
      64'h632D6C6576656C2D,
      64'h7478656E00657A69,
      64'h732D65686361632D,
      64'h6900737465732D65,
      64'h686361632D690065,
      64'h7A69732D6B636F6C,
      64'h622D65686361632D,
      64'h6900746E756F632D,
      64'h746E696F706B6165,
      64'h72622D636578652D,
      64'h6572617764726168,
      64'h657079745F6563,
      64'h6976656400657A69,
      64'h732D65686361632D,
      64'h6400737465732D65,
      64'h686361632D640065,
      64'h7A69732D6B636F6C,
      64'h622D65686361632D,
      64'h640079636E657571,
      64'h6572662D6B636F6C,
      64'h630079636E657571,
      64'h6572662D65736162,
      64'h656D697400687461,
      64'h702D74756F647473,
      64'h306C6169726573,
      64'h6C65646F6D0065,
      64'h6C62697461706D6F,
      64'h6300736C6C65632D,
      64'h657A69732300736C,
      64'h6C65632D73736572,
      64'h6464612309000000,
      64'h200000002000000,
      64'h2000000006C6F72,
      64'h746E6F6369010000,
      64'h800000003000000,
      64'h10000000001100,
      64'hF900000008000000,
      64'h300000000000000,
      64'h3030303031314072,
      64'h65747465732D7465,
      64'h7365722D656C6974,
      64'h100000002000000,
      64'h6C6F72746E6F63,
      64'h6901000008000000,
      64'h300000000100000,
      64'h210F9000000,
      64'h800000003000000,
      64'h100000016020000,
      64'h400000003000000,
      64'h600000005020000,
      64'h400000003000000,
      64'h30747261,
      64'h752C657669666973,
      64'h1B0000000D000000,
      64'h300000005000000,
      64'hFE01000004000000,
      64'h300000000303030,
      64'h3032303031406C61,
      64'h6972657301000000,
      64'h2000000006B636F,
      64'h6C632D6465786966,
      64'h1B0000000C000000,
      64'h300000000006B63,
      64'h6F6C635F73756273,
      64'hAC0100000B000000,
      64'h30000000065CD1D,
      64'h5300000004000000,
      64'h300000000000000,
      64'h9F01000004000000,
      64'h300000000006B63,
      64'h6F6C635F73756273,
      64'h100000002000000,
      64'h6D656D69010000,
      64'h400000003000000,
      64'h10000000100,
      64'hF900000008000000,
      64'h300000000306D6F,
      64'h722C657669666973,
      64'h1B0000000C000000,
      64'h300000000000030,
      64'h30303031406D6F72,
      64'h100000002000000,
      64'h50000005A010000,
      64'h400000003000000,
      64'h6B636F6C632D64,
      64'h657869661B000000,
      64'hC00000003000000,
      64'h6B636F6C635F,
      64'h73756270AC010000,
      64'hB00000003000000,
      64'h65CD1D53000000,
      64'h400000003000000,
      64'h9F010000,
      64'h400000003000000,
      64'h6B636F6C635F,
      64'h7375627001000000,
      64'h2000000006B636F,
      64'h6C632D6465786966,
      64'h1B0000000C000000,
      64'h300000000006B63,
      64'h6F6C635F7375626D,
      64'hAC0100000B000000,
      64'h30000000065CD1D,
      64'h5300000004000000,
      64'h300000000000000,
      64'h9F01000004000000,
      64'h300000000006B63,
      64'h6F6C635F7375626D,
      64'h100000002000000,
      64'h60000005A010000,
      64'h400000003000000,
      64'h1000000F3010000,
      64'h400000003000000,
      64'h1000000E0010000,
      64'h400000003000000,
      64'h6C6F72746E6F63,
      64'h6901000008000000,
      64'h300000000000004,
      64'hCF9000000,
      64'h800000003000000,
      64'hB00000004000000,
      64'hBF01000008000000,
      64'h300000045010000,
      64'h3000000,
      64'h3063696C702C76,
      64'h637369721B000000,
      64'hC00000003000000,
      64'h100000034010000,
      64'h400000003000000,
      64'h30303030,
      64'h3030634072656C6C,
      64'h6F72746E6F632D74,
      64'h7075727265746E69,
      64'h100000002000000,
      64'h6B636F6C632D64,
      64'h657869661B000000,
      64'hC00000003000000,
      64'h6B636F6C635F,
      64'h73756266AC010000,
      64'hB00000003000000,
      64'h65CD1D53000000,
      64'h400000003000000,
      64'h9F010000,
      64'h400000003000000,
      64'h6B636F6C635F,
      64'h7375626601000000,
      64'h200000000100000,
      64'h300000F9000000,
      64'h800000003000000,
      64'h30726F7272,
      64'h652C657669666973,
      64'h1B0000000E000000,
      64'h300000000000030,
      64'h3030334065636976,
      64'h65642D726F727265,
      64'h100000002000000,
      64'h6C6F72746E6F63,
      64'h6901000008000000,
      64'h300000000100000,
      64'hF9000000,
      64'h800000003000000,
      64'hFFFF000004000000,
      64'hBF01000008000000,
      64'h300000000000000,
      64'h6761746AD3010000,
      64'h500000003000000,
      64'h3331302D,
      64'h67756265642C7663,
      64'h736972003331302D,
      64'h67756265642C6576,
      64'h696669731B000000,
      64'h2100000003000000,
      64'h304072656C6C,
      64'h6F72746E6F632D67,
      64'h7562656401000000,
      64'h2000000006C6F72,
      64'h746E6F6369010000,
      64'h800000003000000,
      64'h10000000001000,
      64'hF900000008000000,
      64'h300000000003030,
      64'h3030303140726574,
      64'h61672D6B636F6C63,
      64'h100000002000000,
      64'h6C6F72746E6F63,
      64'h6901000008000000,
      64'h300000000000100,
      64'h2F9000000,
      64'h800000003000000,
      64'h700000004000000,
      64'h300000004000000,
      64'hBF01000010000000,
      64'h300000000000000,
      64'h30746E696C632C76,
      64'h637369721B000000,
      64'hD00000003000000,
      64'h3030303030,
      64'h303240746E696C63,
      64'h100000002000000,
      64'h6B636F6C632D64,
      64'h657869661B000000,
      64'hC00000003000000,
      64'h6B636F6C635F,
      64'h73756263AC010000,
      64'hB00000003000000,
      64'h65CD1D53000000,
      64'h400000003000000,
      64'h9F010000,
      64'h400000003000000,
      64'h6B636F6C635F,
      64'h7375626301000000,
      64'h200000001000000,
      64'h5A01000004000000,
      64'h300000005000000,
      64'h8D01000004000000,
      64'h3000000006C6F72,
      64'h746E6F6369010000,
      64'h800000003000000,
      64'h10000000000102,
      64'hF900000008000000,
      64'h300000003000000,
      64'h2000000E8000000,
      64'h800000003000000,
      64'h65686361,
      64'h6300306568636163,
      64'h65766973756C636E,
      64'h692C657669666973,
      64'h1B0000001D000000,
      64'h30000007F010000,
      64'h3000000,
      64'h80000085000000,
      64'h400000003000000,
      64'h8000000078000000,
      64'h400000003000000,
      64'h200000073010000,
      64'h400000003000000,
      64'h4000000065000000,
      64'h400000003000000,
      64'h30303030,
      64'h3130324072656C6C,
      64'h6F72746E6F632D65,
      64'h6863616301000000,
      64'h2000000006C6F72,
      64'h746E6F6369010000,
      64'h800000003000000,
      64'h10000000100000,
      64'hF900000008000000,
      64'h300000000000030,
      64'h303031406765722D,
      64'h737365726464612D,
      64'h746F6F6201000000,
      64'h6201000000000000,
      64'h300000000737562,
      64'h2D656C706D697300,
      64'h636F732D64726179,
      64'h706968632C726162,
      64'h2D6263751B000000,
      64'h2000000003000000,
      64'h10000000F000000,
      64'h400000003000000,
      64'h100000000000000,
      64'h400000003000000,
      64'h636F7301000000,
      64'h200000002000000,
      64'h5A01000004000000,
      64'h300000000000010,
      64'h80F9000000,
      64'h800000003000000,
      64'h79726F6D656D,
      64'h9000000007000000,
      64'h300000000303030,
      64'h3030303038407972,
      64'h6F6D656D01000000,
      64'h200000003000000,
      64'h5A01000004000000,
      64'h300000000000100,
      64'h8F9000000,
      64'h800000003000000,
      64'h79726F6D656D,
      64'h9000000007000000,
      64'h300000000003030,
      64'h3030303038407972,
      64'h6F6D656D01000000,
      64'h200000000000030,
      64'h666974682C626375,
      64'h1B0000000A000000,
      64'h300000000000000,
      64'h6669746801000000,
      64'h200000002000000,
      64'h200000004000000,
      64'h5A01000004000000,
      64'h300000045010000,
      64'h3000000,
      64'h63746E692D75,
      64'h70632C7663736972,
      64'h1B0000000F000000,
      64'h300000001000000,
      64'h3401000004000000,
      64'h300000000000000,
      64'h72656C6C6F72746E,
      64'h6F632D7470757272,
      64'h65746E6901000000,
      64'h40420F0040000000,
      64'h400000003000000,
      64'h79616B6F,
      64'h2D01000005000000,
      64'h300000008000000,
      64'h1C01000004000000,
      64'h300000004000000,
      64'h701000004000000,
      64'h300000000000000,
      64'h74656B636F72785F,
      64'h6D7068697A5F6965,
      64'h636E6566697A5F72,
      64'h7363697A63616D69,
      64'h34367672FD000000,
      64'h2500000003000000,
      64'hF9000000,
      64'h400000003000000,
      64'h1000000E8000000,
      64'h400000003000000,
      64'h100000DB000000,
      64'h400000003000000,
      64'h40000000CE000000,
      64'h400000003000000,
      64'h40000000BB000000,
      64'h400000003000000,
      64'h10000009C000000,
      64'h400000003000000,
      64'h75706390000000,
      64'h400000003000000,
      64'h10000083000000,
      64'h400000003000000,
      64'h4000000076000000,
      64'h400000003000000,
      64'h4000000063000000,
      64'h400000003000000,
      64'h76637369,
      64'h72003074656B636F,
      64'h722C657669666973,
      64'h1B00000015000000,
      64'h300000000000000,
      64'h5300000004000000,
      64'h300000000000030,
      64'h4075706301000000,
      64'h40420F0040000000,
      64'h400000003000000,
      64'hF000000,
      64'h400000003000000,
      64'h100000000000000,
      64'h400000003000000,
      64'h73757063,
      64'h100000002000000,
      64'h30303030,
      64'h32303031406C6169,
      64'h7265732F636F732F,
      64'h3400000015000000,
      64'h300000000006E65,
      64'h736F686301000000,
      64'h200000000000000,
      64'h3030303032303031,
      64'h406C61697265732F,
      64'h636F732F2C000000,
      64'h1500000003000000,
      64'h73657361696C61,
      64'h100000000000000,
      64'h6472617970696863,
      64'h2C7261622D626375,
      64'h2600000011000000,
      64'h300000000000000,
      64'h7665642D64726179,
      64'h706968632C726162,
      64'h2D6263751B000000,
      64'h1500000003000000,
      64'h10000000F000000,
      64'h400000003000000,
      64'h100000000000000,
      64'h400000003000000,
      64'h1000000,
      64'h0,
      64'h0,
      64'hE40A000021020000,
      64'h10000000,
      64'h1100000028000000,
      64'h1C0B000038000000,
      64'h3D0D0000EDFE0DD0,
      64'h1330200073,
      64'h3006307308000613,
      64'h185859300000597,
      64'hF140257334151073,
      64'h5350300001537,
      64'h5A02300B505B3,
      64'h251513FE029EE3,
      64'h5A283F81FF06F,
      64'h0,
      64'h0,
      64'h2C0006F,
      64'hFE069AE3FFC62683,
      64'h46061300D62023,
      64'h10069300458613,
      64'h380006F00050463,
      64'hF1402573020005B7,
      64'h0,
      64'hFFDFF06F,
      64'h1050007330052073,
      64'h3045107300800513,
      64'h3030107300028463,
      64'h12F2934122D293,
      64'h301022F330551073,
      64'h405051300000517};	// @[generators/rocket-chip/src/main/scala/devices/tilelink/BootROM.scala:52:47]
  assign auto_in_a_ready = auto_in_d_ready;
  assign auto_in_d_valid = auto_in_a_valid;
  assign auto_in_d_bits_size = auto_in_a_bits_size;
  assign auto_in_d_bits_source = auto_in_a_bits_source;
  assign auto_in_d_bits_data = (|(auto_in_a_bits_address[15:12])) ? 64'h0 : _GEN[auto_in_a_bits_address[11:3]];	// @[generators/rocket-chip/src/main/scala/devices/tilelink/BootROM.scala:45:22, :50:34, :51:64, :52:{47,53}]
endmodule
