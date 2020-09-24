package rev.utils;

import kha.Color;

typedef Color = kha.Color;

class ColorUtils {
	/**
	 * Creates Color from rgba values 0-255
	 * @param r Int 0-255
	 * @param g Int 0-255
	 * @param b Int 0-255
	 * @param a Int 0-255
	 */
	public static function fromRGBInt(r:Int, g:Int, b:Int, a:Int = 255):Color {
		return Color.fromBytes(r, g, b, a);
	}

	/**
	 * Creates color from gba values 0 - 1
	 * @param r Float 0-1
	 * @param g Float 0-1
	 * @param b Float 0-1
	 * @param a Float 0-1
	 */
	public static function fromRGBF(r:Float, g:Float, b:Float, a:Float = 1):Color {
		return Color.fromFloats(r, g, b, a);
	}

	/**
	 * Creates color from HTML Style String #AARRGGBB
	 * @param value
	 */
	public static function fromHTMLStr(value:String):Color {
		return Color.fromString(value);
	}

	/**
	 * Creates a new Color from a packed 32 bit ARGB value
	 * This would be in the hexadecimal format
	 * @param value Int
	 */
	public static function fromValue(value:Int):Color {
		return Color.fromValue(value);
	}
}
