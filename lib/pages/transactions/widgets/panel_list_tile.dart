import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/style.dart';
import '../../../model/transaction.dart';
import '../../../providers/currency_provider.dart';
import '../../../ui/device.dart';
import '../../../ui/extensions.dart';
import '../../../ui/widgets/rounded_icon.dart';
import '../../../ui/widgets/transaction_type_button.dart';

class PanelListTile extends ConsumerWidget {
  const PanelListTile({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.amount,
    required this.transactions,
    required this.percent,
    required this.index,
  });

  final String name;
  final IconData? icon;
  final Color color;
  final double amount;
  final List<Transaction> transactions;
  final double percent;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedListIndexProvider);
    final currencyState = ref.watch(currencyStateNotifier);
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      children: [
        ExpansionPanel(
          isExpanded: selectedIndex == index,
          canTapOnHeader: true,
          backgroundColor: color.withAlpha(90),
          headerBuilder: (context, isExpanded) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.borderRadiusSmall),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.sm,
                vertical: Sizes.lg,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                spacing: Sizes.sm,
                children: [
                  RoundedIcon(
                    icon: icon,
                    backgroundColor: color,
                    padding: const EdgeInsets.all(Sizes.sm),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "${amount.toStringAsFixed(2)} ${currencyState.selectedCurrency.symbol}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: (amount > 0) ? green : red),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${transactions.length} transactions",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              "${percent.toStringAsFixed(2)}%",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              separatorBuilder: (context, index) => const Divider(
                indent: 15,
                endIndent: 15,
              ),
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final amount = transaction.type == TransactionType.income
                    ? transaction.amount
                    : -transaction.amount;
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.sm,
                    vertical: Sizes.lg,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(width: Sizes.xl * 2),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  transaction.note ?? "",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "${amount.toCurrency()} ${currencyState.selectedCurrency.symbol}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: (amount > 0) ? green : red),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  transaction.categoryName?.toUpperCase() ??
                                      "Uncategorized",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  transaction.bankAccountName?.toUpperCase() ??
                                      "",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: Sizes.sm),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
      expansionCallback: (_, isExpanded) {
        if (isExpanded) {
          ref.read(selectedListIndexProvider.notifier).state = index;
        } else {
          ref.invalidate(selectedListIndexProvider);
        }
      },
    );
  }
}
