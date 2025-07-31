part of 'router.dart';

/// AppRouter 负责初始化和配置 GoRouter 实例，并提供导航功能
class AppRouter {
  /// 单例模式实现
  AppRouter._();
  static final AppRouter _instance = AppRouter._();
  static AppRouter get instance => _instance;

  /// GoRouter 实例
  late final GoRouter router;

  /// 初始化路由系统
  /// [initialLocation]: 初始路由路径
  /// [debugLogDiagnostics]: 是否启用路由日志调试
  void init({
    String initialLocation = '/',
    bool debugLogDiagnostics = false,
    List<RouteBase> routes = const [],
  }) {
    router = GoRouter(
      navigatorKey: GlobalKeyEntity.navigatorKey,
      initialLocation: initialLocation,
      debugLogDiagnostics: debugLogDiagnostics,
      routes: routes,
      errorBuilder: (context, state) => errorPage(context, state),
      redirect: _handleRedirect,
      observers: [
        LoggerObserver(), // 添加路由观察者，用于在路由变化时进行日志记录
      ],
    );
  }

  /// 处理路由重定向逻辑
  String? _handleRedirect(BuildContext context, GoRouterState state) {
    return null; // 返回 null 表示不进行重定向
  }

  /// 导航到指定路径
  void go(String location) {
    router.go(location);
  }

  /// 导航到指定命名路由
  void goNamed(
    String name, {
    Map<String, String> params = const {},
    Map<String, dynamic> queryParams = const {},
  }) {
    router.goNamed(name, pathParameters: params, queryParameters: queryParams);
  }

  /// 导航到新页面，并保留当前路由堆栈
  void push(String location) {
    router.push(location);
  }

  /// 导航到命名路由，并保留当前路由堆栈
  void pushNamed(String name,
      {Map<String, String> params = const {},
      Map<String, dynamic> queryParams = const {}}) {
    router.pushNamed(
      name,
      pathParameters: params,
      queryParameters: queryParams,
    );
  }

  /// 返回上一页
  void pop() {
    router.pop();
  }

  /// 替换当前页面
  void replace(String location) {
    router.replace(location);
  }

  /// 替换当前页面为命名路由
  void replaceNamed(String name,
      {Map<String, String> params = const {},
      Map<String, dynamic> queryParams = const {}}) {
    router.replaceNamed(
      name,
      pathParameters: params,
      queryParameters: queryParams,
    );
  }
}
