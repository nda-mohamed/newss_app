import 'package:flutter/material.dart';
import 'package:newss_app/presentation/news_screen/widgets/article_item_widget.dart';
import '../../api/model/articles/Article.dart';

class ArticlesListWidget extends StatelessWidget {
  List<Article> articles;

  ArticlesListWidget(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 15),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        var article = articles[index];
        return ArticleItemWidget(article: article);
      },
    );
  }
}