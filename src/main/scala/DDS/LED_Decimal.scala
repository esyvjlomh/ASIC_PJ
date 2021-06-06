package DDS

import chisel3._
import chisel3.util._

class LED_Decimal extends Module {
  val io = IO(new Bundle {
    val score = Input(UInt(8.W))
    val ind = Output(UInt(8.W))
    val ten = Output(UInt(8.W))
  })

  val indWire = Wire(UInt(4.W))
  val tenWire = Wire(UInt(4.W))
  io.ten := 0.U
  io.ind := 0.U

  tenWire := io.score(3,0)
  indWire := io.score(7,4)

  switch(tenWire){
    is(0.U){io.ten := "b0000_0011".U}
    is(1.U){io.ten := "b0110_0000".U}
    is(2.U){io.ten := "b0010_0101".U}
    is(3.U){io.ten := "b0000_1101".U}
    is(4.U){io.ten := "b1001_1001".U}
    is(5.U){io.ten := "b0100_1001".U}
    is(6.U){io.ten := "b0100_0001".U}
    is(7.U){io.ten := "b0001_1111".U}
    is(8.U){io.ten := "b0000_0001".U}
    is(9.U){io.ten := "b0000_1001".U}
    is(10.U){io.ten := "b0001_0001".U}
    is(11.U){io.ten := "b1100_0001".U}
    is(12.U){io.ten := "b0110_0011".U}
    is(13.U){io.ten := "b1000_0101".U}
    is(14.U){io.ten := "b0110_0001".U}
    is(15.U){io.ten := "b0111_0001".U}
  }

  switch(indWire){
    is(0.U){io.ind := "b0000_0011".U}
    is(1.U){io.ind := "b0110_0000".U}
    is(2.U){io.ind := "b0010_0101".U}
    is(3.U){io.ind := "b0000_1101".U}
    is(4.U){io.ind := "b1001_1001".U}
    is(5.U){io.ind := "b0100_1001".U}
    is(6.U){io.ind := "b0100_0001".U}
    is(7.U){io.ind := "b0001_1111".U}
    is(8.U){io.ind := "b0000_0001".U}
    is(9.U){io.ind := "b0000_1001".U}
    is(10.U){io.ind := "b0001_0001".U}
    is(11.U){io.ind := "b1100_0001".U}
    is(12.U){io.ind := "b0110_0011".U}
    is(13.U){io.ind := "b1000_0101".U}
    is(14.U){io.ind := "b0110_0001".U}
    is(15.U){io.ind := "b0111_0001".U}
  }
}

