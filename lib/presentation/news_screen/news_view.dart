import 'package:flutter/material.dart';
import '../../api/ApiManager.dart';
import '../../data/models/category_model.dart';
import '../common/widgets/custom_scaffold.dart';
import 'NewsSources.dart';

class NewsView extends StatelessWidget {
  static const String routeName = '/newsView';

  NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    var category = ModalRoute.of(context)?.settings.arguments as CategoryModel;

    return CustomScaffold(
      title: category.title,
      actions: [
        IconButton(
          onPressed: () {
            //navigate to search screen
          },
          icon: Icon(Icons.search),
        ),
      ],
      body: FutureBuilder(
        future: ApiManager.getInstance().getNewsSources(category.id ?? ''),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          var response = snapshot.data;

          return NewsSourcesWidget(response?.sources?? []);
        },
      ),
    );
  }
}
