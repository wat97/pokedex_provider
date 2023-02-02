enum RouterPath { splash, login }

class RouterNavigation {
  static get routesplash => '/${RouterPath.splash.name}';
  static get routelogin => '/${RouterPath.login.name}';
}
