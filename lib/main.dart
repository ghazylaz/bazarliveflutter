import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:bazarliveflutter/product_icon.dart';
import 'package:bazarliveflutter/themes/light_color.dart';
import 'package:bazarliveflutter/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysql1/mysql1.dart' as mysqcon;
import 'BottomNavigationBar/bottom_navigation_bar.dart';
import 'data.dart';
import 'datatransaction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'def_classes.dart';
import 'extentions.dart';
// @dart=2.9
void main() {
  //_get_perms();
// get_im_locs();
  runApp(MyApp());

 /* Future<void> _log(String log) async {
    print(log ?? '');
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,

    ].request();
    await Future.delayed(Duration(seconds: 1));
  }*/
}
Future<void> _get_perms() async {

  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
  ].request();
  await Future.delayed(Duration(seconds: 1));
}
Future<void> _log(String log) async {

  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
  ].request();
  await Future.delayed(Duration(seconds: 1));
}
void get_im_locs() async {
  // Get the system temp directory.
  var systemTempDir = Directory.fromUri(Uri.parse( "file:///storage/emulated/0/imgo"));
  final con2 = await mysqcon.MySqlConnection.connect(mysqcon.ConnectionSettings(
      host: 'MYSQL5044.site4now.net', port: 3306, user: 'a7231a_bazarli',password: 'A1c3e5g7i9l11', db: 'db_a7231a_bazarli'));
  // List directory contents, recursing into sub-directories,
  // but not following symbolic links.
 Qry imgq= new Qry(con2);
 int fz = 0;
  await for (var entity in
  systemTempDir.list(recursive: true, followLinks: false)) {
    print(entity.path);
    String filename =entity.path.split("/")[entity.path.split("/").length-1];
    Future.delayed(Duration(seconds: 1));
imgq.up_im(entity.path,filename );

  }
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bazar Live بازر لايف',
      theme: ThemeData(fontFamily: 'Cairo',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Bazar Live بازر لايف'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
    List<Advs> lst =[];
  bool isHomePageSelected = true;

  List<Uint8List> lstim=[];



 //Future <List<Advs>> ad=[] as Future<List<Advs>>;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
     //   title: Text(widget.title),
         title: Row(

             children :[_msearch() , Image(image: AssetImage('assets/icon.png'),height: 45,width: 45)])
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bazar Live بازر لايف',
            ),
            _categoryWidget(),
        SingleChildScrollView(scrollDirection: Axis.horizontal,reverse: true,
          child:Add_loader()),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: onBottomIconPressed
              ),
            ) ],
        ),
      ),
     /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget _msearch() {
    return Container(
      width:AppTheme.fullWidth(context)-160 ,
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                    border: InputBorder.none,
                    hintText: "ابحث هنا",
                    hintStyle: TextStyle(fontSize: 18,color: Colors.white),
                    contentPadding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10),

                    prefixIcon:   IconButton( icon: Icon(Icons.search, color: Colors.white),highlightColor: Colors.deepOrange, onPressed: () { print('kabseeee'); },)),
              ),
            ),
          ),
          SizedBox(width: 20)


        ],
      ),

    );
  }
  // ignore: non_constant_identifier_names
 Future get_single_user() async{
   final   conn;
try{
     conn = await mysqcon.MySqlConnection.connect(mysqcon.ConnectionSettings(
      host: 'MYSQL5044.site4now.net', port: 3306, user: 'a7231a_bazarli',password: 'A1c3e5g7i9l11', db: 'db_a7231a_bazarli'));
  print('xxfxx');


    Qry Q =  await Qry(conn);

    String uid ='07485dc1-f4e6-46ab-bc6a-01fc837877b5';
    // var t =  Q.get_user(uid);

   int N = 16;
   mysqcon.Results res2 = await conn.query('SELECT * FROM `adds` order by id desc limit ' + N.toString());
   // var q =await res.elementAt(0).values.elementAt(2);
   // var q2 =await res2.elementAt(0).values.elementAt(0);
//if(lst.length>0){lst.clear();}
  lst.clear();
   mysqcon.Results res;
    for(var q=0;q<15;q++) {

      lst.add(await Advs.fromMap(res2
          .elementAt(q)
          .fields) );
      print('lodaed ad' + q.toString());
    }

     for(var q=0;q<15;q++) {

       res = await conn.query('SELECT * FROM `images_db` WHERE `name` LIKE \"'+ lst.elementAt(q).id +'%\"' );
       var xres=   await Base64Codec().decode(res.elementAt(0).values.elementAt(1).toString() );
       try{      lst.elementAt(q).images.add( await xres);
       }catch(er){
         print(er);
       }

       print('added image index: ' + q.toString());
      /* final Uint8List xf = await Q.down_im(lst
           .elementAt(q)
           .id);
       if (xf == null) {
         lstim.add(await list);
       } else {
         lstim.add(await xf);
       }*/
     }
}catch(rz){
print('eer sq :' +rz.toString());
}

      print("loaded " + lst.length.toString() + ' items');





return lst;
    //Q.disconnect();
//return res2;
    //  print('tata ' + Ad.desc.toString());
//Buser US = new Buser.fromMap(res.elementAt(0).fields);
    //String x =await "";
    //Q.disconnect();
  }
  Widget Add_loader()  {

    return  Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: AppTheme.fullHeight(context),
        height: AppTheme.fullHeight(context) -307,
        child :    FutureBuilder    (
            future:  get_single_user(),
            builder: (context , snap) {
              return  Directionality(
                  textDirection: TextDirection.rtl,
                child:  GridView.builder(



                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 4 / 5,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10),
                padding: EdgeInsets.only(left: 20),
                itemBuilder: (context, i)  {
List<Advs> zee = snap.data as List<Advs>;
String ex =zee.elementAt(i).title;

              return
              Card(

              child:Column(children: [Image.memory(zee.elementAt(i).images.elementAt(0), errorBuilder:
                  (context, error, stackTrace) {
                return Image.asset(
                    'assets/icon.png',
                    fit: BoxFit.fitWidth);
              }), Align(

                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "${ex}".substring(0,min(17,"${ex}".length)),textScaleFactor: 1,softWrap: true,maxLines: 2,
                  )
              )],)



              );

              //  onTap: () => MaterialPageRoute(
              /*  builder: (context) =>
              SecondRoute(id: _data.getId(index), name: _data.getName(index))),
    );
    ////*

    *//*
         */
         */

              },
                itemCount: lst.length  ,
              ));
            }))
    ;
  }
 /* Widget _itemBuilder(BuildContext context, int index) {
    String ex ="XX";

    if(data.length=0){
      ex=ad.elementAt(index).title;

    }

    return
      Card(

          child:
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "${ex}",
              )
          )


      );

    //  onTap: () => MaterialPageRoute(
    /*  builder: (context) =>
              SecondRoute(id: _data.getId(index), name: _data.getName(index))),
    );
    ////*

    *//*
         */
         */

  }*/
  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }
  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,

      child: ListView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
            .map(
              (category) =>
              ProductIcon(
                model: category,
                onSelected: (model) {
                  setState(() {
                    AppData.categoryList.forEach((item) {
                      item.isSelected = false;
                    });
                 /*   AppData.tp.clear();
                    AppData.tp.addAll(AppData.productList);
                    AppData.tp.removeWhere((product) =>
                    product.category.contains(model.name));*/
                    print('sqlll');
                    //  upload_SQL();
                    model.isSelected = true;
                  });
                },
              ),
        )
            .toList(),
      ),
    );
  }

}
