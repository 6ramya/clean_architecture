import 'dart:io';

import 'package:clean_architecture/src/core/params/article_request.dart';
import 'package:clean_architecture/src/core/resources/data_state.dart';
import 'package:clean_architecture/src/data/datasources/local/app_database.dart';
import 'package:clean_architecture/src/data/datasources/remote/news_api_service.dart';
import 'package:clean_architecture/src/domain/entities/article.dart';
import 'package:clean_architecture/src/domain/repositories/articles_repository.dart';
import 'package:dio/dio.dart';

class ArticlesRepositoryImpl implements ArticlesRepository{
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  const ArticlesRepositoryImpl(this._newsApiService,this._appDatabase);
  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(ArticlesRequestParams params) async{
    try{
      final httpResponse=await _newsApiService.getBreakingNewsArticles(
        apiKey: params.apiKey,
        category: params.category,
        country: params.country,
        page: params.page,
        pageSize: params.pageSize
      );
      if(httpResponse.response.statusCode==HttpStatus.ok){
        return DataSuccess(httpResponse.data.articles!);
      }
      return DataFailed(
        DioError(error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        // request:httpResponse.response.request,
        type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions)
      );
    }on DioError catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<List<Article>> getSavedArticles() {
    return _appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> removeArticle(Article article) {
    return _appDatabase.articleDao.deleteArticle(article);
  }

  @override
  Future<void> saveArticle(Article article) {
    return _appDatabase.articleDao.insertArticle(article);
  }

}