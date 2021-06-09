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
  wire  _T = 3'h0 == random; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == random; // @[Conditional.scala 37:30]
  wire  _T_2 = 3'h2 == random; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h3 == random; // @[Conditional.scala 37:30]
  wire  _T_4 = 3'h4 == random; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h5 == random; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h6 == random; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h7 == random; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_0 = _T_7 ? 8'h7f : mouseReg; // @[Conditional.scala 39:67 innerState.scala 62:22 innerState.scala 21:25]
  wire [7:0] _GEN_1 = _T_6 ? 8'hbf : _GEN_0; // @[Conditional.scala 39:67 innerState.scala 61:22]
  wire [7:0] _GEN_2 = _T_5 ? 8'hdf : _GEN_1; // @[Conditional.scala 39:67 innerState.scala 60:22]
  wire [7:0] _GEN_3 = _T_4 ? 8'hef : _GEN_2; // @[Conditional.scala 39:67 innerState.scala 59:22]
  wire [7:0] _GEN_4 = _T_3 ? 8'hf7 : _GEN_3; // @[Conditional.scala 39:67 innerState.scala 58:22]
  wire [7:0] _GEN_5 = _T_2 ? 8'hfb : _GEN_4; // @[Conditional.scala 39:67 innerState.scala 57:22]
  wire [7:0] _GEN_6 = _T_1 ? 8'hfd : _GEN_5; // @[Conditional.scala 39:67 innerState.scala 56:22]
  wire [7:0] _GEN_7 = _T ? 8'hfe : _GEN_6; // @[Conditional.scala 40:58 innerState.scala 55:22]
  reg [2:0] stateReg; // @[innerState.scala 67:25]
  wire  _T_8 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_11 = ~io_game_en ? 8'h0 : 8'hff; // @[innerState.scala 83:31 innerState.scala 87:18 innerState.scala 27:12]
  wire  _T_10 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [15:0] _countReg_T_1 = countReg - 16'h1; // @[innerState.scala 95:28]
  wire  _T_11 = countReg == 16'h0; // @[innerState.scala 96:21]
  wire [3:0] _countReg_T_2 = 2'h2 * io_round; // @[innerState.scala 98:30]
  wire [3:0] _countReg_T_4 = 4'ha - _countReg_T_2; // @[innerState.scala 98:26]
  wire [13:0] _countReg_T_5 = _countReg_T_4 * 10'h3e8; // @[innerState.scala 98:40]
  wire [2:0] _GEN_12 = countReg == 16'h0 ? 3'h2 : stateReg; // @[innerState.scala 96:30 innerState.scala 97:18 innerState.scala 67:25]
  wire  _T_12 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_62 = {{6'd0}, io_round}; // @[innerState.scala 109:32]
  wire [7:0] _scoreReg_T_1 = scoreReg + _GEN_62; // @[innerState.scala 109:32]
  wire [2:0] _GEN_14 = io_button == mouseReg ? 3'h3 : 3'h4; // @[innerState.scala 107:37 innerState.scala 108:20 innerState.scala 111:20]
  wire [7:0] _GEN_15 = io_button == mouseReg ? _scoreReg_T_1 : scoreReg; // @[innerState.scala 107:37 innerState.scala 109:20 innerState.scala 22:25]
  wire [2:0] _GEN_16 = io_button != 8'hff ? _GEN_14 : stateReg; // @[innerState.scala 106:42 innerState.scala 67:25]
  wire [7:0] _GEN_17 = io_button != 8'hff ? _GEN_15 : scoreReg; // @[innerState.scala 106:42 innerState.scala 22:25]
  wire [2:0] _GEN_18 = _T_11 ? 3'h4 : _GEN_16; // @[innerState.scala 114:29 innerState.scala 115:18]
  wire  _T_16 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_19 = _T_11 ? 3'h5 : stateReg; // @[innerState.scala 125:29 innerState.scala 126:18 innerState.scala 67:25]
  wire  _T_18 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire [15:0] _GEN_21 = _T_11 ? countReg : _countReg_T_1; // @[innerState.scala 131:30 innerState.scala 24:21 innerState.scala 134:18]
  wire  _T_20 = 3'h5 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _stepReg_T_1 = stepReg - 8'h1; // @[innerState.scala 140:26]
  wire [2:0] _GEN_22 = stepReg == 8'h0 ? 3'h6 : 3'h2; // @[innerState.scala 141:28 innerState.scala 142:18 innerState.scala 144:18]
  wire [15:0] _GEN_23 = stepReg == 8'h0 ? countReg : {{2'd0}, _countReg_T_5}; // @[innerState.scala 141:28 innerState.scala 24:21 innerState.scala 145:18]
  wire  _T_22 = 3'h6 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_24 = _T_22 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67 innerState.scala 151:17 innerState.scala 26:13]
  wire [2:0] _GEN_25 = _T_22 ? 3'h0 : stateReg; // @[Conditional.scala 39:67 innerState.scala 152:16 innerState.scala 67:25]
  wire [7:0] _GEN_26 = _T_20 ? _stepReg_T_1 : stepReg; // @[Conditional.scala 39:67 innerState.scala 140:15 innerState.scala 23:20]
  wire [2:0] _GEN_27 = _T_20 ? _GEN_22 : _GEN_25; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_28 = _T_20 ? _GEN_23 : countReg; // @[Conditional.scala 39:67 innerState.scala 24:21]
  wire [7:0] _GEN_30 = _T_18 ? 8'hff : _GEN_7; // @[Conditional.scala 39:67 innerState.scala 130:16]
  wire [2:0] _GEN_31 = _T_18 ? _GEN_19 : _GEN_27; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_32 = _T_18 ? _GEN_21 : _GEN_28; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_33 = _T_18 ? stepReg : _GEN_26; // @[Conditional.scala 39:67 innerState.scala 23:20]
  wire [7:0] _GEN_36 = _T_16 ? 8'hff : _GEN_30; // @[Conditional.scala 39:67 innerState.scala 124:16]
  wire [2:0] _GEN_37 = _T_16 ? _GEN_19 : _GEN_31; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_40 = _T_12 ? mouseReg : 8'hff; // @[Conditional.scala 39:67 innerState.scala 104:16 innerState.scala 27:12]
  wire [2:0] _GEN_42 = _T_12 ? _GEN_18 : _GEN_37; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_47 = _T_10 ? 8'h0 : _GEN_40; // @[Conditional.scala 39:67 innerState.scala 94:16]
  wire  _GEN_53 = _T_10 | (_T_12 | (_T_16 | (_T_18 | (_T_20 | _GEN_24)))); // @[Conditional.scala 39:67 innerState.scala 26:13]
  MaxPeriodFibonacciLFSR random_prng ( // @[PRNG.scala 82:22]
    .clock(random_prng_clock),
    .reset(random_prng_reset),
    .io_out_0(random_prng_io_out_0),
    .io_out_1(random_prng_io_out_1),
    .io_out_2(random_prng_io_out_2)
  );
  assign io_finish = _T_8 | _GEN_53; // @[Conditional.scala 40:58 innerState.scala 82:17]
  assign io_mouse = _T_8 ? _GEN_11 : _GEN_47; // @[Conditional.scala 40:58]
  assign io_score = scoreReg; // @[innerState.scala 28:12]
  assign random_prng_clock = clock;
  assign random_prng_reset = reset;
  always @(posedge clock) begin
    if (reset) begin // @[innerState.scala 21:25]
      mouseReg <= 8'h0; // @[innerState.scala 21:25]
    end else if (_T_8) begin // @[Conditional.scala 40:58]
      mouseReg <= _GEN_7;
    end else if (_T_10) begin // @[Conditional.scala 39:67]
      mouseReg <= _GEN_7;
    end else if (_T_12) begin // @[Conditional.scala 39:67]
      mouseReg <= _GEN_7;
    end else begin
      mouseReg <= _GEN_36;
    end
    if (reset) begin // @[innerState.scala 22:25]
      scoreReg <= 8'h0; // @[innerState.scala 22:25]
    end else if (!(_T_8)) begin // @[Conditional.scala 40:58]
      if (!(_T_10)) begin // @[Conditional.scala 39:67]
        if (_T_12) begin // @[Conditional.scala 39:67]
          scoreReg <= _GEN_17;
        end
      end
    end
    if (_T_8) begin // @[Conditional.scala 40:58]
      if (~io_game_en) begin // @[innerState.scala 83:31]
        stepReg <= 8'h7; // @[innerState.scala 85:17]
      end
    end else if (!(_T_10)) begin // @[Conditional.scala 39:67]
      if (!(_T_12)) begin // @[Conditional.scala 39:67]
        if (!(_T_16)) begin // @[Conditional.scala 39:67]
          stepReg <= _GEN_33;
        end
      end
    end
    if (_T_8) begin // @[Conditional.scala 40:58]
      if (~io_game_en) begin // @[innerState.scala 83:31]
        countReg <= 16'hbb8; // @[innerState.scala 86:18]
      end
    end else if (_T_10) begin // @[Conditional.scala 39:67]
      if (countReg == 16'h0) begin // @[innerState.scala 96:30]
        countReg <= {{2'd0}, _countReg_T_5}; // @[innerState.scala 98:18]
      end else begin
        countReg <= _countReg_T_1; // @[innerState.scala 95:16]
      end
    end else if (_T_12) begin // @[Conditional.scala 39:67]
      countReg <= _countReg_T_1; // @[innerState.scala 105:16]
    end else if (_T_16) begin // @[Conditional.scala 39:67]
      countReg <= _countReg_T_1; // @[innerState.scala 123:16]
    end else begin
      countReg <= _GEN_32;
    end
    if (reset) begin // @[innerState.scala 67:25]
      stateReg <= 3'h0; // @[innerState.scala 67:25]
    end else if (~io_game_end) begin // @[innerState.scala 157:28]
      stateReg <= 3'h0; // @[innerState.scala 158:14]
    end else if (_T_8) begin // @[Conditional.scala 40:58]
      if (~io_game_en) begin // @[innerState.scala 83:31]
        stateReg <= 3'h1; // @[innerState.scala 84:18]
      end
    end else if (_T_10) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_12;
    end else begin
      stateReg <= _GEN_42;
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
