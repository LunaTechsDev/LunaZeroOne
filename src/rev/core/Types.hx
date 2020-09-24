package rev.core;

typedef LstnrCntnr<T> = {id:Int, lstnr:T};
typedef Font = kha.Font;
typedef Image = kha.Image;

enum MseListenerT {
	MouseDwn;
	MouseUp;
	MouseMove;
	MouseWheel;
	MouseLeave;
}

enum KeyListenerT {
	KeyDown;
	KeyUp;
	KeyPress;
}
