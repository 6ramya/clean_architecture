import 'package:clean_architecture/src/core/usecase.dart';
import 'package:clean_architecture/src/data/repositories/article_repository_impl.dart';

import '../entities/article.dart';
import '../repositories/articles_repository.dart';

class SaveArticleUseCase implements UseCase<void,Article>{
  final ArticlesRepository _articlesRepository;

  SaveArticleUseCase(this._articlesRepository);

  @override
  Future<void> call({Article? params}){
    return _articlesRepository.saveArticle(params!);
  }
}