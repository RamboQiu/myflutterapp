import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter/cupertino.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('页面切换动画图一'),
      ),
      body: GestureDetector(
        child: Hero(
            tag: '第一张图片',
            child: Image.network(
                'http://upload.art.ifeng.com/2017/0425/1493105660290.jpg')),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SecondPage();
          }));
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('页面切换动画图二'),
      ),
      body: GestureDetector(
        child: Hero(
            tag: "第二张图片",
            child: Image.network(
                'http://pic.5tu.cn/uploads/allimg/1905/pic_5tu_big_2019050601001168045.jpg')),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'Image Demo',
//      home: ProductList(products: List.generate(20, (i) => Product('商品 $i', '这是一个商品详情 $i'))),
    home: FirstPage(),
  ));
}
