import 'package:flutter/material.dart';

import '../../../../ui/device.dart';

class ThemeSelectorTile extends StatelessWidget {
  final ThemeMode mode;
  final bool selected;
  final VoidCallback onSelection;

  const ThemeSelectorTile({
    super.key,
    required this.mode,
    required this.selected,
    required this.onSelection,
  });

  IconData get icon {
    switch (mode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.phone_iphone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelection.call,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: Sizes.xs),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border.all(
            color: selected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(Sizes.borderRadiusSmall),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.md),
          child: Row(
            children: [
              Icon(
                icon,
                color: selected
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: Sizes.md),
              Text(
                "${mode.name[0].toUpperCase()}${mode.name.substring(1)}",
                style: TextStyle(
                  color: selected
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
              const Spacer(),
              if (selected)
                Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
