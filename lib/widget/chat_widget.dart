import 'package:chat/constants/constant.dart';
import 'package:chat/services/asssest_manager.dart';
import 'package:chat/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class chatwidget extends StatelessWidget {
  const chatwidget
({super.key, required this.msg, required this.chatIndex});
final String msg;
final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
     
      children: [
        Material(
          color: chatIndex==0 ? scaffoldBackgroundColor:cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Image.asset(chatIndex==0 ? AssestManager.userImage:AssestManager.botImage, height: 30,width: 30,),
              const SizedBox(width: 8,),
              Expanded(child: TextWidget(label: msg))
              ],
            ),
          ),
        )
      ],
    );
  }
}