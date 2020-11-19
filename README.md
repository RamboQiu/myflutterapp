# myflutterapp

## RAMButton

![](https://github.com/RamboQiu/RAMFlutter/blob/master/images/button.png?raw=true)


### 文字按钮

```dart
RAMButton.redFillButton(
  title: '付款',
  fontSize: 14,
  size: Size(79, 32),
  onPressed: () {
    print('test');
  },
)),

RAMButton.blackHollowButton(
  title: '查看物流',
  fontSize: 14,
  size: Size(79, 32),
  onPressed: () {
    print('test');
  },
)),

RAMButton.redHollowButton(
  title: '确认收货',
  fontSize: 14,
  size: Size(79, 32),
  onPressed: () {
    print('test');
  },
)),

RAMButton.redClearHollowButtonMailLogin(
  title: '登录',
  fontSize: 14,
  size: Size(79, 32),
  onPressed: () {
    print('test');
  },
))
```



### 图标和文字按钮

imageLeftOffset 控制图片距离左边的距离，null的话居中

titleRightOffset 控制文字距离右边的距离，null的话居中

```dart
RAMButton(
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
```
## RAMAppBar
## RAMBanner

![](https://github.com/RamboQiu/RAMFlutter/blob/master/images/banner.png?raw=true)


