import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newss_app/api/model/articles/ArticlesResponse.dart';
import 'model/response/SourcesResponse.dart';


// singleton class -> one instance only
class ApiManager {
  static const String _baseUrl = 'newsapi.org';
  static const String _sourcesApi = 'v2/top-headlines/sources';
  static const String _articlesApi = 'v2/everything';
  static const String _apiKey = '6f38c289451b48e4a1a2da96b09d46d6';

  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<SourcesResponse> getNewsSources(String category) async {
    //call api to get new sources

    var params = {
      'category': category,
      'apiKey': _apiKey,
    };

    var headers = {
      'Authorization': _apiKey,
    };

    var uri = Uri.https(_baseUrl, _sourcesApi, params);

    var response = await http.get(uri, headers: headers);

    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  Future<ArticlesResponse> getArticles(String sourceId) async {
    var params = {
      'sources': sourceId,
      'apiKey': _apiKey,
    };

    var headers = {
      'Authorization': _apiKey,
    };

    var uri = Uri.https(_baseUrl, _articlesApi, params);

    var response = await http.get(uri, headers: headers);

    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }

}
