package rev.core;

import rev.math.V2;
import kha.graphics2.Graphics;

using kha.graphics2.GraphicsExtension;

import kha.math.FastMatrix3;

class Camera {
  public var position: V2;
  public var trans: FastMatrix3;

  public function new() {
    trans = FastMatrix3.identity();
  }

  public function set(graphics: Graphics) {
    graphics.transformation = trans;
    graphics.translate(-position.x, -position.y);
  }

  public function unset(graphics: Graphics) {
    graphics.popTransformation();
  }
}
