package rev.core;

import kha.Image;
import kha.FastFloat;
import kha.graphics2.ImageScaleQuality;
import Std;
import rev.math.V2;

class Graphics {
	public var g2:kha.graphics2.Graphics;
	public var color(get, set):kha.Color;
	public var font(get, set):kha.Font;
	public var fontSize(get, set):Int;
	public var imageScaleQuality(get, set):ImageScaleQuality;
	public var mipmapScaleQuality(get, set):ImageScaleQuality;

	public function new(graphics:kha.graphics2.Graphics) {
		this.g2 = graphics;
	}

	public function begin(clear:Bool = false, ?clearColor:kha.Color) {
		this.g2.begin(clear, clearColor);
	}

	public function end() {
		this.g2.end();
	}

	public function flush() {
		this.g2.flush();
	}

	public function clear(?color) {
		this.g2.clear(color);
	}

	private function get_color():kha.Color {
		return this.g2.color;
	}

	private function set_color(color:kha.Color):kha.Color {
		return this.g2.color = color;
	}

	public function setColor(color) {
		this.g2.color = color;
	}

	public function getColor(color) {
		return this.g2.color;
	}

	public function setFont(font:kha.Font) {
		this.g2.font = font;
	}

	public function getFont():kha.Font {
		return this.g2.font;
	}

	private function get_font():kha.Font {
		return this.g2.font;
	}

	private function set_font(font:kha.Font):kha.Font {
		return this.g2.font = font;
	}

	public function setFontSize(value:Int) {
		this.g2.fontSize = value;
	}

	public function getFontSize():Int {
		return this.g2.fontSize;
	}

	private function get_fontSize():Int {
		return this.g2.fontSize;
	}

	private function set_fontSize(value:Int):Int {
		return this.g2.fontSize = value;
	}

	private function get_imageScaleQuality():ImageScaleQuality {
		return this.g2.imageScaleQuality;
	}

	private function set_imageScaleQuality(value:ImageScaleQuality):ImageScaleQuality {
		return this.g2.imageScaleQuality = value;
	}

	private function get_mipmapScaleQuality():ImageScaleQuality {
		return this.g2.mipmapScaleQuality;
	}

	private function set_mipmapScaleQuality(value:ImageScaleQuality):ImageScaleQuality {
		return this.g2.mipmapScaleQuality = value;
	}

	public function scale(scaleV:V2) {
		this.g2.scale(scaleV.x, scaleV.y);
	}

	public function translate(toV:V2) {
		this.g2.translate(toV.x, toV.y);
	}

	/**
	 * Allows you to offset all drawing operations by a certain amount of pixels.
	 * @param offset
	 */
	public function pushTranslation(offset:V2) {
		this.g2.pushTranslation(offset.x, offset.y);
	}

	/**
	 * Stops the translation over a set number of frames.
	 */
	public function popTransformation() {
		this.g2.popTransformation();
	}

	public function rotate(angle:FastFloat, center:V2) {
		this.g2.rotate(angle, center.x, center.y);
	}

	public function pushRotation(angle:FastFloat, center:V2) {
		this.g2.pushRotation(angle, center.x, center.y);
	}

	// Add transformations functions if necessary

	public function pushOpacity(opacity:Float) {
		this.g2.pushOpacity(opacity);
	}

	public function popOpacity():Float {
		return this.g2.popOpacity();
	}

	public function setOpacity(opacity:Float) {
		this.g2.opacity = opacity;
	}

	public function drawRect(v2:V2, width:Float, height:Float, ?strength:Float) {
		this.g2.drawRect(v2.x, v2.y, width, height, strength);
	}

	public function fillRect(v2:V2, width:Float, height:Float) {
		this.g2.fillRect(v2.x, v2.y, width, height);
	}

	public function drawText(text:String, v2:V2) {
		this.g2.drawString(text, v2.x, v2.y);
	}

	public function drawCharacters(text:Array<Int>, start:Int, length:Int, position:V2) {
		this.g2.drawCharacters(text, start, length, position.x, position.y);
	}

	public function drawLine(vec1:V2, vec2:V2, ?strength:Float) {
		this.g2.drawLine(vec1.x, vec1.y, vec2.x, vec2.y, strength);
	}

	public function drawImage(img:Image, v2:V2) {
		this.g2.drawImage(img, v2.x, v2.y);
	}

	public function drawSubImage(img:Image, position:V2, sx:Float, sy:Float, sw:Float, sh:Float) {
		this.g2.drawSubImage(img, position.x, position.y, sx, sy, sw, sh);
	}

	public function drawScaledSubImage(img:Image, sx:FastFloat, sy:FastFloat, sw:FastFloat, sh:FastFloat, dx:FastFloat, dy:FastFloat, dw:FastFloat,
			dh:FastFloat) {
		this.g2.drawScaledSubImage(img, sx, sy, sw, sh, dx, dy, dw, dh);
	}

	public function fillTriangle(point1:V2, point2:V2, point3:V2) {
		this.g2.fillTriangle(point1.x, point1.y, point2.x, point2.y, point3.x, point3.y);
	}

	public function scissor(position:V2, width:Int, height:Int) {
		this.g2.scissor(Std.int(position.x), Std.int(position.y), width, height);
	}

	public function disableScissor() {
		this.g2.disableScissor();
	}
}
