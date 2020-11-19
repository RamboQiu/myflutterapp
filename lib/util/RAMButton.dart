import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RAMButton extends StatefulWidget {
  const RAMButton({
    Key key,
    this.title,
    this.onPressed,
    this.width,
    this.height = 44.0,
    this.decoration,
    this.textStyle,
    this.normalImage,
    this.highlightImage,
    this.disableImage,
    this.normalTextColor,
    this.highlightTextColor,
    this.disableTextColor,
    this.normalBackgroundColor,
    this.highlightBackgroundColor,
    this.disableBackgroundColor,
    this.normalBorderColor,
    this.highlightBorderColor,
    this.disableBorderColor,
    this.imageLeftOffset,
    this.imageRightOffset,
    this.titleLeftOffset,
    this.titleRightOffset,
    this.enabled = true,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final BoxDecoration decoration;
  final TextStyle textStyle;
  final String normalImage;
  final String highlightImage;
  final String disableImage;
  final Color normalTextColor;
  final Color highlightTextColor;
  final Color disableTextColor;
  final Color normalBackgroundColor;
  final Color highlightBackgroundColor;
  final Color disableBackgroundColor;
  final Color normalBorderColor;
  final Color highlightBorderColor;
  final Color disableBorderColor;
  final double imageLeftOffset;
  final double imageRightOffset;
  final double titleLeftOffset;
  final double titleRightOffset;
  final bool enabled;

  @override
  State<StatefulWidget> createState() {
    EdgeInsets.only();
    return _RAMButtonState();
  }

  RAMButton.redFillButton(
      {String title, double fontSize, Size size, VoidCallback onPressed})
      : this(
          title: title,
          onPressed: onPressed,
          width: size.width,
          height: size.height,
          textStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: fontSize,
            color: Color(0xFFDD1A21),
          ),
          normalTextColor: Color(0xFFDD1A21),
          highlightTextColor: Colors.white,
          disableTextColor: Color(0xFFCCCCCC),
          normalBackgroundColor: Colors.white,
          highlightBackgroundColor: Color(0xFFDD1A21),
          disableBackgroundColor: Colors.white,
          normalBorderColor: Color(0xFFDD1A21),
          highlightBorderColor: Color(0x00FFFFFF),
          disableBorderColor: Color(0xFFCCCCCC),
        );

  RAMButton.blackHollowButton(
    {String title, double fontSize, Size size, VoidCallback onPressed})
    : this(
    title: title,
    onPressed: onPressed,
    width: size.width,
    height: size.height,
    textStyle: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: fontSize,
    ),
    normalTextColor: Color(0xFF333333),
    highlightTextColor: Colors.white,
    disableTextColor: Color(0xFFCCCCCC),
    normalBackgroundColor: Colors.white,
    highlightBackgroundColor: Color(0xFFCCCCCC),
    disableBackgroundColor: Colors.white,
    normalBorderColor: Color(0xFF7F7F7F),
    highlightBorderColor: Color(0x00FFFFFF),
    disableBorderColor: Color(0xFFCCCCCC),
  );

  RAMButton.redHollowButton(
    {String title, double fontSize, Size size, VoidCallback onPressed})
    : this(
    title: title,
    onPressed: onPressed,
    width: size.width,
    height: size.height,
    textStyle: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: fontSize,
    ),
    normalTextColor: Color(0xFFDD1A21),
    highlightTextColor: Colors.white,
    disableTextColor: Color(0xFFCCCCCC),
    normalBackgroundColor: Colors.white,
    highlightBackgroundColor: Color(0xFFDD1A21),
    disableBackgroundColor: Colors.white,
    normalBorderColor: Color(0xFFDD1A21),
    highlightBorderColor: Color(0x00FFFFFF),
    disableBorderColor: Color(0xFFCCCCCC),
  );

  RAMButton.redClearHollowButtonMailLogin(
    {String title, double fontSize, Size size, VoidCallback onPressed})
    : this(
    title: title,
    onPressed: onPressed,
    width: size.width,
    height: size.height,
    textStyle: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: fontSize,
    ),
    normalTextColor: Color(0xFFDD1A21),
    highlightTextColor: Color(0xFFDD1A21),
    disableTextColor: Color(0xFFCCCCCC),
    normalBackgroundColor: Color(0x00FFFFFF),
    highlightBackgroundColor: Color(0xFFFFEFEF),
    disableBackgroundColor: Color(0x00FFFFFF),
    normalBorderColor: Color(0xFFDD1A21),
    highlightBorderColor: Color(0xFFDD1A21),
    disableBorderColor: Color(0xFFCCCCCC),
  );

}

class _RAMButtonState extends State<RAMButton> {
  bool _buttonHeldDown = false;

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      setState(() {
        _buttonHeldDown = false;
      });
    }
  }

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      setState(() {
        _buttonHeldDown = true;
      });
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      setState(() {
        _buttonHeldDown = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;
    final Color primaryColor =
        widget.normalTextColor ?? CupertinoTheme.of(context).primaryColor;
    final TextStyle textStyle = widget.textStyle ??
        CupertinoTheme.of(context)
            .textTheme
            .textStyle
            .copyWith(color: primaryColor);
    final Color normalTextColor = widget.normalTextColor ?? primaryColor;
    final Color highlightTextColor =
        widget.highlightTextColor ?? normalTextColor;
    final Color disableTextColor = widget.disableTextColor ?? normalTextColor;

    List<Widget> children = new List();

    if (widget.title != null) {
      children.add(Positioned(
        right: widget.titleRightOffset,
        left: widget.titleLeftOffset,
        child: Text(
          widget.title,
          style: textStyle.copyWith(
              color: enabled
                  ? (_buttonHeldDown ? highlightTextColor : normalTextColor)
                  : disableTextColor),
        ),
      ));
    }

    if (widget.normalImage != null) {
      children.add(Positioned(
          right: widget.imageRightOffset,
          left: widget.imageLeftOffset,
          child: Image(
            image: AssetImage(enabled
                ? (_buttonHeldDown ? widget.highlightImage : widget.normalImage)
                : widget.disableImage),
            fit: BoxFit.contain,
          )));
    }

    Decoration decoration;
    if (widget.decoration == null &&
        (widget.normalBackgroundColor != null ||
            widget.normalBorderColor != null)) {
      Color normalBackgroundColor =
          widget.normalBackgroundColor ?? Colors.white;
      Color highlightBackgroundColor =
          widget.highlightBackgroundColor ?? normalBackgroundColor;
      Color disableBackgroundColor =
          widget.disableBackgroundColor ?? normalBackgroundColor;
      Color normalBorderColor = widget.normalBorderColor ?? null;
      Color highlightBorderColor =
          widget.highlightBorderColor ?? normalBorderColor;
      Color disableBorderColor = widget.disableBorderColor ?? normalBorderColor;
      decoration = BoxDecoration(
        color: enabled
            ? (_buttonHeldDown
                ? highlightBackgroundColor
                : normalBackgroundColor)
            : disableBackgroundColor,
        border: Border.all(
            color: enabled
                ? (_buttonHeldDown ? highlightBorderColor : normalBorderColor)
                : disableBorderColor,
            width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? _handleTapDown : null,
      onTapUp: enabled ? _handleTapUp : null,
      onTapCancel: enabled ? _handleTapCancel : null,
      onTap: widget.onPressed,
      child: Semantics(
        button: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: new Container(
            width: widget.width,
            height: widget.height,
            alignment: Alignment.center,
            decoration: decoration,
            child: Stack(
              alignment: Alignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
