enum Flavor {
  dev,
  staging,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return '플러터템플릿(dev)';
      case Flavor.staging:
        return '플러터템플릿(staging)';
      case Flavor.prod:
        return '플러터템플릿';
      default:
        return 'title';
    }
  }

}
