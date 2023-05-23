import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
//import 'package:chat_gpt_sdk/src/model/chat_complete/request/chat_complete_text.dart';
import 'package:chat_gpt_sdk/src/model/chat_complete/request/chat_complete_text.dart';
import 'package:chat_gpt_sdk/src/model/chat_complete/response/message.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';

class AIHandler {

  final _openAI = OpenAI.instance.build(
    token: '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',
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),
  );

  Future<String> getResponse(String message) async {
    try {


      final request = ChatCompleteText(messages: [
        Map.of({"role": "user", "content": message})
      ], maxToken: 200, model: ChatModel.gptTurbo0301);

    // ], maxToken: 200, model: ChatModel.gpt_4);
      // final request = ChatCompleteText(messages: [
      //   Map.of({"role": "user", "content": message})
      // ], maxToken: 200, model: kChatGptTurbo0301Model);

      // maxToken: 200, model: kChatGptTurbo0301Model);


      // final response = await _openAI.onChatCompletion(request: request);
      // for (var element in response!.choices) {
      //   print("data -> ${element.message?.content}");
      // }


      final response = await _openAI.onChatCompletion(request: request);
      if (response != null ) {
        return response.choices[0]?.message?.content?.trim() ?? 'Something went wrong';
        // return response.choices[0].message.content.trim() ?? ;
      }

      return 'Some thing went wrong';
    } catch (e) {
      return 'Bad response';
    }
  }

  // void dispose() {
  //   var close = _openAI.close();
  // }

  // void close() {
  //   // TODO: implement close
  // }

}
