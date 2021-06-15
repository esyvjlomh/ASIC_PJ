package DDS

import chisel3._
import chisel3.util._

class LED_Decimal extends Module {
  val io = IO(new Bundle {
    val score = Input(UInt(8.W))
    val ind = Output(UInt(8.W))
    val ten = Output(UInt(8.W))
    val hund = Output(UInt(8.W))
  })

  val indWire = Wire(UInt(8.W))
  val tenWire = Wire(UInt(8.W))
  val hundWire = Wire(UInt(8.W))
  io.hund := 0.U
  io.ten := 0.U
  io.ind := 0.U

  hundWire := io.score / 100.U
  tenWire := (io.score - hundWire * 100.U) / 10.U
  indWire := io.score - hundWire *100.U - tenWire * 10.U

  switch(hundWire){
    is(0.U){io.hund := "b0000_0011".U}
    is(1.U){io.hund := "b1001_1111".U}
    is(2.U){io.hund := "b0010_0101".U}
    is(3.U){io.hund := "b0000_1101".U}
    is(4.U){io.hund := "b1001_1001".U}
    is(5.U){io.hund := "b0100_1001".U}
    is(6.U){io.hund := "b0100_0001".U}
    is(7.U){io.hund := "b0001_1111".U}
    is(8.U){io.hund := "b0000_0001".U}
    is(9.U){io.hund := "b0000_1001".U}
  }

  switch(tenWire){
    is(0.U){io.ten := "b0000_0011".U}
    is(1.U){io.ten := "b1001_1111".U}
    is(2.U){io.ten := "b0010_0101".U}
    is(3.U){io.ten := "b0000_1101".U}
    is(4.U){io.ten := "b1001_1001".U}
    is(5.U){io.ten := "b0100_1001".U}
    is(6.U){io.ten := "b0100_0001".U}
    is(7.U){io.ten := "b0001_1111".U}
    is(8.U){io.ten := "b0000_0001".U}
    is(9.U){io.ten := "b0000_1001".U}
  }

  switch(indWire){
    is(0.U){io.ind := "b0000_0011".U}
    is(1.U){io.ind := "b1001_1111".U}
    is(2.U){io.ind := "b0010_0101".U}
    is(3.U){io.ind := "b0000_1101".U}
    is(4.U){io.ind := "b1001_1001".U}
    is(5.U){io.ind := "b0100_1001".U}
    is(6.U){io.ind := "b0100_0001".U}
    is(7.U){io.ind := "b0001_1111".U}
    is(8.U){io.ind := "b0000_0001".U}
    is(9.U){io.ind := "b0000_1001".U}
  }
}

