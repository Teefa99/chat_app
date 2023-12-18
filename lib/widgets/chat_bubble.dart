import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubbleReceiver extends StatelessWidget {
  const ChatBubbleReceiver({
    super.key,
    required this.messageDetails,
  });
  final MessageModel messageDetails;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          messageDetails.message,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
