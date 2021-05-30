import 'package:flutter/material.dart';
import 'package:hellow/post_result_model.dart';
import 'package:hellow/user_model.dart';

void main() {
  runApp(MyApp()); //
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = PostResult();
  User user = User();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('post api'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text((user.id != '')
                ? 'No : ' + user.id + '|' + 'Nama : ' + user.name
                : 'tak ada data'),
            ElevatedButton(
              onPressed: () {
                User.connectToapi("4").then((value) {
                  user = value;
                  setState(() {});
                });
              },
              child: Text('Get'),
            )
          ],
        )),
      ),
    );
  }
}
