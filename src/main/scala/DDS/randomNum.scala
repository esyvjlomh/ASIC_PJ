package DDS

import chisel3._
import chisel3.util.random.LFSR

class randomNum extends Module {
  val io=IO(new Bundle {
    val x = Output(UInt())
  })
  io.x := LFSR(3,true.B,Some(3))
}
