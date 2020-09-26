package rev.core;

import rev.input.Mouse;
import rev.input.Keyboard;
import rev.core.Types.LstnrCntnr;

class Interactive<T> {
  public var entity: T;
  public var onMouseDown(get, set): MseStdLstnr;
  public var onMouseUp(get, set): MseStdLstnr;
  public var onMouseMove(get, set): MseMoveLstnr;
  public var onMouseWheel(get, set): MseWheelLstnr;
  public var onMouseLeave(get, set): MseLeaveLstnr;

  public var onKeyDown(get, set): KeyStdLstnr;
  public var onKeyUp(get, set): KeyStdLstnr;
  public var onKeyPress(get, set): KeyPressLstnr;

  private var mouseDownListener: LstnrCntnr<MseStdLstnr>;
  private var mouseUpListener: LstnrCntnr<MseStdLstnr>;
  private var mouseMoveListener: LstnrCntnr<MseMoveLstnr>;
  private var mouseWheelListener: LstnrCntnr<MseWheelLstnr>;
  private var mouseLeaveListener: LstnrCntnr<MseLeaveLstnr>;

  private var keyDownListener: LstnrCntnr<KeyStdLstnr>;
  private var keyUpListener: LstnrCntnr<KeyStdLstnr>;
  private var keyPressListener: LstnrCntnr<KeyPressLstnr>;

  public function new(entity: T) {
    this.entity = entity;
  }

  private function set_onMouseDown(listener: MseStdLstnr): MseStdLstnr {
    if (this.mouseDownListener != null) {
      Mouse.removeListener(MouseDwn, this.mouseDownListener.id);
    }
    if (listener != null) {
      var mouseDownId = Mouse.addDownListener(listener);
      this.mouseDownListener = { id: mouseDownId, lstnr: listener };
      return this.mouseDownListener.lstnr;
    } else {
      return null;
    }
  }

  private function get_onMouseDown(): MseStdLstnr {
    return this.mouseDownListener.lstnr;
  }

  private function set_onMouseUp(listener: MseStdLstnr): MseStdLstnr {
    if (this.mouseUpListener != null) {
      Mouse.removeListener(MouseUp, this.mouseUpListener.id);
    }
    if (listener != null) {
      this.mouseUpListener = { id: Mouse.addUpListener(listener), lstnr: listener };
      return this.mouseUpListener.lstnr;
    } else {
      return null;
    }
  }

  private function get_onMouseUp(): MseStdLstnr {
    return this.mouseUpListener.lstnr;
  }

  private function set_onMouseMove(listener: MseMoveLstnr): MseMoveLstnr {
    if (this.mouseMoveListener != null) {
      Mouse.removeListener(MouseDwn, this.mouseMoveListener.id);
    }
    if (listener != null) {
      mouseMoveListener = { id: Mouse.addMoveListener(listener), lstnr: listener };
      return mouseMoveListener.lstnr;
    } else {
      return null;
    }
  }

  private function get_onMouseMove(): MseMoveLstnr {
    return this.mouseMoveListener.lstnr;
  }

  private function set_onMouseWheel(listener: MseWheelLstnr): MseWheelLstnr {
    if (this.mouseWheelListener != null) {
      Mouse.removeListener(MouseMove, this.mouseWheelListener.id);
    }
    if (listener != null) {
      this.mouseWheelListener = { id: Mouse.addWheelListener(listener), lstnr: listener };
      return this.mouseWheelListener.lstnr;
    } else {
      return null;
    }
  }

  private function get_onMouseWheel(): MseWheelLstnr {
    return this.mouseWheelListener.lstnr;
  }

  private function set_onMouseLeave(listener: MseLeaveLstnr): MseLeaveLstnr {
    if (this.mouseLeaveListener != null) {
      Mouse.removeListener(MouseLeave, this.mouseLeaveListener.id);
    }
    if (listener != null) {
      this.mouseLeaveListener = { id: Mouse.addLeaveListener(listener), lstnr: listener };
      return this.mouseLeaveListener.lstnr;
    } else {
      return null;
    }
  }

  private function get_onMouseLeave(): MseLeaveLstnr {
    return this.mouseLeaveListener.lstnr;
  }

  private function set_onKeyDown(listener: KeyStdLstnr): KeyStdLstnr {
    if (this.keyDownListener != null) {
      Keyboard.removeListener(KeyDown, this.keyDownListener.id);
    }
    if (listener != null) {
      this.keyDownListener = { id: Keyboard.addDownListener(listener), lstnr: listener };
      return this.keyDownListener.lstnr;
    } else {
      return null;
    }
  }

  private function get_onKeyDown(): KeyStdLstnr {
    return this.keyDownListener.lstnr;
  }

  private function set_onKeyUp(listener: KeyStdLstnr): KeyStdLstnr {
    if (this.keyUpListener != null) {
      Keyboard.removeListener(KeyUp, this.keyUpListener.id);
    }
    if (listener != null) {
      this.keyUpListener = { id: Keyboard.addUpListener(listener), lstnr: listener };
      return this.keyUpListener.lstnr;
    } else {
      return null;
    }
  }

  private function get_onKeyUp(): KeyStdLstnr {
    return this.keyUpListener.lstnr;
  }

  private function set_onKeyPress(listener: KeyPressLstnr): KeyPressLstnr {
    if (this.keyPressListener != null) {
      Keyboard.removeListener(KeyPress, this.keyPressListener.id);
    }
    if (listener != null) {
      this.keyPressListener = { id: Keyboard.addPressListener(listener), lstnr: listener };
      return this.keyPressListener.lstnr;
    } else {
      return null;
    }
  }

  private function get_onKeyPress(): KeyPressLstnr {
    return this.keyPressListener.lstnr;
  }
}
