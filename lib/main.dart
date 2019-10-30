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
        maxCrossAxisExtent: 40,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 0,
        crossAxisSpacing: 10,
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

class TableDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Table表格布局示例'),
      ),
      body: new Center(
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(100),
            1: FixedColumnWidth(100),
            2: FixedColumnWidth(80),
            3: FixedColumnWidth(80)
          },
          border: TableBorder.all(
            color: Colors.black38,
            width: 1.0,
            style: BorderStyle.solid
          ),
          children: const <TableRow>[
            TableRow(
              children: <Widget>[
                Text(
                    'name',
                  textAlign: TextAlign.center,
                ),
                Text('name1'),
                Text('name2'),
                Text('name3'),
              ],
            ),
            TableRow(
              children: <Widget>[
                Text('name'),
                Text('name1'),
                Text('name2'),
                Text('name3'),
              ],
            ),
            TableRow(
              children: <Widget>[
                Text('name'),
                Text('name1'),
                Text('name2'),
                Text('name3'),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Transform矩阵转换示例'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          child: Transform(
            transform: Matrix4.rotationZ(1.55),
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              color: const Color(0xFFE8581C),
              child: const Text('Transform矩阵转换'),
            ),
          ),
        ),
      ),
    );
  }
}

class BaseLineDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: AppBar(
        title: Text('Baseline基准线布局示例'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Baseline(
            baseline: 80,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              'AaBbCc',
              style: TextStyle(
                fontSize: 18,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          Baseline(
            baseline: 80,
            baselineType: TextBaseline.alphabetic,
            child: Container(
              width: 40,
              height: 40,
              color: Colors.green,
            )
          ),
          Baseline(
            baseline: 80,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              'DdEeFf',
              style: TextStyle(
                fontSize: 40,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class WrapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Warp按宽高自动换行布局示例'),
      ),
      body: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: <Widget>[
          Chip(
            label: Text('asdfasdf'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text(
                '西门',
                style: TextStyle(
                  fontSize: 10
                ),
              ),
            ),
          ),
          Chip(
            backgroundColor: Colors.blue,
            label: Text('asdfasdf'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text(
                '西门',
                style: TextStyle(
                  fontSize: 10
                ),
              ),
            ),
          ),
          Chip(
            label: Text('asdfasdasdadasf'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text(
                '西门',
                style: TextStyle(
                  fontSize: 10
                ),
              ),
            ),
          ),
          Chip(
            label: Text('asdfasdf'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text(
                '西门',
                style: TextStyle(
                  fontSize: 10
                ),
              ),
            ),
          ),
          Container(
            width: 10,
            height: 60,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("first page"),
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: RaisedButton(
            onPressed: (){
              _navigateToSecondPage(context);
            },
            child: Text('查看商品详情'),
          ),
        );
      })
    );
  }
}

_navigateToSecondPage(BuildContext context) async {
  final result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
    return new SecondScreen();
  }));

  Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("second page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context, 'test');
          },
          child: Text('返回'),
        ),
      ),

    );
  }
}

class Product {
  final String title;
  final String description;

  Product(this.title, this.description);
}

class ProductList extends StatelessWidget {
  final List<Product> products;
  
  ProductList({Key key, @required this.products}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: Text(products[index].title),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetail(product: products[index]);
              }));
            },
    
          );
        },
      ),
    );
  }
  
  
}

class ProductDetail extends StatelessWidget {
  
  final Product product;
  
  ProductDetail({Key key, @required this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text('${product.description}'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title1;

  MyHomePage({Key key, @required this.title1}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title1),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible?1:0,
          duration: Duration(milliseconds: 1000),
          child: Container(
            width: 300,
            height: 300,
            color: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: '显示隐藏',
        child: Icon(Icons.flip),
        ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
      title: 'Image Demo',
//      home: ProductList(products: List.generate(20, (i) => Product('商品 $i', '这是一个商品详情 $i'))),
      home: MyHomePage(title: 'test'),
    )
  );
}