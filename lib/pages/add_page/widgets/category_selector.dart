import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../constants/functions.dart';
import '../../../constants/style.dart';
import '../../../model/category_transaction.dart';
import '../../../providers/categories_provider.dart';
import '../../../providers/transactions_provider.dart';

class CategorySelector extends ConsumerStatefulWidget {
  const CategorySelector({
    required this.scrollController,
    super.key,
  });

  final ScrollController scrollController;

  @override
  ConsumerState<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends ConsumerState<CategorySelector>
    with Functions {
  @override
  Widget build(BuildContext context) {
    final transactionType = ref.watch(transactionTypeProvider);
    final categoryType =
        ref.watch(transactionToCategoryProvider(transactionType));
    final categoriesList = ref.watch(categoriesByTypeProvider(categoryType));

    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            title: const Text("Category"),
            actions: [
              IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/add-category'),
                icon: const Icon(Icons.add_circle),
                splashRadius: 28,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 16, top: 32, bottom: 8),
                    child: Text(
                      "MORE FREQUENT",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.surface,
                    height: 74,
                    width: double.infinity,
                    child: categoriesList.when(
                      data: (categories) => ListView.builder(
                        itemCount: categories.length, // to prevent range error
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          CategoryTransaction category = categories[i];
                          IconData? icon = iconList[category.symbol];
                          Color? color = categoryColorListTheme[category.color];
                          return GestureDetector(
                            onTap: () => {
                              ref.read(categoryProvider.notifier).state =
                                  category,
                              Navigator.of(context).pop(),
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: color,
                                    ),
                                    padding: const EdgeInsets.all(10.0),
                                    child: icon != null
                                        ? Icon(
                                            icon,
                                            size: 24.0,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                          )
                                        : const SizedBox(),
                                  ),
                                  Text(
                                    category.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Text('Error: $err'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 16, top: 32, bottom: 8),
                    child: Text(
                      "ALL CATEGORIES",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  categoriesList.when(
                    data: (categories) => Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: ListView.separated(
                        itemCount: categories.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1, color: grey1),
                        itemBuilder: (context, i) {
                          CategoryTransaction category = categories[i];
                          IconData? icon = iconList[category.symbol];
                          Color? color = categoryColorListTheme[category.color];
                          return ListTile(
                            onTap: () => ref
                                .read(categoryProvider.notifier)
                                .state = category,
                            leading: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color,
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: icon != null
                                  ? Icon(
                                      icon,
                                      size: 24.0,
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                    )
                                  : const SizedBox(),
                            ),
                            title: Text(category.name),
                            trailing: ref.watch(categoryProvider)?.id ==
                                    category.id
                                ? Icon(Icons.check)
                                : null,
                          );
                        },
                      ),
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, stack) => Text('Error: $err'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
