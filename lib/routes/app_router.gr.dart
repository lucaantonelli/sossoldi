// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AccountListPage]
class AccountListRoute extends PageRouteInfo<void> {
  const AccountListRoute({List<PageRouteInfo>? children})
    : super(AccountListRoute.name, initialChildren: children);

  static const String name = 'AccountListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountListPage();
    },
  );
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountPage();
    },
  );
}

/// generated route for
/// [AccountSetupPage]
class AccountSetupRoute extends PageRouteInfo<void> {
  const AccountSetupRoute({List<PageRouteInfo>? children})
    : super(AccountSetupRoute.name, initialChildren: children);

  static const String name = 'AccountSetupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountSetupPage();
    },
  );
}

/// generated route for
/// [BackupPage]
class BackupRoute extends PageRouteInfo<void> {
  const BackupRoute({List<PageRouteInfo>? children})
    : super(BackupRoute.name, initialChildren: children);

  static const String name = 'BackupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BackupPage();
    },
  );
}

/// generated route for
/// [BudgetSetupPage]
class BudgetSetupRoute extends PageRouteInfo<void> {
  const BudgetSetupRoute({List<PageRouteInfo>? children})
    : super(BudgetSetupRoute.name, initialChildren: children);

  static const String name = 'BudgetSetupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BudgetSetupPage();
    },
  );
}

/// generated route for
/// [CategoryListPage]
class CategoryListRoute extends PageRouteInfo<void> {
  const CategoryListRoute({List<PageRouteInfo>? children})
    : super(CategoryListRoute.name, initialChildren: children);

  static const String name = 'CategoryListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CategoryListPage();
    },
  );
}

/// generated route for
/// [CollaboratorsPage]
class CollaboratorsRoute extends PageRouteInfo<void> {
  const CollaboratorsRoute({List<PageRouteInfo>? children})
    : super(CollaboratorsRoute.name, initialChildren: children);

  static const String name = 'CollaboratorsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CollaboratorsPage();
    },
  );
}

/// generated route for
/// [CreateEditAccountPage]
class CreateEditAccountRoute extends PageRouteInfo<void> {
  const CreateEditAccountRoute({List<PageRouteInfo>? children})
    : super(CreateEditAccountRoute.name, initialChildren: children);

  static const String name = 'CreateEditAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateEditAccountPage();
    },
  );
}

/// generated route for
/// [CreateEditCategoryPage]
class CreateEditCategoryRoute
    extends PageRouteInfo<CreateEditCategoryRouteArgs> {
  CreateEditCategoryRoute({
    Key? key,
    bool hideIncome = false,
    List<PageRouteInfo>? children,
  }) : super(
         CreateEditCategoryRoute.name,
         args: CreateEditCategoryRouteArgs(key: key, hideIncome: hideIncome),
         initialChildren: children,
       );

  static const String name = 'CreateEditCategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateEditCategoryRouteArgs>(
        orElse: () => const CreateEditCategoryRouteArgs(),
      );
      return CreateEditCategoryPage(key: args.key, hideIncome: args.hideIncome);
    },
  );
}

class CreateEditCategoryRouteArgs {
  const CreateEditCategoryRouteArgs({this.key, this.hideIncome = false});

  final Key? key;

  final bool hideIncome;

  @override
  String toString() {
    return 'CreateEditCategoryRouteArgs{key: $key, hideIncome: $hideIncome}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateEditCategoryRouteArgs) return false;
    return key == other.key && hideIncome == other.hideIncome;
  }

  @override
  int get hashCode => key.hashCode ^ hideIncome.hashCode;
}

/// generated route for
/// [CreateEditSubcategoryPage]
class CreateEditSubcategoryRoute
    extends PageRouteInfo<CreateEditSubcategoryRouteArgs> {
  CreateEditSubcategoryRoute({
    Key? key,
    required CategoryTransaction category,
    List<PageRouteInfo>? children,
  }) : super(
         CreateEditSubcategoryRoute.name,
         args: CreateEditSubcategoryRouteArgs(key: key, category: category),
         initialChildren: children,
       );

  static const String name = 'CreateEditSubcategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateEditSubcategoryRouteArgs>();
      return CreateEditSubcategoryPage(key: args.key, category: args.category);
    },
  );
}

class CreateEditSubcategoryRouteArgs {
  const CreateEditSubcategoryRouteArgs({this.key, required this.category});

  final Key? key;

  final CategoryTransaction category;

  @override
  String toString() {
    return 'CreateEditSubcategoryRouteArgs{key: $key, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateEditSubcategoryRouteArgs) return false;
    return key == other.key && category == other.category;
  }

  @override
  int get hashCode => key.hashCode ^ category.hashCode;
}

/// generated route for
/// [CreateTransactionPage]
class CreateTransactionRoute extends PageRouteInfo<CreateTransactionRouteArgs> {
  CreateTransactionRoute({
    Key? key,
    Transaction? transaction,
    List<PageRouteInfo>? children,
  }) : super(
         CreateTransactionRoute.name,
         args: CreateTransactionRouteArgs(key: key, transaction: transaction),
         initialChildren: children,
       );

  static const String name = 'CreateTransactionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateTransactionRouteArgs>(
        orElse: () => const CreateTransactionRouteArgs(),
      );
      return CreateTransactionPage(
        key: args.key,
        transaction: args.transaction,
      );
    },
  );
}

class CreateTransactionRouteArgs {
  const CreateTransactionRouteArgs({this.key, this.transaction});

  final Key? key;

  final Transaction? transaction;

  @override
  String toString() {
    return 'CreateTransactionRouteArgs{key: $key, transaction: $transaction}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateTransactionRouteArgs) return false;
    return key == other.key && transaction == other.transaction;
  }

  @override
  int get hashCode => key.hashCode ^ transaction.hashCode;
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}

/// generated route for
/// [EditRecurringTransactionPage]
class EditRecurringTransactionRoute extends PageRouteInfo<void> {
  const EditRecurringTransactionRoute({List<PageRouteInfo>? children})
    : super(EditRecurringTransactionRoute.name, initialChildren: children);

  static const String name = 'EditRecurringTransactionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditRecurringTransactionPage();
    },
  );
}

/// generated route for
/// [GeneralSettingsPage]
class GeneralSettingsRoute extends PageRouteInfo<void> {
  const GeneralSettingsRoute({List<PageRouteInfo>? children})
    : super(GeneralSettingsRoute.name, initialChildren: children);

  static const String name = 'GeneralSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GeneralSettingsPage();
    },
  );
}

/// generated route for
/// [GraphsPage]
class GraphsRoute extends PageRouteInfo<void> {
  const GraphsRoute({List<PageRouteInfo>? children})
    : super(GraphsRoute.name, initialChildren: children);

  static const String name = 'GraphsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GraphsPage();
    },
  );
}

/// generated route for
/// [MoreInfoPage]
class MoreInfoRoute extends PageRouteInfo<void> {
  const MoreInfoRoute({List<PageRouteInfo>? children})
    : super(MoreInfoRoute.name, initialChildren: children);

  static const String name = 'MoreInfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MoreInfoPage();
    },
  );
}

/// generated route for
/// [NotificationsSettingsPage]
class NotificationsSettingsRoute extends PageRouteInfo<void> {
  const NotificationsSettingsRoute({List<PageRouteInfo>? children})
    : super(NotificationsSettingsRoute.name, initialChildren: children);

  static const String name = 'NotificationsSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationsSettingsPage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [PlanningPage]
class PlanningRoute extends PageRouteInfo<void> {
  const PlanningRoute({List<PageRouteInfo>? children})
    : super(PlanningRoute.name, initialChildren: children);

  static const String name = 'PlanningRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PlanningPage();
    },
  );
}

/// generated route for
/// [PrivacyPolicyPage]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacyPolicyPage();
    },
  );
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [StructurePage]
class StructureRoute extends PageRouteInfo<void> {
  const StructureRoute({List<PageRouteInfo>? children})
    : super(StructureRoute.name, initialChildren: children);

  static const String name = 'StructureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StructurePage();
    },
  );
}

/// generated route for
/// [TransactionsPage]
class TransactionsRoute extends PageRouteInfo<void> {
  const TransactionsRoute({List<PageRouteInfo>? children})
    : super(TransactionsRoute.name, initialChildren: children);

  static const String name = 'TransactionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TransactionsPage();
    },
  );
}
