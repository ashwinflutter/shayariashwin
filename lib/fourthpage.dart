
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class fourthpage extends StatefulWidget {
  List ll;
  int index;

  fourthpage(this.ll, this.index);

  @override
  _fourthpageState createState() => _fourthpageState();
}

class _fourthpageState extends State<fourthpage> {
  Color currentcolor = Colors.green;
  Color mytextcolor = Colors.red;
  String currentemoji = "😃 😄 😁 😆 😅 ";
  double currrentfontsize = 26;
  String cfamily = "f1";

GlobalKey globalKey=GlobalKey();

  List<List<Color>> gradientcolor = [
    [Colors.pink, Colors.yellow, Colors.green],
    [Colors.black26, Colors.lightGreenAccent, Colors.greenAccent],
    [Colors.blueAccent, Colors.yellow, Colors.deepOrangeAccent]
  ];

  List mycolor = [
    Colors.lightGreenAccent,
    Colors.lightGreen,
    Colors.black26,
    Colors.pink,
    Colors.brown,
    Colors.red,
    Colors.deepPurple,
    Colors.blueGrey,
    Colors.deepOrangeAccent,
    Colors.amberAccent,
    Colors.green,
    Colors.yellow
  ];


  List<Color> currentgradient = [Colors.pink, Colors.yellow, Colors.green];

  List<String> emojilist = [
    "😃 😄 😁 😆 😅 ",
    "😂 🤣 🥲 ☺",
    "🧐 🤓 😎 🥸",
    "🥱 😴 🤤 😪 ",
    "😈 👿 👹 👺",
    "🤛 🤜 🖕 👊 ",
    "😱 😨 😰 😥",
    "🚣🏻 🚣🏻‍♂️ 🏊🏻‍♀️ 🏊🏻"
  ];
  List<String> myfamily = [
    "roboto",
    "roboto1",
    "roboto2",
    "roboto3",
    "roboto4",
    "roboto5"
  ];

  String folderpath="";

  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    creatFolder();

  }
  creatFolder()async{
    final folderName="Shayari2022";
    String nn=(await getApplicationDocumentsDirectory()).path;

    final path1=Directory("${nn}$folderName");
   print("path111=====$path1");
    if((await path1.exists())){
      //TODO;
      print("exist");
    }else{
      print("not exist");
      path1.create();
    }
    folderpath=path1.path;
    setState(() {});
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Edit"),
      ),
      backgroundColor: Colors.lightGreenAccent.shade100,
      body: Column(
        children: [
          Expanded(
            child: RepaintBoundary(
              key: globalKey,
              child: Container(
                //   color: Colors.cyan.shade100,
                child: PageView.builder(
                  //   controller: pageController,
                  onPageChanged: (value) {
                    print(value);
                    setState(() {
                      widget.index = value;
                    });
                  },
                  itemCount: widget.ll.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 400,
                      //
                      //     gradient: LinearGradient(colors: currentgradient)),                   grediant color or backgrd color bev mathi 1 krv mate
                      color: currentcolor,
                      alignment: Alignment.center,
                      child: Text(
                        "${currentemoji}\n${widget.ll[widget.index]}\n${currentemoji}",
                        style: TextStyle(
                            fontFamily: cfamily,
                            fontStyle: FontStyle.italic,
                            fontSize: currrentfontsize,
                            color: mytextcolor),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 150,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: gradientcolor.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    currentgradient = gradientcolor[index];
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: currentgradient)),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.refresh)),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      " Back Color",
                      style: TextStyle(fontSize: (15)),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 150,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mycolor.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentcolor = mycolor[index];
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    color: mycolor[index],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    color: Colors.blueGrey,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "Text Colors",
                      style: TextStyle(fontSize: (15)),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 150,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mycolor.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      mytextcolor = mycolor[index];
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    color: mycolor[index],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    color: Colors.blueGrey,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "Share",
                      style: TextStyle(fontSize: (17)),
                    ),
                    onPressed: () {
                      _capturePng().then((value) async{
                        print(value);
                        String imagename="Ashwinbahi${Random().nextInt(10000)}.jpg";
                        String imagepath="$folderpath/$imagename";
                        print(imagepath);
                        print(imagename);
                        setState(() {});
                        File file=File(imagepath);
                        file.writeAsBytes(value);
                        await file.create();
                        Share.shareFiles(["${file.path}"]);
                        setState(() {
                        });
                      });
                      },
                    color: Colors.blueGrey,
                    textColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      " Font",
                      style: TextStyle(fontSize: (17)),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: ListView.builder(
                              itemCount: myfamily.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        cfamily = myfamily[index];
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Center(
                                          child: Text(
                                        "shayri",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: myfamily[index]),
                                      )),
                                    ));
                              },
                            ),
                          );
                        },
                      );
                    },
                    color: Colors.blueGrey,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Container (
                margin: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "Emoji",
                      style: TextStyle(fontSize: (17)),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: ListView.builder(
                              itemCount: emojilist.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        currentemoji = emojilist[index];
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Center(
                                          child: Text("${emojilist[index]}")),
                                    ));
                              },
                            ),
                          );
                        },
                      );
                    },
                    color: Colors.blueGrey,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 80,
                  height: 40,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "Size",
                      style: TextStyle(fontSize: (17)),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState1) {
                              return Container(
                                height: 150,
                                child: Slider(
                                  label:
                                      "Font Size ${currrentfontsize.round().toString()}",
                                  min: 10,
                                  max: 50,
                                  divisions: 50,
                                  value: currrentfontsize,
                                  onChanged: (value) {
                                    currrentfontsize = value;
                                    setState(() {});
                                    setState1(() {});
                                  },
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    color: Colors.blueGrey,
                    textColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
