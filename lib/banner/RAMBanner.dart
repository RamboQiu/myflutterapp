import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';

typedef void RAMBannerItemClick(int position);

class RAMBanner extends StatefulWidget {

  static const List<String> imgs1 = [
    'https://yanxuan.nosdn.127.net/c7441a89e6879cd9db45b2cb9474d21a.jpg',
    'https://yanxuan.nosdn.127.net/8ef1176e703575c79d837f77157fee15.jpg',
    'https://yanxuan.nosdn.127.net/033cc5098db3ce1cbb2838b3f96cac79.jpg',
    'https://yanxuan.nosdn.127.net/e442120920a00a7dca2e64bd0ed0f61d.jpg',
    'https://yanxuan.nosdn.127.net/79651c19b4a567bce3bbc1e30a97b589.jpg'
  ];

  static const List<String> imgs2 = [
    'https://yanxuan.nosdn.127.net/363658941ebb0da62694bd3bd50b8c98.jpg',
    'https://yanxuan.nosdn.127.net/96d2602d4acb468d1f169be9ec8d314a.jpg',
    'https://yanxuan.nosdn.127.net/57ca853a2c48a75ddd1bb5c1f6cc93f4.jpg',
    'https://yanxuan.nosdn.127.net/82c987bbc858d85db1a379ad154fcbdd.png',
  ];

  final Size pageSize;
  final List<String> images;
  final EdgeInsets imageEdgeInsets;
  /// s
  final int duration;
  /// ms
  final int interval;

  final double pointRadius;
  final String selectedDotImage;
  final String dotImage;
  final double borderWidth;
  final double borderColor;
  final double cornerRadius;
  final Color backgroundColor;
  final RAMBannerItemClick bannerPress;

  const RAMBanner({
      Key key,
      this.pageSize = const Size(0, 175),
      this.images = imgs1,
      this.imageEdgeInsets,
      this.duration = 5,
      this.interval = 300,
      this.pointRadius = 2,
      this.selectedDotImage,
      this.dotImage,
      this.borderWidth,
      this.borderColor,
      this.cornerRadius = 4,
      this.backgroundColor,
      this.bannerPress})
      : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _RAMBannerState();
  }
}

class _RAMBannerState extends State<RAMBanner> {
  Timer timer;
  int selectedIndex = 0;
  PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    _initPageAutoScroll();
    super.initState();
  }

  @override
  void didUpdateWidget(RAMBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  _initPageAutoScroll() {
    start();
  }

  void start() {
    stop();
    timer = Timer.periodic(
      Duration(seconds: widget.duration??5),
      (timer) {
        if (widget.images.length > 0 &&
            controller != null &&
            controller.page != null) {
          int current = controller.page.toInt() + 1;
          int next = current % widget.images.length;
          controller.animateToPage(
            next,
            duration: Duration(milliseconds: widget.interval??300),
            curve: Curves.linear
          );
        }
      }
    );
  }

  void stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.pageSize.height,
      color: widget.backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          getViewPager(),
          Positioned(
            bottom: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: Container(
                  padding: EdgeInsets.all(0),
                  color: Colors.transparent,
                  child: Row(
                    children: getCircles(),
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget getViewPager() {
    return PageView.builder(
      itemCount: widget.images.length>0?widget.images.length:0,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (widget.bannerPress != null) {
              widget.bannerPress(index);
            }
          },
          child: Container(
            child:CachedNetworkImage(
              imageUrl: widget.images[index],
              fit: BoxFit.contain,
            )
          ),
        );
      },
    );
  }

  List<Widget> getCircles() {
    List<Widget> circles = new List();
    for(int i = 0; i < widget.images.length; i ++) {
      circles.add(
        Container(
          margin: EdgeInsets.all(2),
          width: 6,
          height: 9,
          child: Image(
            image: (i == selectedIndex?
                    AssetImage('images/banner/homepage_switching_point.png'):
                    AssetImage('images/banner/homepage_switching_point_white.png')),
            fit: BoxFit.contain,
          )
        )
      );
    }
    return circles;
  }

  void onPageChanged(index) {
    setState(() {
      selectedIndex = index % widget.images.length;
    });
  }
}
