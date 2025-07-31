part of 'router.dart';

/// BuildContext 扩展
/// 为 BuildContext 添加便捷的导航方法
extension RouterExtension on BuildContext {
  /// 导航到指定路径
  void go(String location) {
    AppRouter.instance.go(location);
  }

  /// 导航到指定命名路由
  void goNamed(String name,
      {Map<String, String> params = const {},
      Map<String, dynamic> queryParams = const {}}) {
    AppRouter.instance.goNamed(name, params: params, queryParams: queryParams);
  }

  /// 导航到新页面，并保留当前路由堆栈
  void push(String location) {
    AppRouter.instance.push(location);
  }

  /// 导航到命名路由，并保留当前路由堆栈
  void pushNamed(String name,
      {Map<String, String> params = const {},
      Map<String, dynamic> queryParams = const {}}) {
    AppRouter.instance
        .pushNamed(name, params: params, queryParams: queryParams);
  }

  /// 返回上一页
  void pop() {
    AppRouter.instance.pop();
  }

  /// 替换当前页面
  void replace(String location) {
    AppRouter.instance.replace(location);
  }

  /// 替换当前页面为命名路由
  void replaceNamed(String name,
      {Map<String, String> params = const {},
      Map<String, dynamic> queryParams = const {}}) {
    AppRouter.instance
        .replaceNamed(name, params: params, queryParams: queryParams);
  }
}
