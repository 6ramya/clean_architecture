import 'package:clean_architecture/src/domain/entities/source.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int? id;
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article(
      {this.url,
      this.id,
      this.title,
      this.description,
      this.author,
      this.content,
      this.publishedAt,
      this.source,
      this.urlToImage});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];

  @override
  bool get stringify => true;
}
