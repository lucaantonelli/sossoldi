import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/category_transaction.dart';
import '../sossoldi_database.dart';

part 'category_repository.g.dart';

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepository(database: ref.watch(databaseProvider));
}

class CategoryRepository {
  CategoryRepository({required SossoldiDatabase database})
    : _sossoldiDB = database;

  final SossoldiDatabase _sossoldiDB;

  final orderByASC = '${CategoryTransactionFields.createdAt} ASC';

  Future<CategoryTransaction> insert(CategoryTransaction item) async {
    final db = await _sossoldiDB.database;
    final id = await db.insert(categoryTransactionTable, item.toJson());
    return item.copy(id: id);
  }

  Future<CategoryTransaction> selectById(int id) async {
    final db = await _sossoldiDB.database;

    final maps = await db.query(
      categoryTransactionTable,
      columns: CategoryTransactionFields.allFields,
      where: '${CategoryTransactionFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return CategoryTransaction.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<CategoryTransaction>> selectAll() async {
    final db = await _sossoldiDB.database;

    final result = await db.query(
      categoryTransactionTable,
      orderBy: orderByASC,
    );

    return result.map((json) => CategoryTransaction.fromJson(json)).toList();
  }

  Future<List<CategoryTransaction>> selectCategoriesByType(
    CategoryTransactionType type,
  ) async {
    final db = await _sossoldiDB.database;

    final result = await db.query(
      categoryTransactionTable,
      columns: CategoryTransactionFields.allFields,
      where: '${CategoryTransactionFields.type} = ?',
      whereArgs: [type.label],
      orderBy: orderByASC,
    );

    if (result.isNotEmpty) {
      return result.map((json) => CategoryTransaction.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<int> updateItem(CategoryTransaction item) async {
    final db = await _sossoldiDB.database;

    // You can use `rawUpdate` to write the query in SQL
    return db.update(
      categoryTransactionTable,
      item.toJson(update: true),
      where: '${CategoryTransactionFields.id} = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteById(int id) async {
    final db = await _sossoldiDB.database;

    return await db.delete(
      categoryTransactionTable,
      where: '${CategoryTransactionFields.id} = ?',
      whereArgs: [id],
    );
  }
}
