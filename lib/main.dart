import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '容器组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('容器组件示例'),
        ),
        body: Column(
          children: <Widget>[
            Row (
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: new Border.all(
                      color: Colors.grey,
                      width: 8.0,
                    ),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  child: Text(
                    'Flutter',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                Image.network(
                  'https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png',
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '红色+黑色删除线+25号',
                      style: TextStyle(
                        color: const Color(0xffff0000),
                        decoration: TextDecoration.lineThrough,
                        decorationColor: const Color(0xff000000),
                        fontSize: 25,
                        letterSpacing: 10,
                      ),
                    ),
                    Text(
                      '橙色 + 下划线 +24 号',
                      style: TextStyle(
                        color: const Color(0xffff9900),
                        decoration: TextDecoration.underline,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '虚线上划线 +23 号 +倾斜',
                      style: TextStyle(
                        decoration: TextDecoration.overline,
                        decorationStyle: TextDecorationStyle.dashed,
                        fontSize: 23.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      '24号+加粗',
                      style: TextStyle(
                        fontSize: 23,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 6,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.green[500],
                  size: 80,
                ),
                IconButton(
                    icon: Icon(
                      Icons.volume_up,
                      size: 48,
                    ),
                    tooltip: '按下操作',
                    onPressed: () {
                      print('按下操作');
                    },
                ),
                RaisedButton(
                  onPressed: () {
                    
                  },
                  child: Text('RaisedButton组件'),
                ),
                    

              ],
            )
          ],
        ),





      ),
    );
  }

}
