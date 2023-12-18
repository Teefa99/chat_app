import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubbleSender extends StatelessWidget {
  const ChatBubbleSender({
    super.key,
    required this.messageDetailsFriend,
  });
  final MessageModel messageDetailsFriend;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          messageDetailsFriend.message,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
