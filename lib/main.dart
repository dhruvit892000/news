import 'package:flutter/material.dart';
import 'package:news1/model/article.dart';
import 'package:news1/service/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('news api'),
        ),
        body: FutureBuilder(
            future: apiService.getArticle(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Article>> snapshot) {
            if(snapshot.hasData)
              {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((BuildContext context, index)
                  {
                    var data = snapshot.data![index];
                    return ListTile(
                      title: Text('${data.title}'),
                      subtitle: Text('${data.description}'),
                      trailing: Image.network('${data.urlToImage}'),
                    );
                  }
                  )
                );
              }
              return Center(
                child:  CircularProgressIndicator(),
              );
            }
        ),
    );

  }

}
