import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/transaction.dart';
import '../../providers/transactions_provider.dart';
import '../../routes/app_router.dart';
import 'snack_bar.dart';

void showDuplicatedTransactionSnackBar(
  BuildContext context, {
  required Transaction? transaction,
  required WidgetRef ref,
}) => showSnackBar(
  context,
  actionLabel: "Edit",
  onAction: transaction != null
      ? () async {
          await ref
              .read(transactionsProvider.notifier)
              .transactionSelect(transaction);
          if (context.mounted) {
            context.router.push(CreateTransactionRoute());
          }
        }
      : null,
  message: transaction != null
      ? "${transaction.note} has been created"
      : "Error duplicating transaction",
);
