import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'util/RAMButton.dart';
import 'banner/RAMBanner.dart';
import 'nav/RAMAppBar.dart';
import 'CategoryDemo.dart';

class YXCatlev1Page extends StatelessWidget {

  List<String> images = [
    'https://yanxuan.nosdn.127.net/363658941ebb0da62694bd3bd50b8c98.jpg',
    'https://yanxuan.nosdn.127.net/96d2602d4acb468d1f169be9ec8d314a.jpg',
    'https://yanxuan.nosdn.127.net/57ca853a2c48a75ddd1bb5c1f6cc93f4.jpg',
    'https://yanxuan.nosdn.127.net/82c987bbc858d85db1a379ad154fcbdd.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAMAppBar(
        title: '服饰鞋包',
        leading: RAMAppBar.leftBackWidget((){
          print('back');
        }),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index <= 1) {
            return Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: RAMButton.redFillButton(
                        title: '服饰鞋包',
                        fontSize: 14,
                        size: Size(79, 32),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => new CategoryDemo()));
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: RAMButton.blackHollowButton(
                        title: '查看物流',
                        fontSize: 14,
                        size: Size(79, 32),
                        onPressed: () {
                          print('test');
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: RAMButton.redHollowButton(
                        title: '确认收货',
                        fontSize: 14,
                        size: Size(79, 32),
                        onPressed: () {
                          print('test');
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: RAMButton.redClearHollowButtonMailLogin(
                        title: '登录',
                        fontSize: 14,
                        size: Size(79, 32),
                        onPressed: () {
                          print('test');
                        },
                      ))
                ],
              ),
            );
          } else if (index == 2) {
            return Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: RAMButton(
                      title: '后退',
                      normalTextColor: Color(0xFF333333),
                      highlightTextColor: Color(0xFFDD1A21),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14
                      ),
                      imageLeftOffset: -5,
                      titleRightOffset: 0,
                      normalImage: 'images/nav/ic_back2_nor.png',
                      highlightImage: 'images/nav/ic_back2_pressed.png',
                      width: 50,
                      height: 44,
                      onPressed: (){
                        print('test');
                      }
                    ),
                  )
                ],
              ),
            );
          } else if (index == 3) {
            return Container(
              height: 185,
              child: RAMBanner(
                bannerPress: (int position){
                  print('sssss $position');
                },
              ),
            );
          } else if (index == 4) {
            return Container(
              height: 10,
              color: Color(0xFFF4F4F4),
            );
          }
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10,
            color: Color(0xFFF4F4F4),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: '服饰鞋包',
    home: YXCatlev1Page(),
  ));
}
