import 'package:flutter/material.dart';
import 'package:simple_sqflite/simple_sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var message = "无消息";

  void _incrementCounter(value) {
    setState(() {
      message = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    SimpleSqflite sqflite = new SimpleSqflite();
    sqflite.editDBPath('test');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$message',
              style: Theme.of(context).textTheme.headline5,
            ),
            Positioned(
                child: Center(
                  child:
                  new MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('创建表结构'),
                    onPressed: () async {
                      var createMessage = await sqflite.RunSQL('CREATE TABLE Config(id varchar2(255),value varchar2(100));');
                      _incrementCounter(createMessage);
                    },
                  ),
                )
            ),
            Positioned(
                child: Center(
                  child:
                  new MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('插入表数据'),
                    onPressed: () async {
                      var insertMessage = await sqflite.RunInsert("INSERT INTO Config (id,value) values('1','2');");
                      _incrementCounter(insertMessage);
                    },
                  ),
                )
            ),
            Positioned(
                child: Center(
                  child:
                  new MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('查询表数据'),
                    onPressed: () async {
                      var selectMessage = await sqflite.RunSelect("SELECT * FROM Config");
                      _incrementCounter("${selectMessage.length}条数据");
                    },
                  ),
                )
            ),
            Positioned(
                child: Center(
                  child:
                  new MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('修改表数据'),
                    onPressed: () async {
                      var updateMessage = await sqflite.RunUpdate("UPDATE Config SET id = '2'");
                      _incrementCounter(updateMessage);
                    },
                  ),
                )
            ),
            Positioned(
                child: Center(
                  child:
                  new MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('清空数据'),
                    onPressed: () async {
                      var deleteMessage = await sqflite.RunDelete("DELETE FROM Config");
                      _incrementCounter(deleteMessage);
                    },
                  ),
                )
            ),
            Positioned(
                child: Center(
                  child:
                  new MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('多条操作'),
                    onPressed: () async {
                      List<String> sql = [];
                      sql.add("INSERT INTO Config (id,value) values('3','4');");
                      sql.add("INSERT INTO Config (id,value) values('5','6');");
                      var message = await sqflite.RunBatch(sql);
                      _incrementCounter(message);
                    },
                  ),
                )
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
