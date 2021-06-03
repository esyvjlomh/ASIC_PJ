package DDS
import org.scalatest._
import chiseltest._
import chisel3._
import chiseltest.ChiselScalatestTester
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation

class randomNumTest extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "Random"
  it should "Generate random number" in{
    test(new randomNum).withAnnotations(Seq(WriteVcdAnnotation)){
      c=>
      c.clock.step(100)
    }
  }
}
