package DDS
import org.scalatest._
import chiseltest._
import chisel3._
import chiseltest.ChiselScalatestTester
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation

class innerStateTest extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "innerState"
  it should "Do works well" in{
    test(new innerState).withAnnotations(Seq(WriteVcdAnnotation)){
      c=>
        c.io.game_en.poke(1.U)
        c.io.game_end.poke(1.U)
        c.io.round.poke(0.U)
        c.io.button.poke("b1111_1111".U)
        c.clock.step(100)

        c.io.game_en.poke(0.U)
        c.io.round.poke(1.U)
        c.clock.step(7)
        c.io.button.poke("b1111_1101".U)
        c.clock.step(86)
        c.io.game_en.poke(1.U)
        c.clock.step(1)

        c.io.game_en.poke(0.U)
        c.io.round.poke(2.U)
        c.io.button.poke("b1111_1101".U)
        c.clock.step(78)
        c.io.game_en.poke(1.U)
        c.clock.step(1)

        c.io.game_en.poke(0.U)
        c.io.round.poke(3.U)
        c.io.button.poke("b1111_1101".U)
        c.clock.step(45)
        c.io.game_en.poke(1.U)
        c.io.game_end.poke(0.U)
        c.clock.step(1)
        c.clock.step(50)
    }
  }

}
