import 'package:chat/constants/constant.dart';
import 'package:chat/services/asssest_manager.dart';
import 'package:chat/widget/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class chatscreen extends StatefulWidget {
  const chatscreen({super.key});

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  bool istyping=true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    textEditingController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       elevation: 2,
        leading:Padding(
          
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssestManager.openaiLogo),
        ) ,
        title: Text("ChatGPT"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded,color: Colors.white,))
        ],
      ),
      body:SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context,index){
                  return chatwidget(
                    msg: chatMessages[index]["msg"].toString(),
                    chatIndex: int.parse(chatMessages[index]["chatIndex"].toString()),
                  );
            
              }),
            ),
            if(istyping)...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                ),
            SizedBox(height: 18,),
            Material(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      controller: textEditingController,
                      style:TextStyle(color: Colors.grey) ,
                      onSubmitted: (value) {
                          
                      } ,
                      decoration: InputDecoration.collapsed(hintText: "How can I help you?",hintStyle: TextStyle(color: Colors.grey)),
                    )),
                    IconButton(onPressed: (){}, icon: Icon(Icons.send,color: Colors.white,))
                  ],
                ),
              ),
            )
            ]
          ],
        ),
      ),
    );
  }
}