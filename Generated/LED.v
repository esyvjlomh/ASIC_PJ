module LED(
  input        clock,
  input        reset,
  input  [7:0] io_score,
  output [7:0] io_ind,
  output [7:0] io_ten,
  output [7:0] io_hund
);
  wire [7:0] hundWire = io_score / 7'h64; // @[LED.scala 21:24]
  wire [14:0] _tenWire_T = hundWire * 7'h64; // @[LED.scala 22:35]
  wire [14:0] _GEN_30 = {{7'd0}, io_score}; // @[LED.scala 22:24]
  wire [14:0] _tenWire_T_2 = _GEN_30 - _tenWire_T; // @[LED.scala 22:24]
  wire [14:0] _tenWire_T_3 = _tenWire_T_2 / 4'ha; // @[LED.scala 22:44]
  wire [7:0] tenWire = _tenWire_T_3[7:0]; // @[LED.scala 15:21 LED.scala 22:11]
  wire [11:0] _indWire_T_3 = tenWire * 4'ha; // @[LED.scala 23:51]
  wire [14:0] _GEN_32 = {{3'd0}, _indWire_T_3}; // @[LED.scala 23:41]
  wire [14:0] _indWire_T_5 = _tenWire_T_2 - _GEN_32; // @[LED.scala 23:41]
  wire  _T = 8'h0 == hundWire; // @[Conditional.scala 37:30]
  wire  _T_1 = 8'h1 == hundWire; // @[Conditional.scala 37:30]
  wire  _T_2 = 8'h2 == hundWire; // @[Conditional.scala 37:30]
  wire  _T_3 = 8'h3 == hundWire; // @[Conditional.scala 37:30]
  wire  _T_4 = 8'h4 == hundWire; // @[Conditional.scala 37:30]
  wire  _T_5 = 8'h5 == hundWire; // @[Conditional.scala 37:30]
  wire  _T_6 = 8'h6 == hundWire; // @[Conditional.scala 37:30]
  wire  _T_7 = 8'h7 == hundWire; // @[Conditional.scala 37:30]
  wire  _T_8 = 8'h8 == hundWire; // @[Conditional.scala 37:30]
  wire  _T_9 = 8'h9 == hundWire; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_0 = _T_9 ? 4'h9 : 4'h0; // @[Conditional.scala 39:67 LED.scala 35:21 LED.scala 17:11]
  wire [3:0] _GEN_1 = _T_8 ? 4'h1 : _GEN_0; // @[Conditional.scala 39:67 LED.scala 34:21]
  wire [4:0] _GEN_2 = _T_7 ? 5'h1f : {{1'd0}, _GEN_1}; // @[Conditional.scala 39:67 LED.scala 33:21]
  wire [6:0] _GEN_3 = _T_6 ? 7'h41 : {{2'd0}, _GEN_2}; // @[Conditional.scala 39:67 LED.scala 32:21]
  wire [6:0] _GEN_4 = _T_5 ? 7'h49 : _GEN_3; // @[Conditional.scala 39:67 LED.scala 31:21]
  wire [7:0] _GEN_5 = _T_4 ? 8'h99 : {{1'd0}, _GEN_4}; // @[Conditional.scala 39:67 LED.scala 30:21]
  wire [7:0] _GEN_6 = _T_3 ? 8'hd : _GEN_5; // @[Conditional.scala 39:67 LED.scala 29:21]
  wire [7:0] _GEN_7 = _T_2 ? 8'h25 : _GEN_6; // @[Conditional.scala 39:67 LED.scala 28:21]
  wire [7:0] _GEN_8 = _T_1 ? 8'h60 : _GEN_7; // @[Conditional.scala 39:67 LED.scala 27:21]
  wire  _T_10 = 8'h0 == tenWire; // @[Conditional.scala 37:30]
  wire  _T_11 = 8'h1 == tenWire; // @[Conditional.scala 37:30]
  wire  _T_12 = 8'h2 == tenWire; // @[Conditional.scala 37:30]
  wire  _T_13 = 8'h3 == tenWire; // @[Conditional.scala 37:30]
  wire  _T_14 = 8'h4 == tenWire; // @[Conditional.scala 37:30]
  wire  _T_15 = 8'h5 == tenWire; // @[Conditional.scala 37:30]
  wire  _T_16 = 8'h6 == tenWire; // @[Conditional.scala 37:30]
  wire  _T_17 = 8'h7 == tenWire; // @[Conditional.scala 37:30]
  wire  _T_18 = 8'h8 == tenWire; // @[Conditional.scala 37:30]
  wire  _T_19 = 8'h9 == tenWire; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_10 = _T_19 ? 4'h9 : 4'h0; // @[Conditional.scala 39:67 LED.scala 48:20 LED.scala 18:10]
  wire [3:0] _GEN_11 = _T_18 ? 4'h1 : _GEN_10; // @[Conditional.scala 39:67 LED.scala 47:20]
  wire [4:0] _GEN_12 = _T_17 ? 5'h1f : {{1'd0}, _GEN_11}; // @[Conditional.scala 39:67 LED.scala 46:20]
  wire [6:0] _GEN_13 = _T_16 ? 7'h41 : {{2'd0}, _GEN_12}; // @[Conditional.scala 39:67 LED.scala 45:20]
  wire [6:0] _GEN_14 = _T_15 ? 7'h49 : _GEN_13; // @[Conditional.scala 39:67 LED.scala 44:20]
  wire [7:0] _GEN_15 = _T_14 ? 8'h99 : {{1'd0}, _GEN_14}; // @[Conditional.scala 39:67 LED.scala 43:20]
  wire [7:0] _GEN_16 = _T_13 ? 8'hd : _GEN_15; // @[Conditional.scala 39:67 LED.scala 42:20]
  wire [7:0] _GEN_17 = _T_12 ? 8'h25 : _GEN_16; // @[Conditional.scala 39:67 LED.scala 41:20]
  wire [7:0] _GEN_18 = _T_11 ? 8'h60 : _GEN_17; // @[Conditional.scala 39:67 LED.scala 40:20]
  wire [7:0] indWire = _indWire_T_5[7:0]; // @[LED.scala 14:21 LED.scala 23:11]
  wire  _T_20 = 8'h0 == indWire; // @[Conditional.scala 37:30]
  wire  _T_21 = 8'h1 == indWire; // @[Conditional.scala 37:30]
  wire  _T_22 = 8'h2 == indWire; // @[Conditional.scala 37:30]
  wire  _T_23 = 8'h3 == indWire; // @[Conditional.scala 37:30]
  wire  _T_24 = 8'h4 == indWire; // @[Conditional.scala 37:30]
  wire  _T_25 = 8'h5 == indWire; // @[Conditional.scala 37:30]
  wire  _T_26 = 8'h6 == indWire; // @[Conditional.scala 37:30]
  wire  _T_27 = 8'h7 == indWire; // @[Conditional.scala 37:30]
  wire  _T_28 = 8'h8 == indWire; // @[Conditional.scala 37:30]
  wire  _T_29 = 8'h9 == indWire; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_20 = _T_29 ? 4'h9 : 4'h0; // @[Conditional.scala 39:67 LED.scala 61:20 LED.scala 19:10]
  wire [3:0] _GEN_21 = _T_28 ? 4'h1 : _GEN_20; // @[Conditional.scala 39:67 LED.scala 60:20]
  wire [4:0] _GEN_22 = _T_27 ? 5'h1f : {{1'd0}, _GEN_21}; // @[Conditional.scala 39:67 LED.scala 59:20]
  wire [6:0] _GEN_23 = _T_26 ? 7'h41 : {{2'd0}, _GEN_22}; // @[Conditional.scala 39:67 LED.scala 58:20]
  wire [6:0] _GEN_24 = _T_25 ? 7'h49 : _GEN_23; // @[Conditional.scala 39:67 LED.scala 57:20]
  wire [7:0] _GEN_25 = _T_24 ? 8'h99 : {{1'd0}, _GEN_24}; // @[Conditional.scala 39:67 LED.scala 56:20]
  wire [7:0] _GEN_26 = _T_23 ? 8'hd : _GEN_25; // @[Conditional.scala 39:67 LED.scala 55:20]
  wire [7:0] _GEN_27 = _T_22 ? 8'h25 : _GEN_26; // @[Conditional.scala 39:67 LED.scala 54:20]
  wire [7:0] _GEN_28 = _T_21 ? 8'h60 : _GEN_27; // @[Conditional.scala 39:67 LED.scala 53:20]
  assign io_ind = _T_20 ? 8'h3 : _GEN_28; // @[Conditional.scala 40:58 LED.scala 52:20]
  assign io_ten = _T_10 ? 8'h3 : _GEN_18; // @[Conditional.scala 40:58 LED.scala 39:20]
  assign io_hund = _T ? 8'h3 : _GEN_8; // @[Conditional.scala 40:58 LED.scala 26:21]
endmodule