import 'package:flutter/material.dart';
import '../util/RAMButton.dart';

class RAMAppBar extends StatefulWidget implements PreferredSizeWidget {

  RAMAppBar({
    Key key,
    this.title,
    this.leading,
    this.trailing,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  final Widget leading;
  final String title;
  final Widget trailing;
  final List<Widget> actions;
  final Color backgroundColor;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() {
    return new _RAMAppBarState();
  }

  static Widget leftBackWidget (VoidCallback pressAction) {
    return new RAMButton(
      normalImage: 'images/nav/ic_back2_nor.png',
      highlightImage: 'images/nav/ic_back2_pressed.png',
      width: 37,
      height: 44,
      onPressed: pressAction
    );
  }
}

class _RAMAppBarState extends State<RAMAppBar> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: widget.backgroundColor,
      child: new SafeArea(
        child: new Container(
          decoration: new UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 1.0,
              color: Color(0xFFD9D9D9) // YXColorUtil.yxAlphaColor('0xF9F9F9', 0.99)
            )
          ),
          height: kToolbarHeight,
          child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: new Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: widget.leading,
                ),
                left: 0,
              ),
              Container(
                child: new Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
//              Positioned(
//                child: new Container(
//                  padding: const EdgeInsets.only(right: 5),
//                  child: widget.trailing,
//                )
//              )
            ],
          ),
        )
      ),
    );
  }
}