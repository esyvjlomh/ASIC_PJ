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
  reg [1:0] stateReg; // @[mainState.scala 21:25]
  wire  _T = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_2 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = ~io_finish; // @[mainState.scala 35:22]
  wire  _T_4 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_2 = _T_3 ? 2'h3 : stateReg; // @[mainState.scala 42:30 mainState.scala 43:18 mainState.scala 21:25]
  wire  _T_6 = 2'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_3 = _T_3 ? 2'h0 : stateReg; // @[mainState.scala 49:30 mainState.scala 50:18 mainState.scala 21:25]
  wire  _GEN_4 = _T_3 ? 1'h0 : 1'h1; // @[mainState.scala 49:30 mainState.scala 51:21 mainState.scala 16:15]
  wire [1:0] _GEN_5 = _T_6 ? 2'h3 : 2'h0; // @[Conditional.scala 39:67 mainState.scala 47:16 mainState.scala 17:12]
  wire  _GEN_6 = _T_6 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67 mainState.scala 48:18 mainState.scala 15:14]
  wire [1:0] _GEN_7 = _T_6 ? _GEN_3 : stateReg; // @[Conditional.scala 39:67 mainState.scala 21:25]
  wire  _GEN_8 = _T_6 ? _GEN_4 : 1'h1; // @[Conditional.scala 39:67 mainState.scala 16:15]
  wire [1:0] _GEN_9 = _T_4 ? 2'h2 : _GEN_5; // @[Conditional.scala 39:67 mainState.scala 40:16]
  wire  _GEN_10 = _T_4 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67 mainState.scala 41:18]
  wire [1:0] _GEN_13 = _T_2 ? 2'h1 : _GEN_9; // @[Conditional.scala 39:67 mainState.scala 33:16]
  wire  _GEN_14 = _T_2 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67 mainState.scala 34:18]
  wire  _GEN_16 = _T_2 | (_T_4 | _GEN_8); // @[Conditional.scala 39:67 mainState.scala 16:15]
  assign io_game_en = _T | _GEN_14; // @[Conditional.scala 40:58 mainState.scala 27:18]
  assign io_game_end = _T | _GEN_16; // @[Conditional.scala 40:58 mainState.scala 16:15]
  assign io_round = _T ? 2'h0 : _GEN_13; // @[Conditional.scala 40:58 mainState.scala 26:16]
  always @(posedge clock) begin
    if (reset) begin // @[mainState.scala 21:25]
      stateReg <= 2'h0; // @[mainState.scala 21:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (~io_start) begin // @[mainState.scala 28:29]
        stateReg <= 2'h1; // @[mainState.scala 29:18]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      if (~io_finish) begin // @[mainState.scala 35:30]
        stateReg <= 2'h2; // @[mainState.scala 36:18]
      end
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      stateReg <= _GEN_2;
    end else begin
      stateReg <= _GEN_7;
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
