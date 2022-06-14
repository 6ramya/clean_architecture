import 'package:clean_architecture/src/domain/usecases/get_articles_usecase.dart';
import 'package:clean_architecture/src/domain/usecases/get_saved_articles_usecase.dart';
import 'package:clean_architecture/src/domain/usecases/save_article_usecase.dart';
import 'package:clean_architecture/src/presentation/blocs/local_articles/local_articles_event.dart';
import 'package:clean_architecture/src/presentation/blocs/local_articles/local_articles_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/remove_article_usecase.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent,LocalArticlesState>{
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;

  LocalArticlesBloc(this._getSavedArticlesUseCase,
      this._removeArticleUseCase,this._saveArticleUseCase)
      :super(const LocalArticlesLoading()) {
    on<GetAllSavedArticles>((event, emit) async {
      final articles = await _getSavedArticlesUseCase();
      _getAllSavedArticles();
      // emit(LocalArticlesDone(articles));
    }
    );
    on<RemoveArticle>((event,emit)async{
          await _removeArticleUseCase(params: event.article);
          _getAllSavedArticles();
          // final articles = await _getSavedArticlesUseCase();
          // emit(LocalArticlesDone(articles));
        });
    on<SaveArticle>((event,emit)async{
          await _saveArticleUseCase(params: event.article);
          // final articles = await _getSavedArticlesUseCase();
          // emit(LocalArticlesDone(articles));
          _getSavedArticlesUseCase();
      //     yield* _getAllSavedArticles();
        });
    }



  // @override
  // Stream<LocalArticlesState> mapEventToState(LocalArticlesEvent event)async*{
  //   if(event is GetAllSavedArticles){
  //     yield* _getAllSavedArticles();
  //   }
  //   if(event is RemoveArticle){
  //     await _removeArticleUseCase(params: event.article);
  //     yield* _getAllSavedArticles();
  //   }
  //   if(event is SaveArticle){
  //     await _saveArticleUseCase(params: event.article);
  //     yield* _getAllSavedArticles();
  //   }
  // }

 void _getAllSavedArticles()async{
    final articles=await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }




}