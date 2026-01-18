import 'package:flutter/material.dart';

import '../../../../ui/device.dart';
import '../../../../ui/widgets/rounded_icon.dart';

class LabelListTile extends StatelessWidget {
  const LabelListTile(this.labelController, {super.key});

  final TextEditingController labelController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Sizes.lg,
        Sizes.lg,
        Sizes.xxl,
        Sizes.lg,
      ),
      child: Row(
        children: [
          RoundedIcon(
            icon: Icons.description,
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: Sizes.lg),
          Text(
            "Description",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: Sizes.lg),
          Expanded(
            child: TextField(
              controller: labelController,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Add a description",
              ),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
