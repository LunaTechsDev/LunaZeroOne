package rev.core;

import kha.Image;
import kha.FastFloat;
import kha.graphics2.ImageScaleQuality;
import Std;
import rev.math.V2;

class RenderContext {
	public static var g2:kha.graphics2.Graphics;
	public static var color(get, set):kha.Color;
	public static var font(get, set):kha.Font;
	public static var fontSize(get, set):Int;
	public static var imageScaleQuality(get, set):ImageScaleQuality;
	public static var mipmapScaleQuality(get, set):ImageScaleQuality;

	public static function setupContext(graphics:kha.graphics2.Graphics) {
		g2 = graphics;
	}

	public static function begin(clear:Bool = false, ?clearColor:kha.Color) {
		g2.begin(clear, clearColor);
	}

	public static function end() {
		g2.end();
	}

	public static function flush() {
		g2.flush();
	}

	public static function clear(?color) {
		g2.clear(color);
	}

	private static function get_color():kha.Color {
		return g2.color;
	}

	private static function set_color(color:kha.Color):kha.Color {
		return g2.color = color;
	}

	public function setColor(color) {
		g2.color = color;
	}

	public function getColor(color) {
		return g2.color;
	}

	public function setFont(font:kha.Font) {
		g2.font = font;
	}

	public function getFont():kha.Font {
		return g2.font;
	}

	private static function get_font():kha.Font {
		return g2.font;
	}

	private static function set_font(font:kha.Font):kha.Font {
		return g2.font = font;
	}

	public static function setFontSize(value:Int) {
		g2.fontSize = value;
	}

	public static function getFontSize():Int {
		return g2.fontSize;
	}

	private static function get_fontSize():Int {
		return g2.fontSize;
	}

	private static function set_fontSize(value:Int):Int {
		return g2.fontSize = value;
	}

	private static function get_imageScaleQuality():ImageScaleQuality {
		return g2.imageScaleQuality;
	}

	private static function set_imageScaleQuality(value:ImageScaleQuality):ImageScaleQuality {
		return g2.imageScaleQuality = value;
	}

	private static function get_mipmapScaleQuality():ImageScaleQuality {
		return g2.mipmapScaleQuality;
	}

	private static function set_mipmapScaleQuality(value:ImageScaleQuality):ImageScaleQuality {
		return g2.mipmapScaleQuality = value;
	}

	public static function scale(scaleV:V2) {
		g2.scale(scaleV.x, scaleV.y);
	}

	public static function translate(toV:V2) {
		g2.translate(toV.x, toV.y);
	}

	/**
	 * Allows you to offset all drawing operations by a certain amount of pixels.
	 * @param offset
	 */
	public static function pushTranslation(offset:V2) {
		g2.pushTranslation(offset.x, offset.y);
	}

	/**
	 * Stops the translation over a set number of frames.
	 */
	public static function popTransformation() {
		g2.popTransformation();
	}

	public static function rotate(angle:FastFloat, center:V2) {
		g2.rotate(angle, center.x, center.y);
	}

	public static function pushRotation(angle:FastFloat, center:V2) {
		g2.pushRotation(angle, center.x, center.y);
	}

	// Add transformations functions if necessary

	public static function pushOpacity(opacity:Float) {
		g2.pushOpacity(opacity);
	}

	public static function popOpacity():Float {
		return g2.popOpacity();
	}

	public static function setOpacity(opacity:Float) {
		g2.opacity = opacity;
	}

	public static function drawRect(v2:V2, width:Float, height:Float, ?strength:Float) {
		g2.drawRect(v2.x, v2.y, width, height, strength);
	}

	public static function fillRect(v2:V2, width:Float, height:Float) {
		g2.fillRect(v2.x, v2.y, width, height);
	}

	public static function drawText(text:String, v2:V2) {
		g2.drawString(text, v2.x, v2.y);
	}

	public static function drawCharacters(text:Array<Int>, start:Int, length:Int, position:V2) {
		g2.drawCharacters(text, start, length, position.x, position.y);
	}

	public static function drawLine(vec1:V2, vec2:V2, ?strength:Float) {
		g2.drawLine(vec1.x, vec1.y, vec2.x, vec2.y, strength);
	}

	public static function drawImage(img:Image, v2:V2) {
		g2.drawImage(img, v2.x, v2.y);
	}

	public static function drawSubImage(img:Image, position:V2, sx:Float, sy:Float, sw:Float, sh:Float) {
		g2.drawSubImage(img, position.x, position.y, sx, sy, sw, sh);
	}

	public static function drawScaledSubImage(img:Image, sx:FastFloat, sy:FastFloat, sw:FastFloat, sh:FastFloat, dx:FastFloat, dy:FastFloat, dw:FastFloat,
			dh:FastFloat) {
		g2.drawScaledSubImage(img, sx, sy, sw, sh, dx, dy, dw, dh);
	}

	public static function fillTriangle(point1:V2, point2:V2, point3:V2) {
		g2.fillTriangle(point1.x, point1.y, point2.x, point2.y, point3.x, point3.y);
	}

	public static function scissor(position:V2, width:Int, height:Int) {
		g2.scissor(Std.int(position.x), Std.int(position.y), width, height);
	}

	public static function disableScissor() {
		g2.disableScissor();
	}
}
