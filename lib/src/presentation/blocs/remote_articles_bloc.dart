import 'package:clean_architecture/src/core/params/article_request.dart';
import 'package:clean_architecture/src/core/resources/data_state.dart';
import 'package:clean_architecture/src/core/bloc/bloc_with_state.dart';
import 'package:clean_architecture/src/core/usecase.dart';
import 'package:clean_architecture/src/domain/usecases/get_articles_usecase.dart';
import 'package:clean_architecture/src/presentation/blocs/remote_articles_event.dart';
import 'package:clean_architecture/src/presentation/blocs/remote_articles_state.dart';

import '../../domain/entities/article.dart';

class RemoteArticlesBloc extends BlocWithState<RemoteArticlesEvent,RemoteArticlesState>{
  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase):super(const RemoteArticlesLoading()){

    final List<Article> _articles=[];
    int _page=1;
    const int _pageSize=20;

    on<GetArticles>((event,emit)async{
      final dataState=await _getArticlesUseCase(params: ArticlesRequestParams(page:_page));

    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      final articles=dataState.data;
      final noMoreData=articles!.length<_pageSize;
      _articles.addAll(articles);
      _page++;

      emit(RemoteArticlesDone(articles,noMoreData: noMoreData));
    }
    if(dataState is DataFailed){
      emit(RemoteArticlesError(dataState.error!));
    }});

    // @override
    // Stream<RemoteArticlesState> mapEventToState(RemoteArticlesEvent event)async*{
      // on<GetArticles>((event,emit)async{
        // yield* runBlocProcess(()async*{

        // });
        // }
      // if(event is GetArticles) yield* _getBreakingNewsArticle(event);
    }

  }


  //
  // final List<Article> _articles=[];
  // int _page=1;
  // static const int _pageSize=20;

  // @override
  // Stream<RemoteArticlesState> mapEventToState(RemoteArticlesEvent event)async*{
  //   if(event is GetArticles) yield* _getBreakingNewsArticle(event);
  // }
  // Stream<RemoteArticlesState> _getBreakingNewsArticle(RemoteArticlesEvent event)async*{
  //   yield* runBlocProcess(()async*{
  //     final dataState=await _getArticlesUseCase(params: ArticlesRequestParams(page:_page));
  //
  //     if(dataState is DataSuccess && dataState.data!.isNotEmpty){
  //       final articles=dataState.data;
  //       final noMoreData=articles!.length<_pageSize;
  //       _articles.addAll(articles);
  //       _page++;
  //
  //       yield RemoteArticlesDone(_articles,noMoreData: noMoreData);
  //     }
  //     if(dataState is DataFailed){
  //       yield RemoteArticlesError(dataState.error!);
  //     }
  //   });
  //
  // }
