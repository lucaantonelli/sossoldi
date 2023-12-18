import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final transactionReminderSwitchProvider = StateProvider<bool>((ref) => false);
final transactionRecReminderSwitchProvider = StateProvider<bool>((ref) => false);
final transactionRecAddedSwitchProvider = StateProvider<bool>((ref) => false);

class AsyncSettingsNotifier extends AsyncNotifier<dynamic> {
  @override
  Future<dynamic> build() async {
    return _getSettings();
  }

  Future<void> _getSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ref.read(transactionReminderSwitchProvider.notifier).state = prefs.getBool('transaction-reminder') ?? false;
    ref.read(transactionRecReminderSwitchProvider.notifier).state = prefs.getBool('transaction-rec-reminder') ?? false;
    ref.read(transactionRecAddedSwitchProvider.notifier).state = prefs.getBool('transaction-rec-added') ?? false;
  }

  Future<void> updateNotifications() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('transaction-reminder', ref.read(transactionReminderSwitchProvider));
      await prefs.setBool(
          'transaction-rec-reminder', ref.read(transactionRecReminderSwitchProvider));
      await prefs.setBool('transaction-rec-added', ref.read(transactionRecAddedSwitchProvider));

      return _getSettings();
    });
  }
}

final settingsProvider = AsyncNotifierProvider<AsyncSettingsNotifier, dynamic>(() {
  return AsyncSettingsNotifier();
});
