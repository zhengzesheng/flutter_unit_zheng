import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 全局GlobalKey
class GlobalKeyEntity {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}

// 设备信息
class GlobalDevice {
  static MediaQueryData mediaQueryData = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first);
  static double screenWidth = mediaQueryData.size.width; // 屏幕宽度
  static double screenHeight = mediaQueryData.size.height; // 屏幕高度
  static double paddingBottom = mediaQueryData.padding.bottom; // 底部安全区域高度
  static double paddingTop = mediaQueryData.padding.top; // 顶部安全区域高度
  static double devicePixelRatio = mediaQueryData.devicePixelRatio; // 设备像素比
  static double viewInsetsBottom = mediaQueryData.viewInsets.bottom; // 底部安全区域高度
}

// 注册第三方
class GlobalRegister {
  //初始化全局信息，会在APP启动时执行

  static Future init() async {
    // 初始化Flutter
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent, // 导航栏背景透明
        systemNavigationBarIconBrightness: Brightness.dark, // 图标颜色（根据背景改）
        statusBarColor: Colors.transparent, // 可选：状态栏透明
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    // 锁定竖屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
