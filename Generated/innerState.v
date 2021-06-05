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
  reg [7:0] mouseReg; // @[innerState.scala 21:25]
  reg [7:0] scoreReg; // @[innerState.scala 22:25]
  reg [7:0] stepReg; // @[innerState.scala 23:20]
  reg [7:0] countReg; // @[innerState.scala 24:21]
  reg [2:0] stateReg; // @[innerState.scala 57:25]
  wire  _T_8 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_11 = ~io_game_en ? 8'h0 : 8'hff; // @[innerState.scala 72:31 innerState.scala 76:18 innerState.scala 27:12]
  wire  _T_10 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _countReg_T_1 = countReg - 8'h1; // @[innerState.scala 84:28]
  wire  _T_11 = countReg == 8'h0; // @[innerState.scala 85:21]
  wire [3:0] _countReg_T_2 = 2'h2 * io_round; // @[innerState.scala 87:30]
  wire [3:0] _countReg_T_4 = 4'ha - _countReg_T_2; // @[innerState.scala 87:26]
  wire [3:0] _countReg_T_6 = _countReg_T_4 - 4'h1; // @[innerState.scala 87:39]
  wire [4:0] _countReg_T_7 = _countReg_T_6 * 1'h1; // @[innerState.scala 87:44]
  wire [2:0] _GEN_12 = countReg == 8'h0 ? 3'h2 : stateReg; // @[innerState.scala 85:30 innerState.scala 86:18 innerState.scala 57:25]
  wire  _T_12 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_62 = {{6'd0}, io_round}; // @[innerState.scala 98:32]
  wire [7:0] _scoreReg_T_1 = scoreReg + _GEN_62; // @[innerState.scala 98:32]
  wire [2:0] _GEN_14 = io_button == mouseReg ? 3'h3 : 3'h4; // @[innerState.scala 96:37 innerState.scala 97:20 innerState.scala 100:20]
  wire [7:0] _GEN_15 = io_button == mouseReg ? _scoreReg_T_1 : scoreReg; // @[innerState.scala 96:37 innerState.scala 98:20 innerState.scala 22:25]
  wire [2:0] _GEN_16 = io_button != 8'hff ? _GEN_14 : stateReg; // @[innerState.scala 95:42 innerState.scala 57:25]
  wire [7:0] _GEN_17 = io_button != 8'hff ? _GEN_15 : scoreReg; // @[innerState.scala 95:42 innerState.scala 22:25]
  wire [2:0] _GEN_18 = _T_11 ? 3'h4 : _GEN_16; // @[innerState.scala 103:29 innerState.scala 104:18]
  wire  _T_16 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_19 = _T_11 ? 3'h5 : stateReg; // @[innerState.scala 114:29 innerState.scala 115:18 innerState.scala 57:25]
  wire  _T_18 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_21 = _T_11 ? countReg : _countReg_T_1; // @[innerState.scala 120:30 innerState.scala 24:21 innerState.scala 123:18]
  wire  _T_20 = 3'h5 == stateReg; // @[Conditional.scala 37:30]
  wire [7:0] _stepReg_T_1 = stepReg - 8'h1; // @[innerState.scala 129:26]
  wire [2:0] _GEN_22 = stepReg == 8'h0 ? 3'h6 : 3'h2; // @[innerState.scala 130:28 innerState.scala 131:18 innerState.scala 133:18]
  wire [7:0] _GEN_23 = stepReg == 8'h0 ? countReg : {{3'd0}, _countReg_T_7}; // @[innerState.scala 130:28 innerState.scala 24:21 innerState.scala 134:18]
  wire  _T_22 = 3'h6 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_24 = _T_22 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67 innerState.scala 140:17 innerState.scala 26:13]
  wire [2:0] _GEN_25 = _T_22 ? 3'h0 : stateReg; // @[Conditional.scala 39:67 innerState.scala 141:16 innerState.scala 57:25]
  wire [7:0] _GEN_26 = _T_20 ? _stepReg_T_1 : stepReg; // @[Conditional.scala 39:67 innerState.scala 129:15 innerState.scala 23:20]
  wire [2:0] _GEN_27 = _T_20 ? _GEN_22 : _GEN_25; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_28 = _T_20 ? _GEN_23 : countReg; // @[Conditional.scala 39:67 innerState.scala 24:21]
  wire [7:0] _GEN_30 = _T_18 ? 8'hff : 8'hfd; // @[Conditional.scala 39:67 innerState.scala 119:16]
  wire [2:0] _GEN_31 = _T_18 ? _GEN_19 : _GEN_27; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_32 = _T_18 ? _GEN_21 : _GEN_28; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_33 = _T_18 ? stepReg : _GEN_26; // @[Conditional.scala 39:67 innerState.scala 23:20]
  wire [7:0] _GEN_36 = _T_16 ? 8'hff : _GEN_30; // @[Conditional.scala 39:67 innerState.scala 113:16]
  wire [2:0] _GEN_37 = _T_16 ? _GEN_19 : _GEN_31; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_40 = _T_12 ? mouseReg : 8'hff; // @[Conditional.scala 39:67 innerState.scala 93:16 innerState.scala 27:12]
  wire [2:0] _GEN_42 = _T_12 ? _GEN_18 : _GEN_37; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_47 = _T_10 ? 8'h0 : _GEN_40; // @[Conditional.scala 39:67 innerState.scala 83:16]
  wire  _GEN_53 = _T_10 | (_T_12 | (_T_16 | (_T_18 | (_T_20 | _GEN_24)))); // @[Conditional.scala 39:67 innerState.scala 26:13]
  assign io_finish = _T_8 | _GEN_53; // @[Conditional.scala 40:58 innerState.scala 71:17]
  assign io_mouse = _T_8 ? _GEN_11 : _GEN_47; // @[Conditional.scala 40:58]
  assign io_score = scoreReg; // @[innerState.scala 28:12]
  always @(posedge clock) begin
    if (reset) begin // @[innerState.scala 21:25]
      mouseReg <= 8'h0; // @[innerState.scala 21:25]
    end else if (_T_8) begin // @[Conditional.scala 40:58]
      mouseReg <= 8'hfd;
    end else if (_T_10) begin // @[Conditional.scala 39:67]
      mouseReg <= 8'hfd;
    end else if (_T_12) begin // @[Conditional.scala 39:67]
      mouseReg <= 8'hfd;
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
      if (~io_game_en) begin // @[innerState.scala 72:31]
        stepReg <= 8'h7; // @[innerState.scala 74:17]
      end
    end else if (!(_T_10)) begin // @[Conditional.scala 39:67]
      if (!(_T_12)) begin // @[Conditional.scala 39:67]
        if (!(_T_16)) begin // @[Conditional.scala 39:67]
          stepReg <= _GEN_33;
        end
      end
    end
    if (_T_8) begin // @[Conditional.scala 40:58]
      if (~io_game_en) begin // @[innerState.scala 72:31]
        countReg <= 8'h3; // @[innerState.scala 75:18]
      end
    end else if (_T_10) begin // @[Conditional.scala 39:67]
      if (countReg == 8'h0) begin // @[innerState.scala 85:30]
        countReg <= {{3'd0}, _countReg_T_7}; // @[innerState.scala 87:18]
      end else begin
        countReg <= _countReg_T_1; // @[innerState.scala 84:16]
      end
    end else if (_T_12) begin // @[Conditional.scala 39:67]
      countReg <= _countReg_T_1; // @[innerState.scala 94:16]
    end else if (_T_16) begin // @[Conditional.scala 39:67]
      countReg <= _countReg_T_1; // @[innerState.scala 112:16]
    end else begin
      countReg <= _GEN_32;
    end
    if (reset) begin // @[innerState.scala 57:25]
      stateReg <= 3'h0; // @[innerState.scala 57:25]
    end else if (~io_game_end) begin // @[innerState.scala 146:28]
      stateReg <= 3'h0; // @[innerState.scala 147:14]
    end else if (_T_8) begin // @[Conditional.scala 40:58]
      if (~io_game_en) begin // @[innerState.scala 72:31]
        stateReg <= 3'h1; // @[innerState.scala 73:18]
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
  countReg = _RAND_3[7:0];
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
