import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/functions.dart';
import '../../constants/style.dart';
import '../../providers/settings_provider.dart';

class NotificationsSettings extends ConsumerStatefulWidget {
  const NotificationsSettings({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends ConsumerState<NotificationsSettings> with Functions {

  @override
  Widget build(BuildContext context) {
    // Is used to init the state of the switches
    ref.read(settingsProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notifications_active,
                      size: 24.0,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    "Notifications",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Add transactions reminder",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  CupertinoSwitch(
                    value: ref.watch(transactionReminderSwitchProvider),
                    onChanged: (value) {
                      ref.read(transactionReminderSwitchProvider.notifier).state = value;
                      ref.read(settingsProvider.notifier).updateNotifications();
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 28, top: 24, bottom: 8),
              child: Text(
                "RECURRING TRANSACTIONS",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(color: grey1),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Recurring transaction added",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      CupertinoSwitch(
                        value: ref.watch(transactionRecAddedSwitchProvider),
                        onChanged: (value) {
                          ref.read(transactionRecAddedSwitchProvider.notifier).state = value;
                          ref.read(settingsProvider.notifier).updateNotifications();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Divider(
                    height: 1,
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Recurring transaction reminder",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      CupertinoSwitch(
                        value: ref.watch(transactionRecReminderSwitchProvider),
                        onChanged: (value) {
                          ref.read(transactionRecReminderSwitchProvider.notifier).state = value;
                          ref.read(settingsProvider.notifier).updateNotifications();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 28, top: 6),
              child: Text(
                "Remind me before a recurring transaction is added",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: grey1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
