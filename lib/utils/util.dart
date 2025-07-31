import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static DateTime? _lastPressedAt;
  static void exitApp({bool rightNow = false}) {
    if (rightNow) {
      SystemNavigator.pop();
      return;
    }
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt!) >
            const Duration(seconds: 1)) {
      Fluttertoast.showToast(msg: "再按一次退出"); // 第一次点击或超过1秒，提示再按一次退出
      _lastPressedAt = DateTime.now();
    } else {
      SystemNavigator.pop(); // 双击退出
    }
  }

  ///显示toast
  static void showToast({
    required String msg,
    ToastGravity? gravity,
    Toast? toastLength,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      gravity: gravity ?? ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      toastLength: toastLength ?? Toast.LENGTH_LONG,
    );
  }

  ///复制数据至粘贴板
  static onHandleCopy(String? data) {
    if (data != null && data != '') {
      Clipboard.setData(ClipboardData(text: data));
      showToast(msg: "粘贴成功");
    }
  }

  ///隐藏键盘
  static dismissKeyboard(BuildContext context) {
    final focusNode = FocusScope.of(context);
    if (!focusNode.hasPrimaryFocus) {
      focusNode.unfocus();
      // SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }
}
