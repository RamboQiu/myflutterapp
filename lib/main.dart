import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Image.network(
        'https://yanxuan.nosdn.127.net/097e2254bc37d7c53f426d058117faf9.gif',
        fit: BoxFit.fitWidth,
      ),
    );
  }

}

class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图标按钮组件示例'),
      ),
      body: new Center(
        child: new IconButton(
            icon: Icon(Icons.volume_up,size: 48,),
            onPressed: () {
              print('press down');
            },
            tooltip: 'press tooltip',
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'RaiseButton',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('RaiseButton1'),
        ),
        body: new Center(
          child: new RaisedButton(
              onPressed: () {
                print('press action');
              },
              child: new Text('RaiseButton weidget'),
          ),
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '基础列表',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160,
              color: Colors.lightBlue,
            ),
            Container(
              width: 160,
              color: Colors.amber,
            ),
            Container(
              width: 160,
              color: Colors.green,
              child: Column(
                children: <Widget>[
                  Text(
                    '水平',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  Text(
                      '列表',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                  ),
                  Icon(Icons.list),
                ],
              ),
            ),
            Container(
              width: 160,
              color: Colors.deepPurpleAccent,
            ),
            Container(
              width: 160,
              color: Colors.black,
            ),
            Container(
              width: 160,
              color: Colors.pinkAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class LongListView extends StatelessWidget {

  final List<String> items;

  LongListView(this.items);

//  LongListView({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class MyGridView extends StatelessWidget {
  final title = '网格列表示例';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new GridView.count(
          crossAxisCount: 3,
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 30,
          children: <Widget>[
            const Text('01'),
            const Text('02'),
            const Text('03'),
            const Text('11'),
            const Text('12'),
            const Text('13'),
            const Text('21'),
            const Text('21'),
          ],
        ),
      ),
    );
  }
}



void main() {
  runApp(new MaterialApp(
      title: 'Image Demo',
      home: new MyGridView(),
    )
  );
}