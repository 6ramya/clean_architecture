import 'package:clean_architecture/src/core/constants.dart';

class ArticlesRequestParams {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  const ArticlesRequestParams(
      {this.page = 1,
      this.category = 'general',
      this.apiKey = kApiKey,
      this.country = 'us',
      this.pageSize = 20});
}
