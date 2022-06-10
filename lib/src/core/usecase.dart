// abstract class UseCase<T,P>{
//   Future<T> getData({P params});
// }
//
// class DataUseCase implements UseCase<String,int> {
//   @override
//   Future<String> getData({int? params}) {
//     return Future.delayed(Duration(seconds: 1),(){
//       return "data is $params";
//     });
//   }
// }
//
// final dataUseCase= DataUseCase();
// final data=dataUseCase.getData(params: 10);

abstract class UseCase<T, P> {
  Future<T> call({P params});
}

class DataUseCase implements UseCase<String, int> {
  @override
  Future<String> call({int? params}) {
    return Future.delayed(Duration(seconds: 1), () {
      return "data is $params";
    });
  }
}

final dataUseCase = DataUseCase();
final data = dataUseCase(params: 10);
