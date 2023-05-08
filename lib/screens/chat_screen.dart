import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_aibad/providers/chats_provider.dart';
import 'package:mobile_aibad/widgets/chat_item.dart';

import '../widgets/my_app_bar.dart';
import '../widgets/text_and_voice_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final chats = ref.watch(chatsProvider);
                return ListView.builder(
                  // reverse: true,
                  itemCount: chats.length + 3,
                  itemBuilder:(context, index) {
                    if (index == 0) {
                      // Tampilkan pesan sapaan jika index == 0
                      return ChatItem(
                        text: "Hi, selamat datang di AIBAD!",
                        isMe: false,
                      );
                    }if (index == 1) {
                      // Tampilkan pesan sapaan jika index == 0
                      return ChatItem(
                        text: "Saya akan membantu kamu mencari Quote tentang agile'",
                        isMe: false,
                      );
                    }if (index == 2) {
                      // Tampilkan pesan sapaan jika index == 0
                      return ChatItem(
                        text: "Quote Agile seperti apa yang anda cari?",
                        isMe: false,
                      );
                    } else {
                      // Tampilkan pesan chat sebelumnya
                      return ChatItem(
                        text: chats[index - 3].message,
                        isMe: chats[index - 3].isMe,
                      );
                    }
                  }
                  // => ChatItem(
                  //   text: chats[index].message,
                  //   isMe: chats[index].isMe,
                  // ),
                );
              }),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextAndVoiceField(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )
    );
  }
}