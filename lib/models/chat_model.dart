import 'package:flutter/material.dart';

@immutable
class ChatModel {
  final String id;
  final String message;
  final bool isMe;

  const ChatModel({
    required this.id,
    required this.message,
    required this.isMe,
  });

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'message': message,
  //     'isMe': isMe,
  //   };
  // }
}

