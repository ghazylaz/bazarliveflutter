


import 'dart:convert';

import 'package:bazarliveflutter/def_classes.dart';
import 'package:bazarliveflutter/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

import 'Globs.dart';


class Ind_add_root extends StatelessWidget {
  double statusBarHeight =0;
  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      /* appBar: AppBar(
        title: Text(CAdd!.title.toString()),
      ),*/
      body:
Column(children:[zekozeko(context),
        Add_loader(context),])

     /*   ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),*/




    );


  }
  Widget Add_loader(context)  {

    return  Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: AppTheme.fullWidth(context),
        //height: 400,
        child :    FutureBuilder    (
            future:  ret_add(Curaddid),
            builder: (ctx , snap) {
              if(snap.connectionState==ConnectionState.waiting){
                return  Center(child: Image.asset('assets/download.gif'));
              }
              else{
                return Expanded(child: Align( child:   SizedBox(
height: AppTheme.fullWidth(context),
                    width: AppTheme.fullWidth(context),child: Directionality(

                    textDirection: TextDirection.rtl,
                    child: Expanded(child: Column(children: [Image.memory((snap.data as Advs).images.first, fit: BoxFit.fitWidth,),desc_sc()],))
                )),alignment: Alignment.topCenter,));


              }
            }))
    ;
  }
  Future ret_add(String Addid)async{
    Advs cad;
    try{
//    Results qres = await conn0!.query('SELECT * FROM `adds` WHERE `adid`LIKE "'+ Addid+'"' );
   // cad = new Advs.fromMap(qres.toList().elementAt(0).fields);
    cad=CAdd!;
    Results  res = await conn0!.query('SELECT * FROM `images_db` WHERE `name` LIKE "'+ Addid +'%"' );

    for(var IM in res) {
      var xres = await Base64Codec().decode(IM.elementAt(1).toString());
      cad.images.add(xres);
    }
    }catch (ER){
      var sett = new  ConnectionSettings(
          host: host,
          port: port,
          user: user,
          password: password,
          db: db);


        conn0 =await MySqlConnection.connect(sett);
      Results qres = await conn0!.query('SELECT * FROM `adds` WHERE `adid`LIKE "'+ Addid+'"' );
      cad = new Advs.fromMap(qres.toList().elementAt(0).fields);
      Results  res = await conn0!.query('SELECT * FROM `images_db` WHERE `name` LIKE "'+ Addid +'%"' );

      for(var IM in res) {
        var xres = await Base64Codec().decode(IM.elementAt(1).toString());
        cad.images.add(xres);
      }
    }
    return cad;
  }
Widget zekozeko(context){
     double xr = (MediaQuery.of(context).padding.top);
  double xh;
  return new Container(
    child:
    new Text(
      CAdd!.title,
      style: new TextStyle(fontSize:20.0,
          color: const Color(0xFF000000),
          fontWeight: FontWeight.w300,
          ),
    ),

    color: const Color(0xFF00d9ff),
    margin:  EdgeInsets.fromLTRB(1.0, (xr), 1.0, 1.0),
    alignment: Alignment.center,
    width: 1.7976931348623157e+308,
    height: 50.0,

  );


}
Widget desc_sc(){
    return
  new Container(
  child:
  new Text(
  CAdd!.desc.toString(),
  style: new TextStyle(fontSize:12.0,
  color: const Color(0xFF000000),
  fontWeight: FontWeight.w200,
  ),
  ),

  margin: const EdgeInsets.all(10.0),
  padding:const EdgeInsets.all(10.0) ,
  alignment: Alignment.topRight,

  height: 100.0,
  );


}
}