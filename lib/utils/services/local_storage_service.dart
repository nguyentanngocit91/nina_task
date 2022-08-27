import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences sharedPreferences;

  LocalStorageService({required this.sharedPreferences});

  void saveData({required String key, required dynamic data}) {
    switch (data.runtimeType) {
      case int:
        sharedPreferences.setInt(key, data);
        break;
      case bool:
        sharedPreferences.setBool(key, data);
        break;
      case double:
        sharedPreferences.setDouble(key, data);
        break;
      case List<String>:
        sharedPreferences.setStringList(key, data);
        break;
      default:
        sharedPreferences.setString(key, data);
    }
  }

  dynamic getData(String key) {
    return sharedPreferences.get(key);
  }
}
