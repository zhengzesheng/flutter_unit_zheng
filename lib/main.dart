import 'package:flutter/material.dart';
import 'package:flutter_unit_zheng/router/router.dart';
import 'package:flutter_unit_zheng/router/router_config.dart';
import 'package:flutter_unit_zheng/utils/util.dart';
import 'package:flutter_unit_zheng/widget/screen/flutter_screenutil.dart';

import 'common/global.dart';

void main() {
  GlobalRegister.init().then((value) {
    // 初始化路由系统
    AppRouter.instance.init(
      debugLogDiagnostics: true, // 开发模式下开启路由日志
      routes: rootRoutes,
    );
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          // 页面背景设置白色
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Poppins",
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: AppRouter.instance.router,
        locale: const Locale('zh', 'CN'),
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return MediaQuery(
            ///设置文字大小不随系统设置改变
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: Stack(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Utils.dismissKeyboard(context),
                  child: widget!,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
