import 'package:flutter/material.dart';
import 'add.dart';
import 'detail.dart';
import 'package:todo_app/model/todo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> items   = [];
  @override
  void initState() {
    items = List.generate(10, (i)  {
      return Todo("Item $i", "This is description for item $i", "16/2/2020");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("To do app"),),
      body: _generateListView(),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final Todo result = await Navigator.push(
            context, MaterialPageRoute(builder: (builder) => AddPage()));
        setState(() {
          items.add(result);
        });
      }, child: Icon(Icons.add),
        backgroundColor: Colors.red,

      ),


    );
  }

  _generateListView() {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          title: Text(items[index].name),
          trailing: Icon(Icons.arrow_forward_ios),
          subtitle: Text("Due at: ${items[index].itemDate}"),
          onTap: ()  {

             Navigator.push(context,
            MaterialPageRoute(builder: (builder)=> DetailPage(items[index].name,
                items[index].itemDesc,items[index].itemDate)));
          },
          onLongPress:() {
            _showAlertToDelete(index);
          },
        ),
      );
    },
        itemCount: items.length,
      padding: EdgeInsets.all(8.0),
    );
  }

  _showAlertToDelete(int index) {

    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title:Text("Are you sure you want to remove the item?"),
            actions: <Widget>[
              FlatButton(
                child:Text("Cancel"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child:Text("Ok!"),
                onPressed: (){
                  // Code to delete!
                 setState(() {
                   items.removeAt(index);
                 });
                  Navigator.pop(context);
                },
              )
        ],
      );
    });
  }
}
