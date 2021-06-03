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
  //I/O定义及Output初始化，接收从状态机结束信号finish，发送从状态机game_en, game_end, round，控制信号均为低触发。

  val zero::one::two::three::Nil = Enum(4)
  val stateReg = RegInit(zero)
  //起始状态zero与三轮的状态，并设置初始值zero的状态寄存器

  switch(stateReg){
    is(zero){
      io.round := 0.U
      io.game_en := 1.U
      when(io.start === 0.U){
        stateReg := one
      }
    }
    is(one){
      io.round := 1.U
      io.game_en := 0.U
      when(io.finish === 0.U){
        stateReg := two
      }
    }
    is(two){
      io.round := 2.U
      io.game_en := 0.U
      when(io.finish === 0.U){
        stateReg := three
      }
    }
    is(three){
      io.round := 3.U
      io.game_en := 0.U
      when(io.finish === 0.U){
        stateReg := zero
        io.game_end := 0.U
      }
    }
  }



}

