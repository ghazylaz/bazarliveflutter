

// @dart=2.9
// ignore: import_of_legacy_library_into_null_safe
import 'dart:typed_data';

import 'package:mysql1/mysql1.dart';

class Buser{

  String id="";
  String name="";
  String email="";
  DateTime regdate=DateTime.now();
  String password="";
  String fav="";

  Buser(String id,String name,String email,DateTime regdate,String password, String fav){
    this.id=id;
    this.name = name;
    this.email=email;
    this.regdate=regdate;
    this.password = password;
    this.fav= fav;
  }
  factory Buser.fromMap(Map<String, dynamic> data) {
    return Buser(
        data['uuid'],
        data['name'],
        data['email'],
        data['regdate'] ,
        data['password'],
        data['fav']
    );

  }
}
class Advs{
   String id="";
   int views=0;
   String location="";
   String regdate="";
   double rank=0;
   String title="";
   var desc ;
   String contact="";
     // ignore: deprecated_member_use
     List<Uint8List> images=  List<Uint8List>();

   String status="";
   List<List<ChatsC>> chat = [];
   var price;
   String duration_total="";
   String purchase_date="";
   int time_left=0;
   String rank_paid="";
   String  owner="";
   String Mcat="";
   String Scat="";
   String ownername="";
   String type="";

   Advs( String type,String ownername,String Mcat,String Scat,String owner,String rank_paid, int time_left, String purchase_date, String duration_total,var price,List<List<ChatsC>> chat, String status, List<Uint8List> images, String contact, var desc, String title, double rank, String regdate, String id ,int views,String location      ) {
     this.id=id;
     this.regdate=regdate;
     this.rank=rank;
     this.type=type;
     this.title=title;
     this.desc=desc;
     this.contact=contact;
     this.images=images;
     this.status=status;
     this.chat=chat;
     this.price=price;
     this.duration_total=duration_total;
     this.purchase_date=purchase_date;
     this.time_left=time_left;
     this.rank_paid=rank_paid;
     this.owner = owner;
     this.Mcat=Mcat;
     this.Scat=Scat;
     this.location = location;
     this.ownername=ownername;
     this.views=views;
   }
   factory Advs.fromMap(Map<String, dynamic> data,) {
     return Advs(
          data['type'],
          data['ownername'],
          data['Mcat'],
          data['Scat'],
          data['owner'],
          data['rank_paid'],
          data['time_lefttime_left'],
          data['purchase_date'],
          data['duration_total'],
          data['price'],
          [],
          data['status'],
         List<Uint8List>(),
          data['contact'],
          data['desc'],
          data['title'],
         double.parse(data['rank']),
          data['regdate'],
          data['adid'],
          data['views'],
          data['location']
     );

   }
}
 class ChatsC {


   String sender="";
   String receiver="";
   String date_send="";
   String text="";
   String seen="";
   String received="";
   String id="";
   String addid="";
   String ownername="";
   String tag="";
   double index=0;


    ChatsC (double index,String sender, String receiver, String date_send, String text, String seen,String received, String id,String addid,String ownername, String tag) {
    this.sender=sender;
    this.receiver=receiver;
    this.date_send=date_send;
    this.text=text;
    this.seen=seen;
    this.id=id;
    this.received=received;
    this.ownername=ownername;
    this.tag=tag;
    this.index = index;
    this.addid=addid;

  }
}

