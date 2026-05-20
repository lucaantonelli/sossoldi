import 'package:flutter/foundation.dart';

import 'package:auto_route/auto_route.dart';

import '../model/category_transaction.dart';
import '../model/transaction.dart';
import '../pages/accounts/account_list_page.dart';
import '../pages/accounts/account_page.dart';
import '../pages/accounts/create_edit_account_page.dart';
import '../pages/categories/category_list_page.dart';
import '../pages/categories/create_edit_category_page.dart';
import '../pages/categories/create_edit_subcategory_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/graphs/graphs_page.dart';
import '../pages/onboarding/onboarding_page.dart';
import '../pages/onboarding/widgets/account_setup.dart';
import '../pages/onboarding/widgets/budget_setup.dart';
import '../pages/planning/planning_page.dart';
import '../pages/planning/widget/edit_recurring_transaction.dart';
import '../pages/search/search_page.dart';
import '../pages/settings/backup/backup_page.dart';
import '../pages/settings/general/general_settings_page.dart';
import '../pages/settings/infos/collaborators_page.dart';
import '../pages/settings/infos/more_info_page.dart';
import '../pages/settings/infos/privacy_policy_page.dart';
import '../pages/settings/notifications/notifications_settings.dart';
import '../pages/settings/settings_page.dart';
import '../pages/structure.dart';
import '../pages/transactions/create_transaction/create_transaction_page.dart';
import '../pages/transactions/transactions_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter({required this.isOnboardingCompleted});

  final bool isOnboardingCompleted;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: StructureRoute.page, initial: isOnboardingCompleted),
    AutoRoute(page: OnboardingRoute.page, initial: !isOnboardingCompleted),
    AutoRoute(page: DashboardRoute.page),
    AutoRoute(page: CreateTransactionRoute.page),
    AutoRoute(page: EditRecurringTransactionRoute.page),
    AutoRoute(page: TransactionsRoute.page),
    AutoRoute(page: CategoryListRoute.page),
    AutoRoute(page: CreateEditCategoryRoute.page),
    AutoRoute(page: CreateEditSubcategoryRoute.page),
    AutoRoute(page: MoreInfoRoute.page),
    AutoRoute(page: PrivacyPolicyRoute.page),
    AutoRoute(page: CollaboratorsRoute.page),
    AutoRoute(page: AccountRoute.page),
    AutoRoute(page: AccountListRoute.page),
    AutoRoute(page: CreateEditAccountRoute.page),
    AutoRoute(page: PlanningRoute.page),
    AutoRoute(page: GraphsRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: GeneralSettingsRoute.page),
    AutoRoute(page: NotificationsSettingsRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: BackupRoute.page),
    AutoRoute(page: BudgetSetupRoute.page),
    AutoRoute(page: AccountSetupRoute.page),
  ];
}
