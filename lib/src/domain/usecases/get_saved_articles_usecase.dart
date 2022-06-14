import 'package:clean_architecture/src/core/usecase.dart';
import 'package:clean_architecture/src/data/repositories/article_repository_impl.dart';

import '../entities/article.dart';
import '../repositories/articles_repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<Article>,void>{
  final ArticlesRepository _articlesRepository;

  GetSavedArticlesUseCase(this._articlesRepository);

  @override
  Future<List<Article>> call ({void params}){
    return _articlesRepository.getSavedArticles();
  }
}