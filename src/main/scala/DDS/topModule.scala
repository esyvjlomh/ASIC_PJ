package DDS

import chisel3._

class topModule extends Module {
  val io = IO(new Bundle {
    val start = Input(UInt(1.W))
    val button = Input(UInt(8.W))
    val mouse = Output(UInt(8.W))
    val ind = Output(UInt(8.W))
    val ten = Output(UInt(8.W))
  })

  val main = Module(new mainState)
  val inner = Module(new innerState)
  val LED = Module(new LED)

  main.io.start <> io.start
  inner.io.button <> io.button
  main.io.finish <> inner.io.finish
  main.io.game_en <> inner.io.game_en
  main.io.game_end <> inner.io.game_end
  main.io.round <> inner.io.round
  io.mouse <> inner.io.mouse
  inner.io.score <> LED.io.score
  io.ind <> LED.io.ind
  io.ten <> LED.io.ten
}

