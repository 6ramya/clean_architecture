import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:clean_architecture/src/data/datasources/local/Dao/articles_dao.dart';
import 'package:floor/floor.dart';

import '../../../domain/entities/article.dart';
import 'converters.dart';

part 'app_database.g.dart';

@TypeConverters([SourceTypeConverter])
@Database(version:1, entities: [Article])
abstract class AppDatabase extends FloorDatabase{
  ArticleDao get articleDao;
}