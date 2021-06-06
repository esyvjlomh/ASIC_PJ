package DDS

import chisel3._
import chisel3.util._
import chisel3.util.random.LFSR
import scala.collection.immutable.Nil

class innerState extends Module {
  val io = IO(new Bundle {
    val game_en = Input(UInt(1.W))
    val game_end = Input(UInt(1.W))
    val round = Input(UInt(2.W))
    val button = Input(UInt(8.W))
    val finish = Output(UInt(1.W))
    val mouse = Output(UInt(8.W))
    val score = Output(UInt(8.W))
  })

  val random = LFSR(3,true.B,Some(3))
  //val random = "b001".U
  val mouseReg = RegInit(0.U(8.W))
  val scoreReg = RegInit(0.U(8.W))
  val stepReg = Reg(UInt(8.W))
  val countReg = Reg(UInt(8.W))

  io.finish := 1.U
  io.mouse := "b1111_1111".U
  io.score := scoreReg
  // I/O定义与输出初始化定义。
  /*
  内部定义信号解释：
  mouseReg：地鼠亮灯信号寄存器
  random：随机数发生器，使用Chisel定义的LFSR模块生成。
  scoreReg：存储得分的寄存器。
  stepReg：存储单轮剩余次数的寄存器。
  countReg：计时器
   */

  val n = 1
  //val n = 100
  //val n = 1000
  //val n = 10000
  // n为计数器系数，与工作频率有关，可根据频率改变。n=1用于测试。

  switch(random){
    is(0.U){mouseReg := "b1111_1110".U}
    is(1.U){mouseReg := "b1111_1101".U}
    is(2.U){mouseReg := "b1111_1011".U}
    is(3.U){mouseReg := "b1111_0111".U}
    is(4.U){mouseReg := "b1110_1111".U}
    is(5.U){mouseReg := "b1101_1111".U}
    is(6.U){mouseReg := "b1011_1111".U}
    is(7.U){mouseReg := "b0111_1111".U}
  }

  val sleep::count::ingame::hit::nhit::endstep::endround::Nil = Enum(7)
  val stateReg = RegInit(sleep)
  /*
  状态解释：
  sleep：待机状态
  count：进入游戏后的倒计时
  ingame：地鼠灯亮，等待键盘输入
  hit：键盘输入正确
  nhit：键盘输入错误
  endstep：一次亮灯结束
  endround：完整一回合结束（8次亮灯）
   */

  switch(stateReg){
    is(sleep){
      io.finish := 1.U
      when(io.game_en === 0.U){
        stateReg := count
        stepReg := 7.U
        countReg := (3*n).U
        io.mouse := 0.U
      }
    }
    // 待机状态，先灯全暗（见19:18），如果接收到游戏开始信号则状态转换，灯全亮，各寄存器赋初值。
    // 注意sleep状态不能发出finish信号！

    is(count){
      io.mouse := 0.U
      countReg := countReg - 1.U
      when(countReg === 0.U) {
        stateReg := ingame
        countReg := (10.U-2.U*io.round-1.U)*n.U
      }
    }
    // 游戏开始前的倒计时，倒计时结束后状态转换，计时器赋地鼠亮灯间隔时间长短。

    is(ingame){
      io.mouse := mouseReg
      countReg := countReg - 1.U
      when(io.button =/= "b1111_1111".U) {
        when(io.button === mouseReg){
          stateReg := hit
          scoreReg := scoreReg + io.round
        }.otherwise{
          stateReg := nhit
        }
      }
      when(countReg === 0.U){
        stateReg := nhit
      }
    }
    // 地鼠寄存器赋随机亮灯值给输出，计时器开始计时。
    // 当有按键按下且正确则加对应分数（即round大小）并转换至hit；否则不加分并转换至nhit。
    // 当没有按键按下且没有按键输入，亦转换至nhit。

    is(hit){
      countReg := countReg - 1.U
      mouseReg := "b1111_1111".U
      when(countReg === 0.U){
        stateReg := endstep
      }
    }
    is(nhit) {
      mouseReg := "b1111_1111".U
      when(countReg === 0.U) {
        stateReg := endstep
      }.otherwise {
        countReg := countReg - 1.U
      }
    }
    //不管是hit还是nhit都要等待计时器结束并将灯熄灭。结束后转换至endstep。

    is(endstep){
      stepReg := stepReg - 1.U
      when(stepReg === 0.U){
        stateReg := endround
      }.otherwise{
        stateReg := ingame
        countReg := (10.U-2.U*io.round-1.U)*n.U
      }
    }
    //如果次数寄存器清零则转换至endround，否则回到ingame并重新给计时器赋时间值。

    is(endround){
      io.finish := 0.U
      stateReg := sleep
    }
    //一轮结束，回到待机态，发出finish给主状态机。
  }

  when(io.game_end === 0.U){
    stateReg := sleep
  }
  //接收到游戏结束信号，则持续待机。
}

