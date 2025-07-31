import 'package:flutter_unit_zheng/main.dart';
import 'package:go_router/go_router.dart';

// 根路由
List<RouteBase> rootRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const MyHomePage(title: '11'),
  ),
];
