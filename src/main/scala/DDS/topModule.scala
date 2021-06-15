package DDS

import chisel3._

class topModule extends Module {
  val io = IO(new Bundle {
    val start = Input(UInt(1.W))
    val button = Input(UInt(8.W))
    val mouse = Output(UInt(8.W))
    val ind = Output(UInt(8.W))
    val ten = Output(UInt(8.W))
    val hund = Output(UInt(8.W))
  })
  /*
    I/O定义解释：
    io.start：游戏开始按键输入。
    io.button：地鼠按键输入。
    io.mouse：地鼠8LED输出。
    io.ind：7段LED个位。
    io.ten：7段LED十位。
    io.hund：7段LED百位。
     */

  val main = Module(new mainState)
  val inner = Module(new innerState)
  val LED_D = Module(new LED)
  // 子模块实例化。

  main.io.start <> io.start
  inner.io.button <> io.button
  main.io.finish <> inner.io.finish
  main.io.game_en <> inner.io.game_en
  main.io.game_end <> inner.io.game_end
  main.io.round <> inner.io.round
  io.mouse <> inner.io.mouse
  inner.io.score <> LED_D.io.score
  io.ind <> LED_D.io.ind
  io.ten <> LED_D.io.ten
  io.hund <> LED_D.io.hund
  // line 18-27：端口互联。
}

