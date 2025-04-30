abstract class Assets {
  const Assets._();
  static _Icon get icon => const _Icon();
  static _Image get image => const _Image();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icon extends _AssetsHolder {
  const _Icon() : super("assets/icons");

  String get logo => "$basePath/logo.svg";
  String get ARestro => "$basePath/ARestro.svg";
  String get logo_text => "$basePath/logo_text.svg";
  String get google => "$basePath/google.svg";
  String get home => "$basePath/home.svg";
  String get search => "$basePath/search.svg";
  String get cart => "$basePath/cart.svg";
  String get edit => "$basePath/edit.svg";
  String get edit_icon => "$basePath/edit_icon.svg";
  String get heart => "$basePath/heart.svg";
  String get star => "$basePath/star.svg";
  String get star05 => "$basePath/star05.svg";
  String get bag => "$basePath/bag.svg";
  String get voice => "$basePath/voice.svg";
  String get globe => "$basePath/globe.svg";
  String get uzb => "$basePath/uzb.svg";
  String get rus => "$basePath/rus.svg";
  String get us => "$basePath/us.svg";
}

class _Image extends _AssetsHolder {
  const _Image() : super("assets/images");

  String get burger => "$basePath/burger.png";
  String get user => "$basePath/user.png";
  String get person => "$basePath/person.png";
  String get food1 => "$basePath/food1.png";
  String get food2 => "$basePath/food2.png";
  String get food3 => "$basePath/food3.png";
  String get burger_detail => "$basePath/burger_detail.png";
  String get img1 => "$basePath/img1.png";
  String get img2 => "$basePath/img2.png";
  String get img3 => "$basePath/img3.png";
  String get img4 => "$basePath/img4.png";
  String get pizza => "$basePath/pizza.png";
  String get shawarma => "$basePath/shawarma.png";
  String get complete => "$basePath/complete.png";
  String get pattern => "$basePath/pattern.png";
  String get pattern_dark => "$basePath/pattern_dark.png";
}
