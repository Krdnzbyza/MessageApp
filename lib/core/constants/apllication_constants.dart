class ApplicationConstant {
  static ApplicationConstant? _instace;
  static ApplicationConstant get instance {
    if (_instace != null) return _instace!;
    _instace = ApplicationConstant._init();
    return _instace!;
  }

  ApplicationConstant._init();

  final String baseUrl = 'https://picsum.photos/v2/list';
  static const LANG_ASSET_PATH = 'assets/lang';
}
