import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../routes/app_router.dart';
import '../../ui/assets.dart';
import '../../ui/device.dart';
import '/constants/style.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue7,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height / 9),
                Text(
                  'Set up the app',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(color: blue1),
                ),
                const SizedBox(height: 80),
                Image.asset(
                  SossoldiAssets.openVault,
                  height: MediaQuery.sizeOf(context).height / 3.7,
                ),
                const SizedBox(height: 74),
                Text(
                  'In a few steps you\'ll be ready to start keeping\ntrack of your personal finances (almost) like\nMr. Rip',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: blue1),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.xl,
                vertical: Sizes.sm,
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(const BudgetSetupRoute());
                },
                child: const Center(child: Text('START THE SET UP')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
