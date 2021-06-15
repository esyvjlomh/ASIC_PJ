package DDS
import chisel3.stage.ChiselGeneratorAnnotation

object mainStateGen extends App {
  (new chisel3.stage.ChiselStage).execute(
  Array("-X", "verilog","--target-dir", "Generated"),
  Seq(ChiselGeneratorAnnotation(() => new mainState)))
}

object randomNumGen extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog","--target-dir", "Generated"),
    Seq(ChiselGeneratorAnnotation(() => new randomNum)))
}

object innerStateGen extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog","--target-dir", "Generated"),
    Seq(ChiselGeneratorAnnotation(() => new innerState)))
}

object LEDGen extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog","--target-dir", "Generated"),
    Seq(ChiselGeneratorAnnotation(() => new LED_Decimal)))
}

object topModuleGen extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog","--target-dir", "Generated"),
    Seq(ChiselGeneratorAnnotation(() => new topModule)))
}

object topModuleDGen extends App {
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog","--target-dir", "Generated"),
    Seq(ChiselGeneratorAnnotation(() => new topModuleD)))
}