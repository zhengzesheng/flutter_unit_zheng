import 'package:flutter/material.dart';
import 'package:flutter_unit_zheng/widget/screen/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Widget errorPage(BuildContext context, GoRouterState state) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('页面未找到'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '404',
            style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          Text('找不到路径: ${state.uri}'),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () => context.go("/"),
            child: const Text('返回'),
          ),
        ],
      ),
    ),
  );
}
