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
  int _selectedIndex = 0;
  static const List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Favorites Page')),
    Center(child: Text('Settings Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool wide = constraints.maxWidth >= 600.w;
        return Scaffold(
          body: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: wide
                    ? NavigationRail(
                        key: const ValueKey('rail'),
                        selectedIndex: _selectedIndex,
                        onDestinationSelected: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        labelType: NavigationRailLabelType.all,
                        leading: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FlutterLogo(size: 40),
                        ),
                        destinations: const [
                          NavigationRailDestination(
                            icon: Icon(Icons.home_outlined),
                            selectedIcon: Icon(Icons.home),
                            label: Text('Home'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.favorite_border),
                            selectedIcon: Icon(Icons.favorite),
                            label: Text('Favorites'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.settings_outlined),
                            selectedIcon: Icon(Icons.settings),
                            label: Text('Settings'),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Expanded(child: _pages[_selectedIndex])
            ],
          ),
          bottomNavigationBar: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: wide
                ? const SizedBox.shrink()
                : BottomNavigationBar(
                    key: const ValueKey('bottom'),
                    currentIndex: _selectedIndex,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
