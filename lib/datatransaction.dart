import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:mysql1/mysql1.dart' as mysqcon;
class Qry extends State {
  mysqcon.MySqlConnection? con  ;
  String host ="MYSQL5044.site4now.net";
  int port =3306;
  String user ="a7231a_bazarli";
  String password ="A1c3e5g7i9l11";
  String db ="db_a7231a_bazarli";
   Qry( mysqcon.MySqlConnection con2){
     this.con=con2;
  }

   connect() async {
     con =await mysqcon.MySqlConnection.connect(mysqcon.ConnectionSettings(
         host: host,
         port: port,
         user: user,
         password: password,
         db: db));


  }
   Future get_user(String uuid) async {
       mysqcon.Results res;
       res = await con!.query('SELECT * FROM `user` WHERE `uuid`=\"'+ uuid +'\"' );

         return res;
  }
  Future get_adds(int N) async {
    mysqcon.Results res;
  res = await con!.query('SELECT * FROM `adds` order by id desc limit ' + N.toString());
/*res = await con!.query('SELECT adds.id , adds.adid , adds.views, adds.location , adds.regdate , adds.rank , adds.title ,  adds.desc , adds.contact , adds.images , adds.status , adds.price , adds.duration_total , adds.purchase_date , adds.time_left , adds.rank_paid , adds.ownername ,  adds.Mcat , adds.owner ,adds.Scat , adds.type , images_db.imgb\n'+
    'FROM (adds \n'+
    'INNER JOIN images_db ON adds.adid + ".jpg" = images_db.name) order by adds.id desc limit ' +N.toString() );*/

    return res;
  }

   disconnect() async {
    await con!.close();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  Future up_im(String path, String name) async {
  //  connect();
    // get_single_user();
    //get_single_user();
  /*   final conn = await mysqcon.MySqlConnection.connect(mysqcon.ConnectionSettings(
        host: 'MYSQL5044.site4now.net', port: 3306, user: 'a7231a_bazarli',password: 'A1c3e5g7i9l11', db: 'db_a7231a_bazarli'));
    print('erstr');
    final conn2 = await mysqcon.MySqlConnection.connect(mysqcon.ConnectionSettings(
        host: 'mysql5044.site4now.net',
        port: 3306,
        user: 'a7231a_bazarli',
        password: 'A1c3e5g7i9l11',
        db: 'db_a7231a_bazarli'));
 var results = await conn2.query(
        'SELECT `username` FROM `user` ');

String dir = "/data/user/0/com.example.flutter_app/app_flutter/1.jpg";*/

   File compressedFile = await FlutterNativeImage.compressImage(path,
        quality: 5,);
Uri myUri = Uri.parse(path);
File g = File(path);
//Uint8List zek = await g.readAsBytes();
//mysqcon. Blob blob = new  mysqcon.Blob.fromBytes((zek));
//String x =base64Encode( File(path).readAsBytesSync());
    String x =base64Encode( compressedFile.readAsBytesSync());
//List<int> imageBytes = g.readAsBytesSync();
var result2 = await con!.query('insert into images_db ( imgb, name) values ( ?, ?)', [ x, name]);
//con!.close();
  //  result = await con.query('SELECT * FROM `images_db` WHERE id=4').whenComplete(() {
  //    print('img decode');
 /*   print('img decode');
    String xc = result.elementAt(0).values.elementAt(1).toString();
   // MyHomePage.imo = base64.decode(xc);
return base64.decode(xc);
//  var result = await conn.query('SELECT * FROM `user` WHERE 1');
    await conn2.close();*/
  }
  Future<Uint8List> down_im(String IMGNM) async{
    mysqcon.Results res;
    res = await con!.query('SELECT * FROM `images_db` WHERE `name` LIKE \"'+ IMGNM +'%\"' );
    var xres=   await Base64Codec().decode(res.elementAt(0).values.elementAt(1).toString() );
    return xres;

  }
}