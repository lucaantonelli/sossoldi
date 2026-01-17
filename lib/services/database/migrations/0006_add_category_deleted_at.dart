// ignore_for_file: file_names

import 'package:sqflite/sqflite.dart';
import '../migration_base.dart';

// Models
import '/model/category_transaction.dart';

class AddCategoryDeletedAt extends Migration {
  AddCategoryDeletedAt()
    : super(
        version: 6,
        description: 'Add deletedAt column to category transaction',
      );

  @override
  Future<void> up(Database db) async {
    await db.execute(
      'ALTER TABLE $categoryTransactionTable ADD COLUMN ${CategoryTransactionFields.deletedAt} TEXT',
    );
  }
}
