import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String description;
  final String date;

  const DetailPage(this.name, this.description, this.date);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail page"),
      ),
      body: Container(
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(widget.name, style: TextStyle(fontSize: 32, color: Colors.green),),
                SizedBox(height: 8,),
                Text(widget.description, style: TextStyle(fontSize: 16,color: Colors.grey[450])),
                SizedBox(height: 8,),
                Text(widget.date)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
