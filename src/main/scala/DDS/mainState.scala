package DDS

import chisel3._
import chisel3.util._
import scala.collection.immutable.Nil

class mainState extends Module {
  val io = IO(new Bundle {
    val start = Input(UInt(1.W))
    val finish = Input(UInt(1.W))
    val game_en = Output(UInt(1.W))
    val game_end = Output(UInt(1.W))
    val round = Output(UInt(2.W))
  })
  io.game_en := 1.U
  io.game_end := 1.U
  io.round := 0.U
  // I/O定义及Output初始化，接收内部状态机结束信号finish，发送game_en, game_end, round。
  // 除reset外控制信号均为低触发。

  /*
  I/O定义解释：
  io.start：游戏开始按键输入。
  io.finish：单轮游戏结束信号。
  io.game_en：游戏运行使能信号，不激活游戏不运行。
  io.game_end：游戏结束信号，激活后游戏结束且无法再运行。
  io.round：游戏轮次信号。
   */

  val zero::one::two::three::Nil = Enum(4)
  val stateReg = RegInit(zero)
  // 起始状态zero与三轮的状态，并设置初始值zero的状态寄存器。

  switch(stateReg){
    is(zero){
      io.round := 0.U
      io.game_en := 1.U
      io.game_end := 0.U
      when(io.start === 0.U){
        stateReg := one
        io.game_end := 1.U
      }
    }
    // 状态zero：控制信号均不激活，等待start按键输入后状态转换至one并激活游戏。

    is(one){
      io.round := 1.U
      io.game_en := 0.U
      when(io.finish === 0.U){
        io.game_en := 1.U
        stateReg := two
      }
    }
    // 状态one：输出round = 1，等待finish信号。
    // 得到finish信号后状态转换至two，并暂停游戏一个clk。

    is(two){
      io.round := 2.U
      io.game_en := 0.U
      when(io.finish === 0.U){
        io.game_en := 1.U
        stateReg := three
      }
    }
    // 状态two同上。

    is(three){
      io.round := 3.U
      io.game_en := 0.U
      when(io.finish === 0.U){
        io.game_en := 1.U
        stateReg := zero
      }
    }
    // 状态three：得到finish信号后状态转换至zero，并结束游戏。
  }
}

