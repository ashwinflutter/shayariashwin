import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'fourthpage.dart';

class thirdpage extends StatefulWidget {
  List ll;
  int index;

  thirdpage(this.ll, this.index);

  @override
  _thirdpageState createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text("पढ़ना"),
      ),
      backgroundColor: Colors.blue.shade100,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  print(value);
                  setState(() {
                    widget.index = value;
                  });
                },
                itemCount: widget.ll.length,
                itemBuilder: (context, index) {
                  return Container(margin: EdgeInsets.fromLTRB(30, 200, 30, 50),
                    width: 200,
                    
                    // alignment: Alignment.center,
                    child: Text(
                      "${widget.ll[widget.index]}",
                      style: TextStyle(fontSize: 26),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {
                  FlutterClipboard.copy("${widget.ll[widget.index]}")
                      .then((value) {
                    Fluttertoast.showToast(
                        msg: "copied",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM_LEFT,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.brown,
                        fontSize: 17.0);
                  });
                },
                icon: Icon(Icons.copy,size: 35,)),
            IconButton(
                onPressed: () {
               setState(() {
                 if(widget.index>0){
                   widget.index--;
                 }
                 else{
                     Fluttertoast.showToast(
                         msg: "front",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM_LEFT,
                         timeInSecForIosWeb: 1,
                         backgroundColor: Colors.brown,
                         fontSize: 17.0);
                 }
               });
                  },
                icon: Icon(Icons.arrow_back,size: 38,)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return fourthpage(widget.ll, widget.index);
                  },));
                },
                icon: Icon (Icons.edit,size: 35,)),
            IconButton(
                onPressed: () {
                  setState(() {
                    if(widget.index<widget.ll.length-1){
                      widget.index++;
                    }
                    else{
                      Fluttertoast.showToast(
                          msg: "end",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM_LEFT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.brown,
                          fontSize: 17.0);
                    }
                  });

            }, icon: Icon(Icons.arrow_forward,size: 38,)),
            IconButton(
                onPressed: () {
                  Share.share("${widget.ll[widget.index]}");
                },
                icon: Icon(Icons.share,size: 35,)),
          ])
        ],
      ),
    );
  }
}
