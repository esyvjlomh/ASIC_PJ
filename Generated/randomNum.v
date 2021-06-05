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
module randomNum(
  input        clock,
  input        reset,
  output [2:0] io_x
);
  wire  io_x_prng_clock; // @[PRNG.scala 82:22]
  wire  io_x_prng_reset; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_0; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_1; // @[PRNG.scala 82:22]
  wire  io_x_prng_io_out_2; // @[PRNG.scala 82:22]
  wire [1:0] io_x_hi = {io_x_prng_io_out_2,io_x_prng_io_out_1}; // @[PRNG.scala 86:17]
  MaxPeriodFibonacciLFSR io_x_prng ( // @[PRNG.scala 82:22]
    .clock(io_x_prng_clock),
    .reset(io_x_prng_reset),
    .io_out_0(io_x_prng_io_out_0),
    .io_out_1(io_x_prng_io_out_1),
    .io_out_2(io_x_prng_io_out_2)
  );
  assign io_x = {io_x_hi,io_x_prng_io_out_0}; // @[PRNG.scala 86:17]
  assign io_x_prng_clock = clock;
  assign io_x_prng_reset = reset;
endmodule
