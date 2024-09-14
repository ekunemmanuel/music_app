class JsonHelper {
  final Map<String, dynamic> _json;

  JsonHelper(this._json);

  dynamic operator [](String key) => _json[key];

  String get id => _json['id'];
  String get title => _json['title'];
}