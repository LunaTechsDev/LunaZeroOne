package rev.input;

enum abstract MouseBtn(Int) from Int to Int {
  inline var Left = 0;
  inline var Right = 1;
  inline var Middle = 2;

  inline public function new(btn: Int) {
    if (btn < 0 || btn > 2) {
      throw "Valid mouse button values are: 0, 1, 2";
    }
    this = btn;
  }

  @:to
  inline public function toButtonName(): String {
    return switch (this) {
      case Left:
        "Left";
      case Right:
        "Right";
      case Middle:
        "Middle";
      case _:
        "Invalid";
    }
  }
}
