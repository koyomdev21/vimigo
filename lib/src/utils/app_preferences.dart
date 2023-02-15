import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  Future<void> setLevel(int level) async {
    await sharedPreferences.setInt('level', level);
  }

  int? getLevel() {
    final level = sharedPreferences.getInt('level');
    return level;
  }
}

final appPreferencesProvider = Provider<AppPreferences>((ref) {
  return AppPreferences(sharedPreferences: ref.watch(sharedPrefsProvider));
});

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
