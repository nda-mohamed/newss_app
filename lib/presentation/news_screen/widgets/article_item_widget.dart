import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newss_app/extentions/DateFormat.dart';
import '../../../api/model/articles/Article.dart';

class ArticleItemWidget extends StatelessWidget {
  final Article article;

  const ArticleItemWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              height: 300,
              fit: BoxFit.cover,
              imageUrl: article.urlToImage ?? '',
              placeholder: (context, url) =>
                  CircularProgressIndicator(strokeAlign: 1),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.title ?? ''),
                    Text(article.description ?? ''),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(article.author ?? ''),
              Text(
                article.publishedAt?.formatArticleDate() ?? "",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
