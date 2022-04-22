import 'package:flutter/material.dart';
import 'package:shayariashwin/model.dart';
import 'package:shayariashwin/thirdpage.dart';

class secondpage extends StatefulWidget {
 List ll;
 int index;
 secondpage(this.ll,this.index);


  @override
  _secondpageState createState() => _secondpageState();
}
List l=[];

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown,
        title: Text("${widget.ll[widget.index]}"),
      ),backgroundColor: Colors.brown.shade200,
       body: ListView.builder(
         itemCount: l.length,
         itemBuilder: (context, index) {
           return ListTile(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(
                 builder: (context) {
                   return thirdpage(l, index);
                   },
               ));
             },
             title: Text("${l[index]}",maxLines: 1,),
             subtitle: Text(
               "दिलचस्पी",
               style: TextStyle(fontSize: 15),
             ),leading: Image.asset("image/ram${index+1}.png"),
             trailing: Icon(Icons.waves),
           );
         },
       ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if(widget.index==0){
      l=model.shubh;
      }
      if(widget.index==1){
        l=model.friend;
      }
      if(widget.index==2){
        l=model.love;
      }
      if(widget.index==3){
        l=model.sad;
      }
      if(widget.index==4){
        l=model.life;
      }
      if(widget.index==5){
        l=model.beer;
      }
      if(widget.index==6){
        l=model.wafa;
      }
      if(widget.index==7){
        l=model.brd;
      }
      if(widget.index==8){
        l=model.rajniti;
      }
      if(widget.index==9){
        l=model.holi;
      }
    });
  }
}
