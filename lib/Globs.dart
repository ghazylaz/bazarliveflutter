library my_prj.globals;

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:mysql1/mysql1.dart';

import 'def_classes.dart';
 String Curaddid="";
 Advs? CAdd;
bool isHomePageSelected = true;
List<Advs> lst =[];
List<Uint8List> lstim=[];
List<List<Advs>> tot_cat =[];
List<bool> rets=[false,false,false,false,false,false,false,false,false,false];
List<Widget> lvs =[];
MySqlConnection? conn0  ;
 String host ="mysql5044.site4now.net";
 int port =3306;
 String user ="a7231a_bazarli";
 String password ="A1c3e5g7i9l11";
 String db ="db_a7231a_bazarli";


