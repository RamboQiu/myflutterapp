import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomePage(),
      title: 'lizi',
      routes: {
        '/first': (BuildContext context) => FirstPage(),
        '/second': (BuildContext context) => SecondPage(),
      },
      initialRoute: '/first',
      theme: new ThemeData(
          primarySwatch: Colors.red
      ),
    );
  }
}

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return new Scaffold(
       appBar: new AppBar(
         title: Text('First Page'),
       ),
       body: Center(
         child: RaisedButton(
             onPressed: () {
               Navigator.pushNamed(context, '/second');
             },
           child: Text(
             '这是第一页',
             style: TextStyle(
               fontSize: 28
             ),
           ),
         ),
       ),
     );
  }
}

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/first');
          },
          child: Text(
            '这是第二页',
            style: TextStyle(
                fontSize: 28
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('MaterialApp 示例'),
      ),
      body: Center(
        child: Text(
          '主页',
          style: TextStyle(
            fontSize: 28
          ),
        ),
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Scaffold脚手架示例'),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: (){},
          tooltip: 'search',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
            tooltip: 'search',
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
            tooltip: 'add',
          )
        ],
      ),
      body: Center(
        child: Text('Scaffold'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 100,
          color: Colors.blue,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('press action');
        },
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.yellow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}

class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key}) : super(key: key);

  @override
  _MyHomePageState1 createState() {
    // TODO: implement createState
    return _MyHomePageState1();
  }
}

class _MyHomePageState1 extends State<MyHomePage1> {
  int _selectedIndex = 1;
  final _widgeOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar示例'),
      ),
      body: Center(
        child: _widgeOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('信息')),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text('通讯录')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('发现')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {

    setState(() {

    });

    _selectedIndex = index;
  }
}

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, @required this.active, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//------------------------- StatefulContainer ----------------------------------
class StatefulContainer extends StatefulWidget {
  StatefulContainer({Key key}) : super(key: key);
  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

//------------------------- StatelessContainer ----------------------------------
class StatelessContainer extends StatelessWidget {
  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

//-----------------------------------------------------------
class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Widget> widgets = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulContainer(key: UniqueKey()),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulContainer(key: UniqueKey()),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchWidget,
        child: Icon(Icons.undo),
      ),
    );
  }

  switchWidget(){
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}

class DefaultTabControllerSample extends StatelessWidget {

  final List<Tab> myTabs = <Tab>[
    Tab(text: '选项卡一'),
    Tab(text: '选项卡二'),
    Tab(text: '选项卡三'),
  ];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: myTabs
            ),
          ),
          body: TabBarView(
              children: myTabs.map((Tab tab) {
                return Center(child: Text(tab.text));
              }).toList(),
          ),
        ),
        
      ),
    );
  }
}

class ItemView {
  final String title;
  final IconData icon;

  const ItemView(this.title, this.icon);

}

const List<ItemView> items = const <ItemView>[
  const ItemView('自驾', Icons.directions_car),
  const ItemView('自行车', Icons.directions_bike),
  const ItemView('轮船', Icons.directions_boat),
  const ItemView('公交车', Icons.directions_bus),
  const ItemView('火车', Icons.directions_railway),
  const ItemView('步行', Icons.directions_walk)
];

class SelectedView extends StatelessWidget {
  final ItemView item;

  const SelectedView(this.item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(item.icon, size: 128, color: textStyle.color,),
            new Text(item.title, style: textStyle,),
          ],
        ),
      ),
    );
  }

}

class TabBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new DefaultTabController(
        length: items.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('TabBar 选项卡示例'),
            bottom: new TabBar(
              tabs: items.map((ItemView item) {
                return new Tab(
                  text: item.title,
                  icon: new Icon(item.icon),
                );
              }).toList(),
              isScrollable: true,
            ),
          ),
          body: new TabBarView(
            children: items.map((ItemView item) {
              return new Padding(
                padding: const EdgeInsets.all(16),
                child: new SelectedView(item),
              );
            }).toList(),
          ),
        )),
    );
  }
}

class LayoutDrawerDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Drawer抽屉组件示例'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text(
                '裘俊云'
              ),
              accountEmail: new Text(
                'qiujunyun@163.com'
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage('images/lake.jpg'),
              ),
              onDetailsPressed: () {
                print('test');
              },
              otherAccountsPictures: <Widget>[
                new Container(
                  child: Image.asset('images/lake.jpg'),
                ),
              ],
            ),
            ListTile(
              leading: new CircleAvatar(
                child: Icon(
                  Icons.color_lens
                ),
              ),
              title: Text('个性装扮'),
            ),
            ListTile(
              leading: new CircleAvatar(
                child: Icon(
                    Icons.photo
                ),
              ),
              title: Text('我的相册'),
            ),
            ListTile(
              leading: new CircleAvatar(
                child: Icon(
                    Icons.wifi
                ),
              ),
              title: Text('免流量特权'),
            ),

          ],
        ),
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'FloatingActionButton示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FloatingActionButton示例'),
        ),
        body: Center(
          child: Text(
            'FloatingActionButton示例',
            style: TextStyle(fontSize: 28),
          ),
        ),
        floatingActionButton: new Builder(builder: (BuildContext context) {
          return new FloatingActionButton(
            child: const Icon(Icons.add),
            tooltip: '请点击FloatingActionButton',
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            elevation: 7.0,
            highlightElevation: 14.0,
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                new SnackBar(
                  content: new Text('你点击了FloatingActionButton'),
                )
              );
            },
            mini: false,
            shape: new CircleBorder(),
            isExtended: false,
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      ),
    );
  }
}

class AlertViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'alert demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('alert demo'),
        ),
        body: Center(
          child: AlertDialog(
            title: Text('提示'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('是否要删除'),
                  Text('一旦删除数据不可恢复！')
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('确定')),
              FlatButton(onPressed: (){}, child: Text('确定')),
              FlatButton(onPressed: (){}, child: Text('确定')),
              FlatButton(onPressed: (){}, child: Text('确定'))
            ],
          ),
        ),
      ),
    );
  }
}


class CardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var card = new SizedBox(
      height: 250,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: Text(
                'asdfasdfasfdadsf',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              subtitle: Text('SUbtitle'),
              leading: Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
            new ListTile(
              title: Text(
                'asdfasdfasfdadsf',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              subtitle: Text('SUbtitle'),
              leading: Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            Divider(),
            Divider(),
            Divider(),
            Divider(),
          ],
        ),
      ),
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text('card 布局'),
      ),
      body: Center(
        child: card,
      ),
    );
  }
}

class ActivityIndicatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'CupertinoActivityIndicator示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('CupertinoActivityIndicator示例'),
        ),
        body: Center(
          child: CupertinoActivityIndicator(
            radius: 60,
          ),
        ),
      ),
    );
  }
}

class CupertinoAlertDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'CupertinoAlertDialog组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('CupertinoAlertDialog组件示例'),
        ),
        body: Center(
          child: CupertinoAlertDialog(
            title: Text('提示'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('是否要删除'),
                  Text('一旦删除数据不可恢复'),
                ],
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('确定'),
                onPressed: () {},
              ),
              CupertinoDialogAction(
                child: Text('取消'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
      title: 'Image Demo',
      home: new CupertinoAlertDialogDemo(),
    )
  );
}