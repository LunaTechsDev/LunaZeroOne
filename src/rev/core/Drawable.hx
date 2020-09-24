package rev.core;

import kha.graphics2.Graphics;
import kha.Color;
import rev.core.Types.Image;
import rev.math.V2;
import Type;

/**
 * Any object that can be rendered to the screen.
 * Must have the render context past in to be drawn.
 */
class Drawable extends Object {
	public var position:V2;

	/**
	 * Z Index for which layer the element is drawn at;
	 */
	public var z:Int;

	public var color:rev.utils.ColorUtils.Color;
	public var visible:Bool;
	public var parent:Object;
	public var opacity:Float;
	public var g2:rev.core.Graphics;
	public var globalPosition(get, set):V2;
	public var texture:Image;

	public function new(?parent:Object) {
		this.z = -1;
		this.color = 0xFFFFFF;
		this.position = new V2(0, 0);
		this.parent = parent;
		this.opacity = 1.0;
		this.texture = null;
		this.g2 = null;
	}

	public function begin() {
		this.g2.begin();
	}

	/**
	 *  Used for drawing things on the screen by batching all the draw
	 *  calls to the render system.
	 */
	public function draw() {}

	/**
	 * Sets the color of the drawable element for when drawing
	 * any kind of primitive shape or text.
	 * @param color
	 */
	public function setColor(color:Int) {
		this.color = color;
		this.g2.color = color;
	}

	/**
	 * Resets the color to the default (white).
	 */
	public function resetColor() {
		this.color = 0xFFFFFF;
	}

	/**
	 * Shows the drawable object to the renderer.
	 */
	public function show() {
		this.visible = true;
	}

	/**
	 * Hides the drawable object from the renderer.
	 */
	public function hide() {
		this.visible = false;
	}

	public function getParent() {
		return this.parent;
	}

	public function setParent(parent:Object) {
		this.parent = parent;
	}

	public function setPosition(position:rev.math.V2) {
		this.position = position;
	}

	public inline function getZIndex():Int {
		return this.z;
	}

	public function setZIndex(value:Int) {
		this.z = value;
	}

	public function getPosition() {
		return this.position;
	}

	public function scale(scale:V2) {
		RenderContext.scale(scale);
	}

	public function setOpacity(opacity:Float) {
		this.opacity = opacity;
	}

	public function resetOpacity() {
		this.opacity = 1.0;
	}

	public function set_globalPosition(position:V2):V2 {
		var parent:Dynamic = this.parent;
		if (parent != null && parent.position != null) {
			var currentPosition = this.globalPosition;
			var positionalDiff = position.subTo(currentPosition);
			return this.position = positionalDiff;
		} else {
			return this.position = position;
		}
	}

	public function get_globalPosition():V2 {
		var parent:Dynamic = this.parent;
		if (parent != null && parent.position != null) {
			return this.position.addTo(parent.globalPosition);
		} else {
			return this.position;
		}
	}

	public function end() {
		this.g2.end();
	}
}
