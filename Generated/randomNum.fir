;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit randomNum : 
  module MaxPeriodFibonacciLFSR : 
    input clock : Clock
    input reset : Reset
    output io : {flip seed : {valid : UInt<1>, bits : UInt<1>[8]}, flip increment : UInt<1>, out : UInt<1>[8]}
    
    wire _state_WIRE : UInt<1>[8] @[PRNG.scala 38:28]
    _state_WIRE[0] <= UInt<1>("h00") @[PRNG.scala 38:28]
    _state_WIRE[1] <= UInt<1>("h00") @[PRNG.scala 38:28]
    _state_WIRE[2] <= UInt<1>("h01") @[PRNG.scala 38:28]
    _state_WIRE[3] <= UInt<1>("h00") @[PRNG.scala 38:28]
    _state_WIRE[4] <= UInt<1>("h00") @[PRNG.scala 38:28]
    _state_WIRE[5] <= UInt<1>("h01") @[PRNG.scala 38:28]
    _state_WIRE[6] <= UInt<1>("h01") @[PRNG.scala 38:28]
    _state_WIRE[7] <= UInt<1>("h00") @[PRNG.scala 38:28]
    reg state : UInt<1>[8], clock with : (reset => (reset, _state_WIRE)) @[PRNG.scala 47:50]
    when io.increment : @[PRNG.scala 61:23]
      node _T = xor(state[7], state[5]) @[LFSR.scala 15:41]
      node _T_1 = xor(_T, state[4]) @[LFSR.scala 15:41]
      node _T_2 = xor(_T_1, state[3]) @[LFSR.scala 15:41]
      state[0] <= _T_2 @[PRNG.scala 62:11]
      state[1] <= state[0] @[PRNG.scala 62:11]
      state[2] <= state[1] @[PRNG.scala 62:11]
      state[3] <= state[2] @[PRNG.scala 62:11]
      state[4] <= state[3] @[PRNG.scala 62:11]
      state[5] <= state[4] @[PRNG.scala 62:11]
      state[6] <= state[5] @[PRNG.scala 62:11]
      state[7] <= state[6] @[PRNG.scala 62:11]
      skip @[PRNG.scala 61:23]
    when io.seed.valid : @[PRNG.scala 65:25]
      state[0] <= io.seed.bits[0] @[PRNG.scala 66:11]
      state[1] <= io.seed.bits[1] @[PRNG.scala 66:11]
      state[2] <= io.seed.bits[2] @[PRNG.scala 66:11]
      state[3] <= io.seed.bits[3] @[PRNG.scala 66:11]
      state[4] <= io.seed.bits[4] @[PRNG.scala 66:11]
      state[5] <= io.seed.bits[5] @[PRNG.scala 66:11]
      state[6] <= io.seed.bits[6] @[PRNG.scala 66:11]
      state[7] <= io.seed.bits[7] @[PRNG.scala 66:11]
      skip @[PRNG.scala 65:25]
    io.out[0] <= state[0] @[PRNG.scala 69:10]
    io.out[1] <= state[1] @[PRNG.scala 69:10]
    io.out[2] <= state[2] @[PRNG.scala 69:10]
    io.out[3] <= state[3] @[PRNG.scala 69:10]
    io.out[4] <= state[4] @[PRNG.scala 69:10]
    io.out[5] <= state[5] @[PRNG.scala 69:10]
    io.out[6] <= state[6] @[PRNG.scala 69:10]
    io.out[7] <= state[7] @[PRNG.scala 69:10]
    
  module randomNum : 
    input clock : Clock
    input reset : UInt<1>
    output io : {x : UInt}
    
    inst io_x_prng of MaxPeriodFibonacciLFSR @[PRNG.scala 82:22]
    io_x_prng.clock <= clock
    io_x_prng.reset <= reset
    io_x_prng.io.seed.valid <= UInt<1>("h00") @[PRNG.scala 83:24]
    io_x_prng.io.seed.bits[0] is invalid @[PRNG.scala 84:23]
    io_x_prng.io.seed.bits[1] is invalid @[PRNG.scala 84:23]
    io_x_prng.io.seed.bits[2] is invalid @[PRNG.scala 84:23]
    io_x_prng.io.seed.bits[3] is invalid @[PRNG.scala 84:23]
    io_x_prng.io.seed.bits[4] is invalid @[PRNG.scala 84:23]
    io_x_prng.io.seed.bits[5] is invalid @[PRNG.scala 84:23]
    io_x_prng.io.seed.bits[6] is invalid @[PRNG.scala 84:23]
    io_x_prng.io.seed.bits[7] is invalid @[PRNG.scala 84:23]
    io_x_prng.io.increment <= UInt<1>("h01") @[PRNG.scala 85:23]
    node io_x_lo_lo = cat(io_x_prng.io.out[1], io_x_prng.io.out[0]) @[PRNG.scala 86:17]
    node io_x_lo_hi = cat(io_x_prng.io.out[3], io_x_prng.io.out[2]) @[PRNG.scala 86:17]
    node io_x_lo = cat(io_x_lo_hi, io_x_lo_lo) @[PRNG.scala 86:17]
    node io_x_hi_lo = cat(io_x_prng.io.out[5], io_x_prng.io.out[4]) @[PRNG.scala 86:17]
    node io_x_hi_hi = cat(io_x_prng.io.out[7], io_x_prng.io.out[6]) @[PRNG.scala 86:17]
    node io_x_hi = cat(io_x_hi_hi, io_x_hi_lo) @[PRNG.scala 86:17]
    node _io_x_T = cat(io_x_hi, io_x_lo) @[PRNG.scala 86:17]
    io.x <= _io_x_T @[randomNum.scala 11:8]
    
