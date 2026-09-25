
import controlP5.*;

ControlP5 cp5;

void setup() {
  size(800, 600, P2D);
  surface.setResizable(true);
  
  Parser p = new Parser("[[++]].");
  println(p.parse());
}
