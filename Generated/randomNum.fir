;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit randomNum : 
  module MaxPeriodFibonacciLFSR : 
    input clock : Clock
    input reset : Reset
    output io : {flip seed : {valid : UInt<1>, bits : UInt<1>[3]}, flip increment : UInt<1>, out : UInt<1>[3]}
    
    wire _state_WIRE : UInt<1>[3] @[PRNG.scala 38:28]
    _state_WIRE[0] <= UInt<1>("h01") @[PRNG.scala 38:28]
    _state_WIRE[1] <= UInt<1>("h01") @[PRNG.scala 38:28]
    _state_WIRE[2] <= UInt<1>("h00") @[PRNG.scala 38:28]
    reg state : UInt<1>[3], clock with : (reset => (reset, _state_WIRE)) @[PRNG.scala 47:50]
    when io.increment : @[PRNG.scala 61:23]
      node _T = xor(state[2], state[1]) @[LFSR.scala 15:41]
      state[0] <= _T @[PRNG.scala 62:11]
      state[1] <= state[0] @[PRNG.scala 62:11]
      state[2] <= state[1] @[PRNG.scala 62:11]
      skip @[PRNG.scala 61:23]
    when io.seed.valid : @[PRNG.scala 65:25]
      state[0] <= io.seed.bits[0] @[PRNG.scala 66:11]
      state[1] <= io.seed.bits[1] @[PRNG.scala 66:11]
      state[2] <= io.seed.bits[2] @[PRNG.scala 66:11]
      skip @[PRNG.scala 65:25]
    io.out[0] <= state[0] @[PRNG.scala 69:10]
    io.out[1] <= state[1] @[PRNG.scala 69:10]
    io.out[2] <= state[2] @[PRNG.scala 69:10]
    
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
    io_x_prng.io.increment <= UInt<1>("h01") @[PRNG.scala 85:23]
    node io_x_hi = cat(io_x_prng.io.out[2], io_x_prng.io.out[1]) @[PRNG.scala 86:17]
    node _io_x_T = cat(io_x_hi, io_x_prng.io.out[0]) @[PRNG.scala 86:17]
    io.x <= _io_x_T @[randomNum.scala 10:8]
    
