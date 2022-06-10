import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


import '../../../core/constants.dart';
import '../../models/breaking_new_response_model.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl:kBaseUrl)
abstract class NewsApiService{
  factory NewsApiService(Dio dio, {String? baseUrl}) {
    // TODO: implement
    throw UnimplementedError();
  }

  @GET('/top-headlines')
  Future<HttpResponse<BreakingNewsResponseModel>> getBreakingNewsArticles({
  @Query("apiKey") String apiKey,
    @Query("country") String country,
    @Query("category") String category,
    @Query("page") int page,
    @Query("pageSize") int pageSize,

});

}