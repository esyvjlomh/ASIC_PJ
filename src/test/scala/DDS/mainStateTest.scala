package DDS
import org.scalatest._
import chiseltest._
import chisel3._
import chiseltest.ChiselScalatestTester
class mainStateTest extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "mainState"
  it should "change 0-3" in{
    test(new mainState){
      c=>
        c.io.start.poke(1.U)
        c.io.finish.poke(1.U)
        c.clock.step(1)
        c.io.start.poke(0.U)
        c.clock.step(1)
        c.io.game_en.expect(0.U)
        //Round 1
        c.io.round.expect(1.U)
        c.clock.step(5)
        c.io.finish.poke(0.U)
        c.clock.step(1)
        //Round 2
        c.io.finish.poke(1.U)
        c.io.round.expect(2.U)
        c.clock.step(5)
        c.io.finish.poke(0.U)
        c.clock.step(1)
        //Round 3
        c.io.finish.poke(1.U)
        c.io.round.expect(3.U)
        c.clock.step(5)
        c.io.finish.poke(0.U)
        c.io.game_end.expect(0.U)
        //Reset
        c.clock.step(1)
        c.io.round.expect(0.U)
        c.io.game_en.expect(1.U)
        c.io.game_end.expect(1.U)
    }
  }

}
