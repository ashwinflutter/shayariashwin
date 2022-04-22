import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayariashwin/secondpage.dart';

void main() {
  runApp(MaterialApp(home: firstpage(),
  ));
}

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {



  List ll = [
    "शुभकामनाएं शायरी 🎂🎀🎁",
    "दोस्ती शायरी 🙆 🙆‍♂️ 🙋‍♀",
    "लव शायरी 👅 👄 💋",
    "सैड शायरी 😱 😨 😰 ",
    "ज़िन्दगी शायरी 🫂👨‍👩‍👧‍👦👩‍❤️‍👩",
    "शराब शायरी 🍺 🍻 🥂",
    "बेवफा शायरी 🧚‍♀️ 🧚 🧚‍♂️ 👼 ",
    "बर्थडे शायरी 🎂🎀🎁",
    "राजनीति शायरी 🤵‍♀  🤵 🤵‍♂️ 👸",
    "होली शायरी 🦪 🍤 🍙 🍚"
  ];

  @override

void initState() {
    // TODO: implement initState
    super.initState();

forpermission();
  }
  Future<void> forpermission()async{
    var status=await Permission.storage.status;
    if(status.isDenied){
      await[Permission.storage,
      ].request();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,foregroundColor: Colors.red,
        backgroundColor: Colors.green,
        title: Text("शायरी ऐप्लिकेइशन्"),
      ),
      backgroundColor: Colors.green.shade200,
      body: ListView.builder(
        itemCount: ll.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return secondpage(ll, index);
                },
              ));
            },
            title: Text("${ll[index]}"),
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


}
