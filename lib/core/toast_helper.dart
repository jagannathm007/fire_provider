import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper{

  static success(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }

  static warning(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.black,
        fontSize: 14.0
    );
  }

  static error(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }

}