import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_for_friend.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'Chat Page';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessages);
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(
              MessageModel.fromjson(snapshot.data!.docs[i]),
            );
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 60,
                  ),
                  Text('Chat'),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) =>
                        messageList[index].id == email
                            ? ChatBubbleSender(
                                messageDetailsFriend: messageList[index])
                            : ChatBubbleReceiver(
                                messageDetails: messageList[index]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Send message',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        color: kPrimaryColor,
                        onPressed: () => sendMessage(email),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  void sendMessage(String email) {
    String message = controller.text.trim();
    if (message.isNotEmpty) {
      messages.add({
        kMessages: message,
        kCreatedAt: DateTime.now(),
        kId: email,
      });
      controller.clear();
      scrollController.animateTo(
        0,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
      );
    }
  }
}
