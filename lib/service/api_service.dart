import 'dart:convert';

import 'package:http/http.dart';
import 'package:news1/model/article.dart';

class ApiService{
  final endPoint = "https://newsapi.org/v2/everything?q=tesla&from=2022-07-25&sortBy=publishedAt&apiKey=9710db7b75f648718a62e0fa2f585f44";
  Future<List<Article>> getArticle() async{
           Response response = await get(Uri.parse(endPoint));
           if(response.statusCode == 200)
             {
                 Map<String , dynamic> json = jsonDecode(response.body);
                 List<dynamic> body = json['articles'];
                 List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
                 return articles;
             }
           else
             {
                throw 'Data not found';
             }
  }
}
