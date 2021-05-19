import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:bazarliveflutter/category.dart';
import 'package:bazarliveflutter/product_icon.dart';
import 'package:bazarliveflutter/themes/light_color.dart';
import 'package:bazarliveflutter/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as mysqcon;
import 'BottomNavigationBar/bottom_navigation_bar.dart';
import 'Globs.dart';
import 'data.dart';
import 'datatransaction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'def_classes.dart';
import 'ind_add_C001.dart';

// ignore: import_of_legacy_library_into_null_safe
void main()  {
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


  /*String host ="sql6.freemysqlhosting.net";
    int port =3306;
    String user ="sql6411181";
    String password ="vHRQdWMTlS";
    String db ="sql6411181";-*/
  // conn0 = await mysqcon.MySqlConnection.connect(mysqcon.ConnectionSettings(
  //    host: 'MYSQL5044.site4now.net', port: 3306, user: 'a7231a_bazarli',password: 'A1c3e5g7i9l11', db: 'db_a7231a_bazarli'));
  var sett = new  mysqcon.ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db);



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
              top: 0,
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

  Widget Add_loader()  {

    return  Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: AppTheme.fullWidth(context),
        height: AppTheme.fullHeight(context) -312,
        child :    FutureBuilder    (
            future:  Load_cat_divided_adds(),
            builder: (ctx , snap) {
              if(snap.connectionState==ConnectionState.waiting){
                return  Center(child: Image.asset('assets/download.gif'));
              }
              else{
              return   SizedBox(

              width: AppTheme.fullHeight(context),child: Directionality(

                  textDirection: TextDirection.rtl,
                  child: Expanded(child: Column(children: [face_line_loader(snap,ctx,conn0)],))
              ));}
            }))
    ;
  }
  Widget Cat_tit(Category Cat){
    return SizedBox(height: 30,child: Row(children: [
        Image.asset(Cat.image),Text(
        Cat.name,
          style: TextStyle(height: 1.2, fontSize: 10))
    ]));
  }
  Widget face_line_loader(snap,ctx,conn0){
    return Align(alignment: Alignment.centerRight,child: Column(

        children :  [SizedBox(
       height: AppTheme.fullHeight(context)-312,
      width: AppTheme.fullWidth(context)-1,
      child:  ListView.builder(

          scrollDirection: Axis.vertical,
          reverse: false,
          itemCount: 9,
          itemBuilder: (qs, i)
          {
            return Column(children:[Cat_tit( categoryList[i+1]),
             Cat_line_loader(snap,i,ctx,conn0)]);
          }
      ))]));
      /*    Cat_line_loader(snap,4,ctx),
      Cat_line_loader(snap,5,ctx),
      Cat_line_loader(snap,6,ctx),
      Cat_line_loader(snap,7,ctx),
      Cat_line_loader(snap,8,ctx),
      Cat_line_loader(snap,9,ctx)*/


    //],);

  }

  Widget Cat_line_loader(snap,ii,ctx,coni){
    var qs = ctx;
    List<List<Advs>> zee = snap.data as List<List<Advs>>;
    if(rets[ii]==true){
    return lvs[ii];
    }else{
    return  FutureBuilder    (
        future:  Load_cat_image_adds(zee.elementAt(ii), coni),
        builder: (ctx , snap2)  {
          if(snap2.connectionState==ConnectionState.waiting){
            return  Center(child: Image.asset('assets/download.gif'));
          }
          else{
            rets[ii]=true;
            lvs.add(new Text("zee"));
            return lvs[ii]= SizedBox(
              width:1800,
height: 262,
      child: new  ListView.builder(

    scrollDirection: Axis.horizontal,
      reverse: false,
      itemCount: 4,
      itemBuilder: (qs, i)
      {
      
        String ex =zee.elementAt(ii).elementAt(i).title;

        
                List Xim =snap2.data as List;
                return GestureDetector(
                  onTap: () {
                    Curaddid =zee.elementAt(ii).elementAt(i).id;
                    CAdd=zee.elementAt(ii).elementAt(i);

                    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ind_add_root()),) ;
                    }
                  ,
                  child:
                  Card(

                    child: SizedBox(
                        height: 340.0,
                        child :Column(children: [Image.memory(Xim.elementAt(i) , errorBuilder:
                            (context, error, stackTrace) {
                          return Image.asset(
                              'assets/icon.png',
                              fit: BoxFit.fitWidth);
                        },width: 200,height: 200,fit: BoxFit.contain ,), Align(

                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "${ex}".substring(0,min(17,"${ex}".length)),textScaleFactor: 1,softWrap: true,maxLines: 2,
                            )
                        )])



                    )));

      }));

          }});}
           


        //  onTap: () => MaterialPageRoute(
        /*  builder: (context) =>
              SecondRoute(id: _data.getId(index), name: _data.getName(index))),
    );
    ////*

    *//*
         */
         */

      }
 
  
 /* Widget Add_loader()  {

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
  }*/
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
      height: 50,

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
        var xres=   await Base64Codec().decode(res.elementAt(0).values!.elementAt(1).toString() );
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


  // ignore: non_constant_identifier_names
  Future Load_cat_divided_adds() async{
    tot_cat=[];
   String host ="mysql5044.site4now.net";
    int port =3306;
    String user ="a7231a_bazarli";
    String password ="A1c3e5g7i9l11";
    String db ="db_a7231a_bazarli";
    /*String host ="sql6.freemysqlhosting.net";
    int port =3306;
    String user ="sql6411181";
    String password ="vHRQdWMTlS";
    String db ="sql6411181";-*/
   // conn0 = await mysqcon.MySqlConnection.connect(mysqcon.ConnectionSettings(
    //    host: 'MYSQL5044.site4now.net', port: 3306, user: 'a7231a_bazarli',password: 'A1c3e5g7i9l11', db: 'db_a7231a_bazarli'));
   var sett = new  mysqcon.ConnectionSettings(
        host: host,
        port: port,
        user: user,
        password: password,
        db: db);
   try{

    conn0 =await mysqcon.MySqlConnection.connect(sett);}catch(t){
     print('Zee :Server Connected' + t.toString());
   }


    try{


      List<String> CL = ["سيارات و آليات", "عقارات", "أزياء - موضة - تجميل", "الكترونيات", "موبايلات", "فرص عمل", "خدمات", "مطاعم", "اثاث", "العاب"];


      List<mysqcon.Results> LQ =[];
     for (String C in  CL){
       mysqcon.Results qres = await conn0!.query('SELECT * FROM `adds` WHERE `Mcat`LIKE \"'+ C+'\" ORDER BY `rank` LIMIT 5');
       LQ.add( qres );

     }
     List<Advs> temp_lad =[];
for (int y=0;y<9;y++){
  mysqcon.Results Xres =LQ.elementAt(y);
  temp_lad=[];
 for (int z=0 ; z<4;z++){


    var Xres2 =Xres.toList().elementAt(z).fields;
Advs AD =(await Advs.fromMap(Xres2));

    print('Zee :lodaed ad /' + y.toString() +'/ / ' + z.toString());

  /*  mysqcon.Results  res = await conn0!.query('SELECT * FROM `images_db` WHERE `name` LIKE \"'+ AD.id +'%\"' );
    var xres=   await Base64Codec().decode(res.elementAt(0).values!.elementAt(1).toString() );
    try{
     AD.images.add( await xres);
     // tot_cat[y].elementAt(z).images.add( await xres);
    print('added image index: ' + ((y+1)*(z+1)).toString());
    }catch(er){
      print(er);
    }*/
    temp_lad.add(AD);

}
  tot_cat.add(temp_lad);
}
    }catch(rz){
      print('eer sq :' +rz.toString());
    }

    //  mysqcon.Results res2 = await conn.query('SELECT * FROM `adds` order by id desc limit ' + N.toString());
      // var q =await res.elementAt(0).values.elementAt(2);
      // var q2 =await res2.elementAt(0).values.elementAt(0);
//if(lst.length>0){lst.clear();}
     // lst.clear();

    /*  mysqcon.Results res;
      for(var q=0;q<15;q++) {

        lst.add(await Advs.fromMap(res2
            .elementAt(q)
            .fields) );
        print('lodaed ad' + q.toString());
      }*/

  /*    for(var q=0;q<15;q++) {

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
    }*/

    print("loaded " + lst.length.toString() + ' items');





    return tot_cat;
    //Q.disconnect();
//return res2;
    //  print('tata ' + Ad.desc.toString());
//Buser US = new Buser.fromMap(res.elementAt(0).fields);
    //String x =await "";
    //Q.disconnect();
  }
  Future Load_cat_image_adds(List<Advs> Addid,mysqcon.MySqlConnection? coni ) async{
    /*mysqcon.MySqlConnection? conn0  ;
    String host ="mysql5044.site4now.net";
    int port =3306;
    String user ="a7231a_bazarli";
    String password ="A1c3e5g7i9l11";
    String db ="db_a7231a_bazarli";*/
    /*String host ="sql6.freemysqlhosting.net";
    int port =3306;
    String user ="sql6411181";
    String password ="vHRQdWMTlS";
    String db ="sql6411181";-*/
    // conn0 = await mysqcon.MySqlConnection.connect(mysqcon.ConnectionSettings(
    //    host: 'MYSQL5044.site4now.net', port: 3306, user: 'a7231a_bazarli',password: 'A1c3e5g7i9l11', db: 'db_a7231a_bazarli'));
   /* var sett = new  mysqcon.ConnectionSettings(
        host: host,
        port: port,
        user: user,
        password: password,
        db: db);
    try{

      conn0 =await mysqcon.MySqlConnection.connect(sett);}catch(t){
      print('Zee :Server Connected' + t.toString());
    }*/

   // try{


    //  List<String> CL = ["سيارات و آليات", "عقارات", "أزياء - موضة - تجميل", "الكترونيات", "موبايلات", "فرص عمل", "خدمات", "مطاعم", "اثاث", "العاب"];


    //  List<mysqcon.Results> LQ =[];
    /*  for (String C in  CL){
        mysqcon.Results qres = await conn0!.query('SELECT * FROM `adds` WHERE `Mcat`LIKE \"'+ C+'\" ORDER BY `rank` LIMIT 5');
        LQ.add( qres );

      }*/
      /*List<Advs> temp_lad =[];
      for (int y=0;y<9;y++){
        mysqcon.Results Xres =LQ.elementAt(y);
        temp_lad=[];
        for (int z=0 ; z<4;z++){


          var Xres2 =Xres.toList().elementAt(z).fields;
          Advs AD =(await Advs.fromMap(Xres2));

          print('Zee :lodaed ad /' + y.toString() +'/ / ' + z.toString());*/
    List ims =[];
for(int tt =0;tt<4;tt++){
  mysqcon.Results  res = await coni!.query('SELECT * FROM `images_db` WHERE `name` LIKE \"'+ Addid.elementAt(tt).id +'%\"' );
var xres=   await Base64Codec().decode(res.elementAt(0).values!.elementAt(1).toString() );
ims.add(xres);
}
        
          print("lodaed image :" + Addid.elementAt(0).id.toString());
     /*     try{
            AD.images.add( await xres);
            // tot_cat[y].elementAt(z).images.add( await xres);
            print('added image index: ' + ((y+1)*(z+1)).toString());
          }catch(er){
            print(er);
          }
          temp_lad.add(AD);

        }
        tot_cat.add(temp_lad);
      }
    }catch(rz){
      print('eer sq :' +rz.toString());
    }*/

    //  mysqcon.Results res2 = await conn.query('SELECT * FROM `adds` order by id desc limit ' + N.toString());
    // var q =await res.elementAt(0).values.elementAt(2);
    // var q2 =await res2.elementAt(0).values.elementAt(0);
//if(lst.length>0){lst.clear();}
    // lst.clear();

    /*  mysqcon.Results res;
      for(var q=0;q<15;q++) {

        lst.add(await Advs.fromMap(res2
            .elementAt(q)
            .fields) );
        print('lodaed ad' + q.toString());
      }*/

    /*    for(var q=0;q<15;q++) {

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
    }*/

    print("loaded " + lst.length.toString() + ' items');





    return ims;
    //Q.disconnect();
//return res2;
    //  print('tata ' + Ad.desc.toString());
//Buser US = new Buser.fromMap(res.elementAt(0).fields);
    //String x =await "";
    //Q.disconnect();
  }
  static List<Category> categoryList = [
    Category(),
    Category(id: 1, name: "سيارات و آليات", image: 'assets/cars.png'),
    Category(id: 2, name: "عقارات", image: 'assets/realestate.png'),
    Category(id: 3, name: "ازياء موضة تجميل", image: 'assets/fashion.png'),
    Category(id: 4, name: "الكترونيات", image: 'assets/electronics.png'),
    Category(id: 5, name: "موبايلات", image: 'assets/mobile.png'),
    Category(id: 6, name: "فرص عمل", image: 'assets/job.png'),
    Category(id: 7, name: "خدمات", image: 'assets/services.png'),
    Category(id: 8, name: "مطاعم", image: 'assets/food.png'),
    Category(id: 9, name: "اثاث", image: 'assets/furniture.png'),
    Category(id: 10, name: "العاب", image: 'assets/gaming.png'),


  ];

}

