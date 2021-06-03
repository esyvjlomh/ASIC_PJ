module MaxPeriodFibonacciLFSR(
  input   clock,
  input   reset,
  output  io_out_0,
  output  io_out_1,
  output  io_out_2,
  output  io_out_3,
  output  io_out_4,
  output  io_out_5,
  output  io_out_6,
  output  io_out_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  state_0; // @[PRNG.scala 47:50]
  reg  state_1; // @[PRNG.scala 47:50]
  reg  state_2; // @[PRNG.scala 47:50]
  reg  state_3; // @[PRNG.scala 47:50]
  reg  state_4; // @[PRNG.scala 47:50]
  reg  state_5; // @[PRNG.scala 47:50]
  reg  state_6; // @[PRNG.scala 47:50]
  reg  state_7; // @[PRNG.scala 47:50]
  wire  _T_2 = state_7 ^ state_5 ^ state_4 ^ state_3; // @[LFSR.scala 15:41]
  assign io_out_0 = state_0; // @[PRNG.scala 69:10]
  assign io_out_1 = state_1; // @[PRNG.scala 69:10]
  assign io_out_2 = state_2; // @[PRNG.scala 69:10]
  assign io_out_3 = state_3; // @[PRNG.scala 69:10]
  assign io_out_4 = state_4; // @[PRNG.scala 69:10]
  assign io_out_5 = state_5; // @[PRNG.scala 69:10]
  assign io_out_6 = state_6; // @[PRNG.scala 69:10]
  assign io_out_7 = state_7; // @[PRNG.scala 69:10]
  always @(posedge clock) begin
    if (reset) begin // @[PRNG.scala 47:50]
      state_0 <= 1'h0; // @[PRNG.scala 47:50]
    end else begin
      state_0 <= _T_2;
    end
    if (reset) begin // @[PRNG.scala 47:50]
      state_1 <= 1'h0; // @[PRNG.scala 47:50]
    end else begin
      state_1 <= state_0;
    end
    state_2 <= reset | state_1; // @[PRNG.scala 47:50 PRNG.scala 47:50]
    if (reset) begin // @[PRNG.scala 47:50]
      state_3 <= 1'h0; // @[PRNG.scala 47:50]
    end else begin
      state_3 <= state_2;
    end
    if (reset) begin // @[PRNG.scala 47:50]
      state_4 <= 1'h0; // @[PRNG.scala 47:50]
    end else begin
      state_4 <= state_3;
    end
    state_5 <= reset | state_4; // @[PRNG.scala 47:50 PRNG.scala 47:50]
    state_6 <= reset | state_5; // @[PRNG.scala 47:50 PRNG.scala 47:50]
    if (reset) begin // @[PRNG.scala 47:50]
      state_7 <= 1'h0; // @[PRNG.scala 47:50]
    end else begin
      state_7 <= state_6;
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
  _RAND_3 = {1{`RANDOM}};
  state_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  state_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  state_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  state_7 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module randomNum(
  input        clock,
  input        reset,
  output [7:0] io_x
);
  wire  io_x_prng_clock; // @[PRNG.scala 82:22]
  wire  io_x_prng_reset; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_0; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_1; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_2; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_3; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_4; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_5; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_6; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_7; // @[PRNG.scala 82:22]
  wire [3:0] io_x_lo = {io_x_prng_io_out_3,io_x_prng_io_out_2,io_x_prng_io_out_1,io_x_prng_io_out_0}; // @[PRNG.scala 86:17]
  wire [3:0] io_x_hi = {io_x_prng_io_out_7,io_x_prng_io_out_6,io_x_prng_io_out_5,io_x_prng_io_out_4}; // @[PRNG.scala 86:17]
  MaxPeriodFibonacciLFSR io_x_prng ( // @[PRNG.scala 82:22]
    .clock(io_x_prng_clock),
    .reset(io_x_prng_reset),
    .io_out_0(io_x_prng_io_out_0),
    .io_out_1(io_x_prng_io_out_1),
    .io_out_2(io_x_prng_io_out_2),
    .io_out_3(io_x_prng_io_out_3),
    .io_out_4(io_x_prng_io_out_4),
    .io_out_5(io_x_prng_io_out_5),
    .io_out_6(io_x_prng_io_out_6),
    .io_out_7(io_x_prng_io_out_7)
  );
  assign io_x = {io_x_hi,io_x_lo}; // @[PRNG.scala 86:17]
  assign io_x_prng_clock = clock;
  assign io_x_prng_reset = reset;
endmodule
