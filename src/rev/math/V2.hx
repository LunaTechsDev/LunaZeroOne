package rev.math;

import hxmath.math.Vector2;

typedef HV2 = Vector2;

class V2Base {
	public var x:Float;
	public var y:Float;

	public inline function new(x:Float, y:Float) {
		this.x = x;
		this.y = y;
	}

	public function toString() {
		return '($x, $y)';
	}
}

@:forward(x, y)
abstract V2(V2Base) from V2Base to V2Base {
	public var length(get, never):Float;

	public inline function new(x:Float, y:Float) {
		this = new V2Base(x, y);
	}

	public static inline var elementCount:Int = 2;

	@:op(A + B)
	public static inline function add(a:V2, b:V2) {
		return a.addTo(b);
	}

	@:op(A - B)
	public static inline function sub(a:V2, b:V2) {
		return a.subTo(b);
	}

	@:op(-A)
	public static inline function negate(a:V2) {
		return new V2Base(-a.x, -a.y);
	}

	@:op(A == B)
	public static inline function equals(a:V2, b:V2) {
		return a.x == b.x && a.y == b.y;
	}

	@:op(A * B)
	public static inline function scalar(a:V2, b:V2) {
		return a.scale(b);
	}

	public inline function addTo(v2:V2) {
		return new V2(this.x + v2.x, this.y + v2.y);
	}

	public inline function subTo(v2:V2) {
		return new V2(this.x - v2.x, this.y - v2.y);
	}

	public inline function normalize() {
		var self:V2 = this;
		return new V2(this.x / self.magnitude(), this.y / self.magnitude());
	}

	public inline function scale(scaleV:V2) {
		return new V2(this.x * scaleV.x, this.y * scaleV.y);
	}

	public inline function distanceTo(v2:V2) {
		return Math.sqrt(Math.pow((this.x - v2.x), 2) + Math.pow((this.y - v2.y), 2));
	}

	public inline function magnitude() {
		return Math.sqrt((this.x * this.x) + (this.y * this.y));
	}

	/**
	 * Dot Product result.
	 * @param v2
	 * @return Float
	 */
	public inline function dotProduct(v2:V2):Float {
		return (this.x * v2.x) + (this.y + v2.y);
	}

	/**
	 * Normalized Dot Product anywhere from 1 - 1.
	 * @param v2
	 * @return Float
	 */
	public inline function dotProductN(v2:V2):Float {
		var self:V2 = this;
		var norm1 = self.normalize();
		var norm2 = v2.normalize();
		return (norm1.x * norm2.x) + (norm1.y + norm2.y);
	}

	private inline function get_length():Float {
		return Math.sqrt((this.x * this.x) + (this.y * this.y));
	}

	private inline function get_normal():V2 {
		var v2:V2 = this;
		return v2;
	}
}
