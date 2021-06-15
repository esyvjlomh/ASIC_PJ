module mainState(
  input        clock,
  input        reset,
  input        io_start,
  input        io_finish,
  output       io_game_en,
  output       io_game_end,
  output [1:0] io_round
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[mainState.scala 31:25]
  wire  _T = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_1 = ~io_start; // @[mainState.scala 39:21]
  wire  _T_2 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = ~io_finish; // @[mainState.scala 49:22]
  wire  _T_4 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_5 = _T_3 ? 2'h3 : stateReg; // @[mainState.scala 60:30 mainState.scala 62:18 mainState.scala 31:25]
  wire  _T_6 = 2'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_7 = _T_3 ? 2'h0 : stateReg; // @[mainState.scala 70:30 mainState.scala 72:18 mainState.scala 31:25]
  wire [1:0] _GEN_8 = _T_6 ? 2'h3 : 2'h0; // @[Conditional.scala 39:67 mainState.scala 68:16 mainState.scala 17:12]
  wire  _GEN_9 = _T_6 ? _T_3 : 1'h1; // @[Conditional.scala 39:67 mainState.scala 15:14]
  wire [1:0] _GEN_10 = _T_6 ? _GEN_7 : stateReg; // @[Conditional.scala 39:67 mainState.scala 31:25]
  wire [1:0] _GEN_11 = _T_4 ? 2'h2 : _GEN_8; // @[Conditional.scala 39:67 mainState.scala 58:16]
  wire  _GEN_12 = _T_4 ? _T_3 : _GEN_9; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_14 = _T_2 ? 2'h1 : _GEN_11; // @[Conditional.scala 39:67 mainState.scala 47:16]
  wire  _GEN_15 = _T_2 ? _T_3 : _GEN_12; // @[Conditional.scala 39:67]
  assign io_game_en = _T | _GEN_15; // @[Conditional.scala 40:58 mainState.scala 37:18]
  assign io_game_end = _T ? _T_1 : 1'h1; // @[Conditional.scala 40:58 mainState.scala 16:15]
  assign io_round = _T ? 2'h0 : _GEN_14; // @[Conditional.scala 40:58 mainState.scala 36:16]
  always @(posedge clock) begin
    if (reset) begin // @[mainState.scala 31:25]
      stateReg <= 2'h0; // @[mainState.scala 31:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (~io_start) begin // @[mainState.scala 39:29]
        stateReg <= 2'h1; // @[mainState.scala 40:18]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      if (~io_finish) begin // @[mainState.scala 49:30]
        stateReg <= 2'h2; // @[mainState.scala 51:18]
      end
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_5;
    end else begin
      stateReg <= _GEN_10;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MaxPeriodFibonacciLFSR(
  input   clock,
  input   reset,
  output  io_out_0,
  output  io_out_1,
  output  io_out_2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  state_0; // @[PRNG.scala 47:50]
  reg  state_1; // @[PRNG.scala 47:50]
  reg  state_2; // @[PRNG.scala 47:50]
  wire  _T = state_2 ^ state_1; // @[LFSR.scala 15:41]
  assign io_out_0 = state_0; // @[PRNG.scala 69:10]
  assign io_out_1 = state_1; // @[PRNG.scala 69:10]
  assign io_out_2 = state_2; // @[PRNG.scala 69:10]
  always @(posedge clock) begin
    state_0 <= reset | _T; // @[PRNG.scala 47:50 PRNG.scala 47:50]
    state_1 <= reset | state_0; // @[PRNG.scala 47:50 PRNG.scala 47:50]
    if (reset) begin // @[PRNG.scala 47:50]
      state_2 <= 1'h0; // @[PRNG.scala 47:50]
    end else begin
      state_2 <= state_1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_2 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module innerState(
  input        clock,
  input        reset,
  input        io_game_en,
  input        io_game_end,
  input  [1:0] io_round,
  input  [7:0] io_button,
  output       io_finish,
  output [7:0] io_mouse,
  output [7:0] io_score
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  random_prng_clock; // @[PRNG.scala 82:22]
  wire  random_prng_reset; // @[PRNG.scala 82:22]
  wire  random_prng_io_out_0; // @[PRNG.scala 82:22]
  wire  random_prng_io_out_1; // @[PRNG.scala 82:22]
  wire  random_prng_io_out_2; // @[PRNG.scala 82:22]
  wire [2:0] random = {random_prng_io_out_2,random_prng_io_out_1,random_prng_io_out_0}; // @[PRNG.scala 86:17]
  reg [7:0] mouseReg; // @[innerState.scala 21:25]
  reg [7:0] scoreReg; // @[innerState.scala 22:25]
  reg [7:0] stepReg; // @[innerState.scala 23:20]
  reg [15:0] countReg; // @[innerState.scala 24:21]
  reg [2:0] stateReg; // @[innerState.scala 55:25]
  wire  _T = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_3 = ~io_game_en ? 8'h0 : 8'hff; // @[innerState.scala 71:31 innerState.scala 75:18 innerState.scala 27:12]
  wire  _T_2 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [15:0] _countReg_T_1 = countReg - 16'h1; // @[innerState.scala 83:28]
  wire  _T_3 = countReg == 16'h0; // @[innerState.scala 84:21]
  wire [3:0] _countReg_T_2 = 2'h2 * io_round; // @[innerState.scala 86:30]
  wire [3:0] _countReg_T_4 = 4'ha - _countReg_T_2; // @[innerState.scala 86:26]
  wire [13:0] _countReg_T_5 = _countReg_T_4 * 10'h3e8; // @[innerState.scala 86:40]
  wire [2:0] _GEN_4 = countReg == 16'h0 ? 3'h2 : stateReg; // @[innerState.scala 84:30 innerState.scala 85:18 innerState.scala 55:25]
  wire  _T_4 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h0 == random; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h1 == random; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h2 == random; // @[Conditional.scala 37:30]
  wire  _T_8 = 3'h3 == random; // @[Conditional.scala 37:30]
  wire  _T_9 = 3'h4 == random; // @[Conditional.scala 37:30]
  wire  _T_10 = 3'h5 == random; // @[Conditional.scala 37:30]
  wire  _T_11 = 3'h6 == random; // @[Conditional.scala 37:30]
  wire  _T_12 = 3'h7 == random; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_6 = _T_12 ? 8'h7f : mouseReg; // @[Conditional.scala 39:67 innerState.scala 100:26 innerState.scala 21:25]
  wire [7:0] _GEN_7 = _T_11 ? 8'hbf : _GEN_6; // @[Conditional.scala 39:67 innerState.scala 99:26]
  wire [7:0] _GEN_8 = _T_10 ? 8'hdf : _GEN_7; // @[Conditional.scala 39:67 innerState.scala 98:26]
  wire [7:0] _GEN_9 = _T_9 ? 8'hef : _GEN_8; // @[Conditional.scala 39:67 innerState.scala 97:26]
  wire [7:0] _GEN_10 = _T_8 ? 8'hf7 : _GEN_9; // @[Conditional.scala 39:67 innerState.scala 96:26]
  wire [7:0] _GEN_11 = _T_7 ? 8'hfb : _GEN_10; // @[Conditional.scala 39:67 innerState.scala 95:26]
  wire [7:0] _GEN_12 = _T_6 ? 8'hfd : _GEN_11; // @[Conditional.scala 39:67 innerState.scala 94:26]
  wire [7:0] _GEN_13 = _T_5 ? 8'hfe : _GEN_12; // @[Conditional.scala 40:58 innerState.scala 93:26]
  wire  _T_13 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_70 = {{6'd0}, io_round}; // @[innerState.scala 112:32]
  wire [7:0] _scoreReg_T_1 = scoreReg + _GEN_70; // @[innerState.scala 112:32]
  wire [2:0] _GEN_14 = io_button == mouseReg ? 3'h4 : 3'h5; // @[innerState.scala 110:37 innerState.scala 111:20 innerState.scala 114:20]
  wire [7:0] _GEN_15 = io_button == mouseReg ? _scoreReg_T_1 : scoreReg; // @[innerState.scala 110:37 innerState.scala 112:20 innerState.scala 22:25]
  wire [2:0] _GEN_16 = io_button != 8'hff ? _GEN_14 : stateReg; // @[innerState.scala 109:42 innerState.scala 55:25]
  wire [7:0] _GEN_17 = io_button != 8'hff ? _GEN_15 : scoreReg; // @[innerState.scala 109:42 innerState.scala 22:25]
  wire [2:0] _GEN_18 = _T_3 ? 3'h6 : _GEN_16; // @[innerState.scala 117:29 innerState.scala 118:18]
  wire  _T_17 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_19 = _T_3 ? 3'h6 : stateReg; // @[innerState.scala 127:29 innerState.scala 128:18 innerState.scala 55:25]
  wire [15:0] _GEN_20 = _T_3 ? countReg : _countReg_T_1; // @[innerState.scala 127:29 innerState.scala 24:21 innerState.scala 130:18]
  wire  _T_19 = 3'h5 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_21 = 3'h6 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _stepReg_T_1 = stepReg - 8'h1; // @[innerState.scala 144:26]
  wire [2:0] _GEN_23 = stepReg == 8'h0 ? 3'h7 : 3'h2; // @[innerState.scala 145:28 innerState.scala 146:18 innerState.scala 148:18]
  wire [15:0] _GEN_24 = stepReg == 8'h0 ? countReg : {{2'd0}, _countReg_T_5}; // @[innerState.scala 145:28 innerState.scala 24:21 innerState.scala 149:18]
  wire  _T_23 = 3'h7 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_25 = _T_23 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67 innerState.scala 155:17 innerState.scala 26:13]
  wire [2:0] _GEN_26 = _T_23 ? 3'h0 : stateReg; // @[Conditional.scala 39:67 innerState.scala 156:16 innerState.scala 55:25]
  wire [7:0] _GEN_27 = _T_21 ? _stepReg_T_1 : stepReg; // @[Conditional.scala 39:67 innerState.scala 144:15 innerState.scala 23:20]
  wire [2:0] _GEN_28 = _T_21 ? _GEN_23 : _GEN_26; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_29 = _T_21 ? _GEN_24 : countReg; // @[Conditional.scala 39:67 innerState.scala 24:21]
  wire [7:0] _GEN_31 = _T_19 ? 8'hff : mouseReg; // @[Conditional.scala 39:67 innerState.scala 134:16 innerState.scala 21:25]
  wire [2:0] _GEN_32 = _T_19 ? _GEN_19 : _GEN_28; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_33 = _T_19 ? _GEN_20 : _GEN_29; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_34 = _T_19 ? stepReg : _GEN_27; // @[Conditional.scala 39:67 innerState.scala 23:20]
  wire [7:0] _GEN_36 = _T_17 ? 8'hff : _GEN_31; // @[Conditional.scala 39:67 innerState.scala 126:16]
  wire [2:0] _GEN_37 = _T_17 ? _GEN_19 : _GEN_32; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_38 = _T_17 ? _GEN_20 : _GEN_33; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_39 = _T_17 ? stepReg : _GEN_34; // @[Conditional.scala 39:67 innerState.scala 23:20]
  wire [7:0] _GEN_41 = _T_13 ? mouseReg : 8'hff; // @[Conditional.scala 39:67 innerState.scala 107:16 innerState.scala 27:12]
  wire [2:0] _GEN_43 = _T_13 ? _GEN_18 : _GEN_37; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_44 = _T_13 ? _GEN_17 : scoreReg; // @[Conditional.scala 39:67 innerState.scala 22:25]
  wire [7:0] _GEN_45 = _T_13 ? mouseReg : _GEN_36; // @[Conditional.scala 39:67 innerState.scala 21:25]
  wire [2:0] _GEN_49 = _T_4 ? 3'h3 : _GEN_43; // @[Conditional.scala 39:67 innerState.scala 104:16]
  wire [7:0] _GEN_50 = _T_4 ? 8'hff : _GEN_41; // @[Conditional.scala 39:67 innerState.scala 27:12]
  wire [7:0] _GEN_55 = _T_2 ? 8'h0 : _GEN_50; // @[Conditional.scala 39:67 innerState.scala 82:16]
  wire  _GEN_61 = _T_2 | (_T_4 | (_T_13 | (_T_17 | (_T_19 | (_T_21 | _GEN_25))))); // @[Conditional.scala 39:67 innerState.scala 26:13]
  MaxPeriodFibonacciLFSR random_prng ( // @[PRNG.scala 82:22]
    .clock(random_prng_clock),
    .reset(random_prng_reset),
    .io_out_0(random_prng_io_out_0),
    .io_out_1(random_prng_io_out_1),
    .io_out_2(random_prng_io_out_2)
  );
  assign io_finish = _T | _GEN_61; // @[Conditional.scala 40:58 innerState.scala 70:17]
  assign io_mouse = _T ? _GEN_3 : _GEN_55; // @[Conditional.scala 40:58]
  assign io_score = scoreReg; // @[innerState.scala 28:12]
  assign random_prng_clock = clock;
  assign random_prng_reset = reset;
  always @(posedge clock) begin
    if (reset) begin // @[innerState.scala 21:25]
      mouseReg <= 8'h0; // @[innerState.scala 21:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (_T_4) begin // @[Conditional.scala 39:67]
          mouseReg <= _GEN_13;
        end else begin
          mouseReg <= _GEN_45;
        end
      end
    end
    if (reset) begin // @[innerState.scala 22:25]
      scoreReg <= 8'h0; // @[innerState.scala 22:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_4)) begin // @[Conditional.scala 39:67]
          scoreReg <= _GEN_44;
        end
      end
    end
    if (_T) begin // @[Conditional.scala 40:58]
      if (~io_game_en) begin // @[innerState.scala 71:31]
        stepReg <= 8'h7; // @[innerState.scala 73:17]
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_4)) begin // @[Conditional.scala 39:67]
        if (!(_T_13)) begin // @[Conditional.scala 39:67]
          stepReg <= _GEN_39;
        end
      end
    end
    if (_T) begin // @[Conditional.scala 40:58]
      if (~io_game_en) begin // @[innerState.scala 71:31]
        countReg <= 16'hbb8; // @[innerState.scala 74:18]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      if (countReg == 16'h0) begin // @[innerState.scala 84:30]
        countReg <= {{2'd0}, _countReg_T_5}; // @[innerState.scala 86:18]
      end else begin
        countReg <= _countReg_T_1; // @[innerState.scala 83:16]
      end
    end else if (!(_T_4)) begin // @[Conditional.scala 39:67]
      if (_T_13) begin // @[Conditional.scala 39:67]
        countReg <= _countReg_T_1; // @[innerState.scala 108:16]
      end else begin
        countReg <= _GEN_38;
      end
    end
    if (reset) begin // @[innerState.scala 55:25]
      stateReg <= 3'h0; // @[innerState.scala 55:25]
    end else if (~io_game_end) begin // @[innerState.scala 161:28]
      stateReg <= 3'h0; // @[innerState.scala 162:14]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (~io_game_en) begin // @[innerState.scala 71:31]
        stateReg <= 3'h1; // @[innerState.scala 72:18]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_4;
    end else begin
      stateReg <= _GEN_49;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mouseReg = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  scoreReg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  stepReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  countReg = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  stateReg = _RAND_4[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LED_Decimal(
  input  [7:0] io_score,
  output [7:0] io_ind,
  output [7:0] io_ten,
  output [7:0] io_hund
);
  wire [7:0] hundWire = io_score / 7'h64; // @[LED_Decimal.scala 21:24]
  wire [14:0] _tenWire_T = hundWire * 7'h64; // @[LED_Decimal.scala 22:35]
  wire [14:0] _GEN_30 = {{7'd0}, io_score}; // @[LED_Decimal.scala 22:24]
  wire [14:0] _tenWire_T_2 = _GEN_30 - _tenWire_T; // @[LED_Decimal.scala 22:24]
  wire [14:0] _tenWire_T_3 = _tenWire_T_2 / 4'ha; // @[LED_Decimal.scala 22:44]
  wire [7:0] tenWire = _tenWire_T_3[7:0]; // @[LED_Decimal.scala 15:21 LED_Decimal.scala 22:11]
  wire [11:0] _indWire_T_3 = tenWire * 4'ha; // @[LED_Decimal.scala 23:51]
  wire [14:0] _GEN_32 = {{3'd0}, _indWire_T_3}; // @[LED_Decimal.scala 23:41]
  wire [14:0] _indWire_T_5 = _tenWire_T_2 - _GEN_32; // @[LED_Decimal.scala 23:41]
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
  wire [3:0] _GEN_0 = _T_9 ? 4'h9 : 4'h0; // @[Conditional.scala 39:67 LED_Decimal.scala 35:21 LED_Decimal.scala 17:11]
  wire [3:0] _GEN_1 = _T_8 ? 4'h1 : _GEN_0; // @[Conditional.scala 39:67 LED_Decimal.scala 34:21]
  wire [4:0] _GEN_2 = _T_7 ? 5'h1f : {{1'd0}, _GEN_1}; // @[Conditional.scala 39:67 LED_Decimal.scala 33:21]
  wire [6:0] _GEN_3 = _T_6 ? 7'h41 : {{2'd0}, _GEN_2}; // @[Conditional.scala 39:67 LED_Decimal.scala 32:21]
  wire [6:0] _GEN_4 = _T_5 ? 7'h49 : _GEN_3; // @[Conditional.scala 39:67 LED_Decimal.scala 31:21]
  wire [7:0] _GEN_5 = _T_4 ? 8'h99 : {{1'd0}, _GEN_4}; // @[Conditional.scala 39:67 LED_Decimal.scala 30:21]
  wire [7:0] _GEN_6 = _T_3 ? 8'hd : _GEN_5; // @[Conditional.scala 39:67 LED_Decimal.scala 29:21]
  wire [7:0] _GEN_7 = _T_2 ? 8'h25 : _GEN_6; // @[Conditional.scala 39:67 LED_Decimal.scala 28:21]
  wire [7:0] _GEN_8 = _T_1 ? 8'h60 : _GEN_7; // @[Conditional.scala 39:67 LED_Decimal.scala 27:21]
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
  wire [3:0] _GEN_10 = _T_19 ? 4'h9 : 4'h0; // @[Conditional.scala 39:67 LED_Decimal.scala 48:20 LED_Decimal.scala 18:10]
  wire [3:0] _GEN_11 = _T_18 ? 4'h1 : _GEN_10; // @[Conditional.scala 39:67 LED_Decimal.scala 47:20]
  wire [4:0] _GEN_12 = _T_17 ? 5'h1f : {{1'd0}, _GEN_11}; // @[Conditional.scala 39:67 LED_Decimal.scala 46:20]
  wire [6:0] _GEN_13 = _T_16 ? 7'h41 : {{2'd0}, _GEN_12}; // @[Conditional.scala 39:67 LED_Decimal.scala 45:20]
  wire [6:0] _GEN_14 = _T_15 ? 7'h49 : _GEN_13; // @[Conditional.scala 39:67 LED_Decimal.scala 44:20]
  wire [7:0] _GEN_15 = _T_14 ? 8'h99 : {{1'd0}, _GEN_14}; // @[Conditional.scala 39:67 LED_Decimal.scala 43:20]
  wire [7:0] _GEN_16 = _T_13 ? 8'hd : _GEN_15; // @[Conditional.scala 39:67 LED_Decimal.scala 42:20]
  wire [7:0] _GEN_17 = _T_12 ? 8'h25 : _GEN_16; // @[Conditional.scala 39:67 LED_Decimal.scala 41:20]
  wire [7:0] _GEN_18 = _T_11 ? 8'h60 : _GEN_17; // @[Conditional.scala 39:67 LED_Decimal.scala 40:20]
  wire [7:0] indWire = _indWire_T_5[7:0]; // @[LED_Decimal.scala 14:21 LED_Decimal.scala 23:11]
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
  wire [3:0] _GEN_20 = _T_29 ? 4'h9 : 4'h0; // @[Conditional.scala 39:67 LED_Decimal.scala 61:20 LED_Decimal.scala 19:10]
  wire [3:0] _GEN_21 = _T_28 ? 4'h1 : _GEN_20; // @[Conditional.scala 39:67 LED_Decimal.scala 60:20]
  wire [4:0] _GEN_22 = _T_27 ? 5'h1f : {{1'd0}, _GEN_21}; // @[Conditional.scala 39:67 LED_Decimal.scala 59:20]
  wire [6:0] _GEN_23 = _T_26 ? 7'h41 : {{2'd0}, _GEN_22}; // @[Conditional.scala 39:67 LED_Decimal.scala 58:20]
  wire [6:0] _GEN_24 = _T_25 ? 7'h49 : _GEN_23; // @[Conditional.scala 39:67 LED_Decimal.scala 57:20]
  wire [7:0] _GEN_25 = _T_24 ? 8'h99 : {{1'd0}, _GEN_24}; // @[Conditional.scala 39:67 LED_Decimal.scala 56:20]
  wire [7:0] _GEN_26 = _T_23 ? 8'hd : _GEN_25; // @[Conditional.scala 39:67 LED_Decimal.scala 55:20]
  wire [7:0] _GEN_27 = _T_22 ? 8'h25 : _GEN_26; // @[Conditional.scala 39:67 LED_Decimal.scala 54:20]
  wire [7:0] _GEN_28 = _T_21 ? 8'h60 : _GEN_27; // @[Conditional.scala 39:67 LED_Decimal.scala 53:20]
  assign io_ind = _T_20 ? 8'hfc : _GEN_28; // @[Conditional.scala 40:58 LED_Decimal.scala 52:20]
  assign io_ten = _T_10 ? 8'hfc : _GEN_18; // @[Conditional.scala 40:58 LED_Decimal.scala 39:20]
  assign io_hund = _T ? 8'hfc : _GEN_8; // @[Conditional.scala 40:58 LED_Decimal.scala 26:21]
endmodule
module topModuleD(
  input        clock,
  input        reset,
  input        io_start,
  input  [7:0] io_button,
  output [7:0] io_mouse,
  output [7:0] io_ind,
  output [7:0] io_ten,
  output [7:0] io_hund
);
  wire  main_clock; // @[topModuleD.scala 24:20]
  wire  main_reset; // @[topModuleD.scala 24:20]
  wire  main_io_start; // @[topModuleD.scala 24:20]
  wire  main_io_finish; // @[topModuleD.scala 24:20]
  wire  main_io_game_en; // @[topModuleD.scala 24:20]
  wire  main_io_game_end; // @[topModuleD.scala 24:20]
  wire [1:0] main_io_round; // @[topModuleD.scala 24:20]
  wire  inner_clock; // @[topModuleD.scala 25:21]
  wire  inner_reset; // @[topModuleD.scala 25:21]
  wire  inner_io_game_en; // @[topModuleD.scala 25:21]
  wire  inner_io_game_end; // @[topModuleD.scala 25:21]
  wire [1:0] inner_io_round; // @[topModuleD.scala 25:21]
  wire [7:0] inner_io_button; // @[topModuleD.scala 25:21]
  wire  inner_io_finish; // @[topModuleD.scala 25:21]
  wire [7:0] inner_io_mouse; // @[topModuleD.scala 25:21]
  wire [7:0] inner_io_score; // @[topModuleD.scala 25:21]
  wire [7:0] LED_D_io_score; // @[topModuleD.scala 26:21]
  wire [7:0] LED_D_io_ind; // @[topModuleD.scala 26:21]
  wire [7:0] LED_D_io_ten; // @[topModuleD.scala 26:21]
  wire [7:0] LED_D_io_hund; // @[topModuleD.scala 26:21]
  mainState main ( // @[topModuleD.scala 24:20]
    .clock(main_clock),
    .reset(main_reset),
    .io_start(main_io_start),
    .io_finish(main_io_finish),
    .io_game_en(main_io_game_en),
    .io_game_end(main_io_game_end),
    .io_round(main_io_round)
  );
  innerState inner ( // @[topModuleD.scala 25:21]
    .clock(inner_clock),
    .reset(inner_reset),
    .io_game_en(inner_io_game_en),
    .io_game_end(inner_io_game_end),
    .io_round(inner_io_round),
    .io_button(inner_io_button),
    .io_finish(inner_io_finish),
    .io_mouse(inner_io_mouse),
    .io_score(inner_io_score)
  );
  LED_Decimal LED_D ( // @[topModuleD.scala 26:21]
    .io_score(LED_D_io_score),
    .io_ind(LED_D_io_ind),
    .io_ten(LED_D_io_ten),
    .io_hund(LED_D_io_hund)
  );
  assign io_mouse = inner_io_mouse; // @[topModuleD.scala 35:12]
  assign io_ind = LED_D_io_ind; // @[topModuleD.scala 37:10]
  assign io_ten = LED_D_io_ten; // @[topModuleD.scala 38:10]
  assign io_hund = LED_D_io_hund; // @[topModuleD.scala 39:11]
  assign main_clock = clock;
  assign main_reset = reset;
  assign main_io_start = io_start; // @[topModuleD.scala 29:17]
  assign main_io_finish = inner_io_finish; // @[topModuleD.scala 31:18]
  assign inner_clock = clock;
  assign inner_reset = reset;
  assign inner_io_game_en = main_io_game_en; // @[topModuleD.scala 32:19]
  assign inner_io_game_end = main_io_game_end; // @[topModuleD.scala 33:20]
  assign inner_io_round = main_io_round; // @[topModuleD.scala 34:17]
  assign inner_io_button = io_button; // @[topModuleD.scala 30:19]
  assign LED_D_io_score = inner_io_score; // @[topModuleD.scala 36:18]
endmodule
