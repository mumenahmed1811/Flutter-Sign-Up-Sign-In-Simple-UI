import 'package:flutter/material.dart';
import 'package:trying/History/history_item.dart';
import 'package:trying/History/history_item_list_generator.dart';


class HistoryBody extends StatefulWidget {
  @override
  _HistoryBodyState createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {

  @override
  Widget build(BuildContext context) {
    return HistoryItemListGenerator();
  }
}
