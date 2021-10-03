import 'package:flutter/material.dart';
import 'package:trying/History/HistoryModel.dart';

class HistoryItem extends StatelessWidget {
  HistoryItemModel item;

  HistoryItem( this.item);

  @override
  Widget build(BuildContext context) {
    return CustomItem(item);
  }
}

class CustomItem extends StatelessWidget {
  HistoryItemModel item;
  CustomItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Row(
        children: [
          Expanded(
              flex : 2,
              child: Image.network(
                item.image,
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.15,
              )
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Does the patient have tumor?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                RichText(
                    text : TextSpan( text :  "CNN : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan( text: item.CNN1.toString(),
                            style: TextStyle(color: getResultColor(item.CNN1.toString()), fontWeight: FontWeight.normal))
                      ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "SVM : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.SVM1.toString(),
                              style: TextStyle(color: getResultColor(item.SVM1.toString()),fontWeight: FontWeight.normal))
                        ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "KNN : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.KNN1.toString(),
                              style: TextStyle(color: getResultColor(item.KNN1.toString()), fontWeight: FontWeight.normal))
                        ]
                    )
                ),
                Text("Type of the tumor:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17) ),
                RichText(
                    text : TextSpan( text :  "CNN : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.CNN2.toString(), style: TextStyle(fontWeight: FontWeight.normal))
                        ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "SVM : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.SVM2.toString(), style: TextStyle(fontWeight: FontWeight.normal) )
                        ]
                    )
                ),
                RichText(
                    text : TextSpan( text :  "KNN : ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan( text: item.KNN2.toString(), style: TextStyle(fontWeight: FontWeight.normal))
                        ]
                    )
                ),
              ],
            )
          )
        ],
      ),
    );
  }

  getResultColor(String string) {
    if(string == "Yes")
      return Color.fromRGBO(255, 0, 0, 1);
    else if(string == "No")
      return Color.fromRGBO(50,205,50, 1);
    else
      return Color.fromRGBO(0, 0, 0, 1);
  }


}

