import 'package:flutter/material.dart';
import '../../api/ApiManager.dart';
import '../common/widgets/custom_scaffold.dart';
import 'NewsSources.dart';

class NewsView extends StatelessWidget {
  static const String routeName = '/newsView';

  NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Sport',
      actions: [
        IconButton(
          onPressed: () {
            //navigate to search screen
          },
          icon: Icon(Icons.search),
        ),
      ],
      body: FutureBuilder(
        future: ApiManager.getInstance().getNewsSources('sports'),
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
