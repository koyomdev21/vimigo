import 'package:riverpod/riverpod.dart';
import 'package:vimigo/src/utils/app_preferences.dart';

class DropdownValueNotifier extends AutoDisposeNotifier<int?> {
  @override
  build() {
    state = ref.watch(appPreferencesProvider).getLevel();

    return state;
  }

  void setDropdownValue(int value) {
    state = value;
  }
}

final dropdownValueNotifierProvider =
    NotifierProvider.autoDispose<DropdownValueNotifier, int?>(
        DropdownValueNotifier.new);
