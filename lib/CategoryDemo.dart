import 'package:flutter/material.dart';
import 'nav/RAMAppBar.dart';
import 'banner/RAMBanner.dart';

class CategoryDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: RAMAppBar(
        title: '服饰鞋包',
        leading: RAMAppBar.leftBackWidget((){
          Navigator.pop(context);
        }),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              height: 185,
              child: RAMBanner(
                bannerPress: (int position){
                  print('sssss $position');
                },
              ),
            );
          } else {
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