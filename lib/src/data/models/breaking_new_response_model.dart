import 'package:clean_architecture/src/data/models/article_model.dart';

class BreakingNewsResponseModel{
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  BreakingNewsResponseModel({this.articles,this.status
  ,this.totalResults});

  factory BreakingNewsResponseModel.fromJson(Map<String,dynamic> json){
    return BreakingNewsResponseModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: List<ArticleModel>.from(
          (json['articles'] as List<dynamic>).map((e) => ArticleModel.fromJson(e as Map<String,dynamic>)
      )));
  }
}