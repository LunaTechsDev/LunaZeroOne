package rev.input;

import kha.input.KeyCode;
import kha.input.Keyboard;
import rev.core.Types;

using Lambda;

typedef KKB = kha.input.Keyboard;
typedef Key = kha.input.KeyCode;
typedef KeyStdLstnr = (key: Key) -> Void;
typedef KeyPressLstnr = (char: String) -> Void;

class Keyboard {
  public static var downListeners: List<LstnrCntnr<KeyStdLstnr>>;
  public static var upListeners: List<LstnrCntnr<KeyStdLstnr>>;
  public static var pressListeners: List<LstnrCntnr<KeyPressLstnr>>;

  public static function initialize() {
    downListeners = new List();
    upListeners = new List();
    pressListeners = new List();
    KKB.get().notify(onKeyDown, onKeyUp, onPress);
  }

  private static function onKeyDown(key: Key): Void {
    downListeners.iter((listenerContainer) -> listenerContainer.lstnr(key));
    trace('Key down ${key}');
  }

  private static function onKeyUp(key: Key): Void {
    upListeners.iter((listenerContainer) -> listenerContainer.lstnr(key));
    trace('Key up: ${key}');
  }

  private static function onPress(char: String) {
    pressListeners.iter((listenerContainer) -> listenerContainer.lstnr(char));
    trace('Pressed : ${char}');
  }

  public static function addDownListener(listener: KeyStdLstnr) {
    var container = { id: downListeners.length + 1, lstnr: listener };
    downListeners.add(container);
    return container.id;
  }

  public static function addUpListener(listener: KeyStdLstnr) {
    var container = { id: upListeners.length + 1, lstnr: listener };
    upListeners.add(container);
    return container.id;
  }

  public static function addPressListener(listener: KeyPressLstnr) {
    var container = { id: pressListeners.length + 1, lstnr: listener };
    pressListeners.add(container);
    return container.id;
  }

  public static function removeListener(listenerType: KeyListenerT, id: Int) {
    var removeById = (lstnrCntnr: LstnrCntnr<Dynamic>) -> lstnrCntnr.id == id;
    switch (listenerType) {
      case KeyDown:
        downListeners = downListeners.filter(removeById);
      case KeyUp:
        upListeners = upListeners.filter(removeById);
      case KeyPress:
        pressListeners = pressListeners.filter(removeById);
    }
  }
}
