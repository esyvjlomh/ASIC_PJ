package DDS

import chisel3._

class mainState extends Module {
  val io = IO(new Bundle {
    val finish = Input(Bool())
    val game_en = Output(Bool())
    val game_end = Output(Bool())
    val round = Output(UInt(2.W))

  })
  //I/O定义，接收从状态机发出的结束信号finish，发送给从状态机game_en, game_end, round信号

}

