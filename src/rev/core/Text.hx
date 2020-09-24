package rev.core;

import rev.math.V2;
import kha.Font;
import kha.Image;
import rev.core.Graphics;

class Text extends Drawable {
  public var letterSpacing: Int;
  public var lineSpacing: Int;
  public var maxWidth: Float;
  public var fontSize: Int;
  public var font: Font;
  public var textColor: Int;
  public var textHeight(get, null): Float;
  public var textWidth(get, null): Float;
  public var text: String;

  public function new(width: Int, height: Int, font: kha.Font, ?parent: Object) {
    super(parent);
    this.textColor = 0xFFFFFF;
    this.texture = Image.createRenderTarget(width, height);
    this.font = font;
    this.text = "";
    this.g2 = new Graphics(this.texture.g2);
  }

  private function get_textHeight(): Float {
    return this.font.height(this.fontSize);
  }

  private function get_textWidth(): Float {
    return this.font.width(this.fontSize, this.text);
  }

  public function setText(text: String) {
    this.text = text;
  }

  public function getText() {
    return this.text;
  }

  public function setFontSize(fontSize: Int) {
    this.fontSize = fontSize;
  }

  public function getFontSize(): Int {
    return this.fontSize;
  }

  public function drawText(text: String, position: V2) {
    this.begin();
    this.setText(text);
    this.g2.drawText(this.text, position);
    this.end();
  }

  public override function setColor(color: Int) {
    this.textColor = color;
  }

  public override function resetColor() {
    this.textColor = 0xFFFFFF;
  }

  public override function begin() {
    this.g2.font = this.font;
    this.g2.fontSize = this.fontSize;
    this.g2.color = this.textColor;
    this.g2.begin();
  }
}
