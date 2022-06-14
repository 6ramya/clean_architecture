import 'package:clean_architecture/src/core/usecase.dart';
import 'package:clean_architecture/src/data/repositories/article_repository_impl.dart';

import '../entities/article.dart';
import '../repositories/articles_repository.dart';

class RemoveArticleUseCase implements UseCase<void, Article> {
  final ArticlesRepository _articlesRepository;

  RemoveArticleUseCase(this._articlesRepository);

  @override
  Future<void> call({Article? params}) {
    return _articlesRepository.removeArticle(params!);
  }
}
