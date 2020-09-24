package rev.core;

import rev.math.V2;
import haxe.ds.Option;
import kha.Image;

using Lambda;

/**
 * Container that holds other graphical elements such as
 * bitmaps, sprites, and graphics.
 */
class Sprite extends Drawable {
  public var children: Array<Object>;
  public var frameSize: V2;
  public var hFrames: Int;
  public var vFrames: Int;
  public var frameCount: Int;

  public function new(?parent: Object) {
    super(parent);
  }

  public function setTexture(texture: Image) {
    this.texture = texture;
  }

  public function getTexture(): Image {
    return this.texture;
  }

  public function drawFrame(frame: Int) {}

  public function setFrameCount(value: Int) {
    this.frameCount = value;
  }

  public inline function getFrameCount() {
    return this.frameCount;
  }

  public function setFrameSize(size: V2) {
    this.frameSize = size;
  }

  public function setHFrames(value: Int) {
    this.hFrames = value;
  }

  public inline function getHFrames() {
    return this.hFrames;
  }

  public function setVFrames(value: Int) {
    this.vFrames = value;
  }

  public inline function getVFrames() {
    return this.vFrames;
  }

  public function addChild(element: Object) {
    this.children.push(element);
  }

  public function removeChild(element: Object) {
    this.children.remove(element);
  }

  public function removeChildAtIndex(index: Int) {
    this.children.splice(index, 1);
  }

  public function clearChildren() {
    this.children.resize(0);
  }

  public function getChild(index: Int) {
    var child = this.children[index];
    if (child != null) {
      return Some(child);
    } else {
      return None;
    }
  }

  public function getChildren() {
    return this.children;
  }
}
