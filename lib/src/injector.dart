import 'package:clean_architecture/src/core/constants.dart';
import 'package:clean_architecture/src/core/usecase.dart';
import 'package:clean_architecture/src/data/datasources/local/app_database.dart';
import 'package:clean_architecture/src/data/datasources/remote/news_api_service.dart';
import 'package:clean_architecture/src/data/repositories/article_repository_impl.dart';
import 'package:clean_architecture/src/domain/repositories/articles_repository.dart';
import 'package:clean_architecture/src/domain/usecases/get_articles_usecase.dart';
import 'package:clean_architecture/src/domain/usecases/get_saved_articles_usecase.dart';
import 'package:clean_architecture/src/domain/usecases/remove_article_usecase.dart';
import 'package:clean_architecture/src/domain/usecases/save_article_usecase.dart';
import 'package:clean_architecture/src/presentation/blocs/local_articles/local_articles_bloc.dart';
import 'package:clean_architecture/src/presentation/blocs/remote_articles_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector=GetIt.instance;

Future<void> initializeDependencies()async{
  final database=await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);

  injector.registerSingleton<Dio>(Dio());

  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));

  injector.registerSingleton<ArticlesRepository>(ArticlesRepositoryImpl(injector(),injector()));

  injector.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  injector.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(injector()));

  injector.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(injector()));

  injector.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(injector()));

  injector.registerFactory<RemoteArticlesBloc>(()=>RemoteArticlesBloc(injector()));

  injector.registerFactory<LocalArticlesBloc>(() => LocalArticlesBloc(injector(), injector(), injector()));
}