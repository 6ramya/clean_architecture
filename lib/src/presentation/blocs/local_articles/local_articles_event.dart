import 'package:clean_architecture/src/domain/entities/article.dart';
import 'package:clean_architecture/src/domain/usecases/get_saved_articles_usecase.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticlesEvent extends Equatable{
  final Article? article;

  const LocalArticlesEvent({this.article});

  @override
  List<Object?> get props=>[article];
}
class GetAllSavedArticles extends LocalArticlesEvent{
  const GetAllSavedArticles();
}

class RemoveArticle extends LocalArticlesEvent{
  const RemoveArticle(Article? article):super(article: article);
}

class SaveArticle extends LocalArticlesEvent{
  const SaveArticle(Article? article):super(article: article);
}