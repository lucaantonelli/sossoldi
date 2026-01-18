import "package:flutter/material.dart";

import "../../../../ui/device.dart";
import "../../../../ui/widgets/rounded_icon.dart";

class DetailsListTile extends StatelessWidget {
  const DetailsListTile({
    required this.title,
    required this.icon,
    required this.value,
    required this.callback,
    super.key,
  });

  final String title;
  final IconData icon;
  final String? value;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(Sizes.lg),
      onTap: callback,
      leading: RoundedIcon(
        icon: icon,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value ?? '',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: Sizes.sm),
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ],
      ),
    );
  }
}
