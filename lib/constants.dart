import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(
      color: Colors.black,
    ),
  ),
  hintText: 'Enter Text',
  hintStyle: TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w400,
  ),
  // contentPadding: EdgeInsets.only(left: 20.0),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.deepPurple,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.deepPurple, width: 2.0),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);
