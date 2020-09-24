package rev.input;

import rev.math.V2;
import kha.input.Mouse;
import rev.input.MouseBtn;
import rev.core.Types;

using Lambda;

typedef KMS = kha.input.Mouse;
typedef MseStdLstnr = (button: MouseBtn, x: Int, y: Int) -> Void;
typedef MseMoveLstnr = (x: Int, y: Int, moveX: Int, moveY: Int) -> Void;
typedef MseWheelLstnr = (delta: Int) -> Void;
typedef MseLeaveLstnr = () -> Void;

class Mouse {
  public static var coordinates: V2;
  public static var diffCoordinates: V2;
  private static var kms: KMS;
  private static var downListeners: List<LstnrCntnr<MseStdLstnr>>;
  private static var upListeners: List<LstnrCntnr<MseStdLstnr>>;
  private static var moveListeners: List<LstnrCntnr<MseMoveLstnr>>;
  private static var wheelListeners: List<LstnrCntnr<MseWheelLstnr>>;
  private static var leaveListeners: List<LstnrCntnr<MseLeaveLstnr>>;

  public static function initialize() {
    coordinates = new V2(0, 0);
    diffCoordinates = new V2(0, 0);
    downListeners = new List<LstnrCntnr<MseStdLstnr>>();
    upListeners = new List<LstnrCntnr<MseStdLstnr>>();
    moveListeners = new List<LstnrCntnr<MseMoveLstnr>>();
    wheelListeners = new List<LstnrCntnr<MseWheelLstnr>>();
    leaveListeners = new List<LstnrCntnr<MseLeaveLstnr>>();
    kms = KMS.get();
    kms.notify(downListener, upListener, moveListener, wheelListener, leaveListener);
  }

  private static function downListener(button: MouseBtn, x: Int, y: Int) {
    downListeners.iter((lstnrContainer) -> lstnrContainer.lstnr(button, x, y));
    var buttonName: String = button;
    switch (button) {
      case MouseBtn.Left:
        trace('Clicked :${buttonName}');
      case MouseBtn.Right:
        trace('Clicked :${buttonName}');
      case MouseBtn.Middle:
        trace('Clicked :${buttonName}');
    }
  }

  private static function upListener(button: MouseBtn, x: Int, y: Int) {
    upListeners.iter((lstnrContainer) -> lstnrContainer.lstnr(button, x, y));
  }

  private static function moveListener(x: Int, y: Int, moveX: Int, moveY: Int) {
    moveListeners.iter((lstnrContainer) -> lstnrContainer.lstnr(x, y, moveX, moveY));
    trace("Mouse Coordinates", x, y);
    trace("Move Coordinates Difference", moveX, moveY);
    coordinates.x = x;
    coordinates.y = y;
    diffCoordinates.x = moveX;
    diffCoordinates.y = moveY;
  }

  /**
   * Listens for mouse wheel events.
   * @param delta Can have value of 1 or - 1 based on rotation.
   */
  private static function wheelListener(delta: Int) {
    wheelListeners.iter((lstnrContainer) -> lstnrContainer.lstnr(delta));
  }

  private static function leaveListener() {
    leaveListeners.iter((lstnrContainer) -> lstnrContainer.lstnr());
  }

  /**
   * Locks the cursor.
   */
  public static function lockCursor() {
    kms.lock();
  }

  /**
   * Unlocks the cursor.
   */
  public static function unlockCursor() {
    kms.unlock();
  }

  /**
   * Returns the status of the mouse cursor.
   */
  public static function isLocked() {
    return kms.isLocked();
  }

  public static function addDownListener(listener: MseStdLstnr) {
    var container = { id: downListeners.length + 1, lstnr: listener };
    downListeners.add(container);
    return container.id;
  }

  public static function addUpListener(listener: MseStdLstnr) {
    var container = { id: upListeners.length + 1, lstnr: listener };
    upListeners.add(container);
    return container.id;
  }

  public static function addMoveListener(listener: MseMoveLstnr) {
    var container = { id: moveListeners.length + 1, lstnr: listener };
    moveListeners.add(container);
    return container.id;
  }

  public static function addWheelListener(listener: MseWheelLstnr) {
    var container = { id: wheelListeners.length + 1, lstnr: listener };
    wheelListeners.add(container);
    return container.id;
  }

  public static function addLeaveListener(listener: MseLeaveLstnr) {
    var container = { id: leaveListeners.length + 1, lstnr: listener };
    leaveListeners.add(container);
    return container.id;
  }

  public static function removeListener(listenerType: MseListenerT, id: Int) {
    var removeById = (lstnrCntnr: LstnrCntnr<Dynamic>) -> lstnrCntnr.id == id;

    switch (listenerType) {
      case MouseDwn:
        downListeners = downListeners.filter(removeById);
      case MouseUp:
        upListeners = upListeners.filter(removeById);
      case MouseMove:
        moveListeners = moveListeners.filter(removeById);
      case MouseWheel:
        wheelListeners = wheelListeners.filter(removeById);
      case MouseLeave:
        leaveListeners = leaveListeners.filter(removeById);
    }
  }
}
