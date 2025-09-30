import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../ui/widgets/default_container.dart';
import '../../../ui/widgets/transaction_type_button.dart';
import '../../../model/bank_account.dart';
import '../../../model/transaction.dart';
import '../../../providers/accounts_provider.dart';
import '../../../providers/transactions_provider.dart';
import '../../../ui/device.dart';
import 'accounts_pie_chart.dart';
import 'panel_list_tile.dart';

class AccountsTab extends ConsumerStatefulWidget {
  const AccountsTab({
    super.key,
  });

  @override
  ConsumerState<AccountsTab> createState() => _AccountsTabState();
}

class _AccountsTabState extends ConsumerState<AccountsTab> {
  @override
  Widget build(BuildContext context) {
    final accounts = ref.watch(accountsProvider);
    final transactions = ref.watch(transactionsProvider);
    final transactionType = ref.watch(selectedTransactionTypeProvider);

    // create a map to link each accounts with a list of its transactions
    // stored as Map<String, dynamic> to be passed to AccountListTile
    Map<int, List<Transaction>> accountToTransactionsIncome = {},
        accountToTransactionsExpense = {};
    Map<int, double> accountToAmountIncome = {}, accountToAmountExpense = {};
    double totalIncome = 0, totalExpense = 0;

    for (Transaction transaction in transactions.value ?? []) {
      final accountId = transaction.idBankAccount;
      if (transaction.type == TransactionType.income) {
        if (accountToTransactionsIncome.containsKey(accountId)) {
          accountToTransactionsIncome[accountId]?.add(transaction);
        } else {
          accountToTransactionsIncome.putIfAbsent(
              accountId, () => [transaction]);
        }

        // update total amount for the account
        totalIncome += transaction.amount;
        if (accountToAmountIncome.containsKey(accountId)) {
          accountToAmountIncome[accountId] =
              accountToAmountIncome[accountId]! + transaction.amount.toDouble();
        } else {
          accountToAmountIncome.putIfAbsent(
              accountId, () => transaction.amount.toDouble());
        }
      } else if (transaction.type == TransactionType.expense) {
        if (accountToTransactionsExpense.containsKey(accountId)) {
          accountToTransactionsExpense[accountId]?.add(transaction);
        } else {
          accountToTransactionsExpense.putIfAbsent(
              accountId, () => [transaction]);
        }

        // update total amount for the account
        totalExpense -= transaction.amount;
        if (accountToAmountExpense.containsKey(accountId)) {
          accountToAmountExpense[accountId] =
              accountToAmountExpense[accountId]! -
                  transaction.amount.toDouble();
        } else {
          accountToAmountExpense.putIfAbsent(
              accountId, () => -transaction.amount.toDouble());
        }
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: Sizes.xl),
      child: DefaultContainer(
        child: Column(
          children: [
            const TransactionTypeButton(),
            const SizedBox(height: Sizes.lg),
            accounts.when(
              data: (data) {
                List<BankAccount> accountIncomeList = data
                    .where((account) =>
                        accountToAmountIncome.containsKey(account.id))
                    .toList();
                List<BankAccount> accountExpenseList = data
                    .where((account) =>
                        accountToAmountExpense.containsKey(account.id))
                    .toList();
                return transactionType == TransactionType.income
                    ? accountIncomeList.isEmpty
                        ? const SizedBox(
                            height: 400,
                            child: Center(
                              child: Text("No incomes for selected month"),
                            ),
                          )
                        : Column(
                            children: [
                              AccountsPieChart(
                                accounts: accountIncomeList,
                                amounts: accountToAmountIncome,
                                total: totalIncome,
                              ),
                              const SizedBox(height: Sizes.lg),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: accountIncomeList.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemBuilder: (context, index) {
                                  BankAccount account =
                                      accountIncomeList[index];
                                  return PanelListTile(
                                    name: account.name,
                                    color: accountColorList[account.color],
                                    icon: accountIconList[account.symbol],
                                    transactions: accountToTransactionsIncome[
                                            account.id] ??
                                        [],
                                    amount:
                                        accountToAmountIncome[account.id] ?? 0,
                                    percent:
                                        (accountToAmountIncome[account.id] ??
                                                0) /
                                            totalIncome *
                                            100,
                                    index: index,
                                  );
                                },
                              )
                            ],
                          )
                    : accountExpenseList.isEmpty
                        ? const SizedBox(
                            height: 400,
                            child: Center(
                              child: Text("No expenses for selected month"),
                            ),
                          )
                        : Column(
                            children: [
                              AccountsPieChart(
                                accounts: accountExpenseList,
                                amounts: accountToAmountExpense,
                                total: totalExpense,
                              ),
                              const SizedBox(height: Sizes.lg),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: accountExpenseList.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: Sizes.sm),
                                itemBuilder: (context, index) {
                                  BankAccount account =
                                      accountExpenseList[index];
                                  return PanelListTile(
                                    name: account.name,
                                    color: accountColorList[account.color],
                                    icon: accountIconList[account.symbol],
                                    transactions: accountToTransactionsExpense[
                                            account.id] ??
                                        [],
                                    amount:
                                        accountToAmountExpense[account.id] ?? 0,
                                    percent:
                                        (accountToAmountExpense[account.id] ??
                                                0) /
                                            totalExpense *
                                            100,
                                    index: index,
                                  );
                                },
                              )
                            ],
                          );
              },
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
