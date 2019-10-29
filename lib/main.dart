import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter/cupertino.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Container> _buildGridTitleList(int count) {
      return new List<Container>.generate(
          count, (int index) {
              return new Container(
                child: new Image.asset('images/lake.jpg'),
        );
      });
    }

    Widget buildGrid() {
      return new GridView.extent(
        maxCrossAxisExtent: 20,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 0,
        crossAxisSpacing: 2,
        children: _buildGridTitleList(9),
      );
    }
    
    
    return new Scaffold(
      appBar: new AppBar(
        title: Text('OverflowBox一处父容器显示示例'),
      ),
      body: new Center(
        child: buildGrid(),
      )
    );
  }
}

void main() {
  runApp(new MaterialApp(
      title: 'Image Demo',
      home: new LayoutDemo(),
    )
  );
}