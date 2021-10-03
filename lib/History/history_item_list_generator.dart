import 'package:flutter/material.dart';
import 'package:trying/History/history_item.dart';
import 'HistoryModel.dart';
class HistoryItemListGenerator extends StatelessWidget {

  final my_list = [
    HistoryItemModel(
      "https://i.ibb.co/rpffjLy/image-29.jpg",
      "Yes",
      "Yes",
      "Yes",
      "There is Tumor",
      "Glioma",
      "Glioma",
      "Glioma",
      "Type is Glioma",
    ),
    HistoryItemModel(
      "https://i.ibb.co/0Xc9dw6/image-50.jpg",
      "No",
      "No",
      "No",
      "There is no Tumor",
      "--",
      "--",
      "--",
      "--",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: my_list.length,
          itemBuilder: (context, index) {
        return HistoryItem(
            my_list[index]
        );
      }
      ),
    );
  }
}
