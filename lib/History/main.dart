import 'package:flutter/material.dart';
import 'package:trying/History/body.dart';
import 'package:trying/History/history_item_list_generator.dart';

class HistoryMain extends StatefulWidget {
  @override
  _HistoryMainState createState() => _HistoryMainState();
}

class _HistoryMainState extends State<HistoryMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,

        title: Text("History", style: TextStyle(color: Colors.black),),
      ),
      body: HistoryItemListGenerator(),
      backgroundColor: Colors.white,
    );
  }
}
