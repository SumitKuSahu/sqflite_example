import 'package:flutter/material.dart';
import 'package:sqflite_example/DataBase_helper.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite example'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(onPressed: () async{
              int i=await DatabaseHelper.instance.insert({
                DatabaseHelper.columnName:'sumit'
              });

              print("the inserted id is $i");

            },child: Text('insert'),color: Colors.grey,),
            MaterialButton(onPressed: () async{
              List<Map<String,dynamic>> queryRows=await DatabaseHelper.instance.queryAll();
              print(queryRows);

            },child: Text('query'),color: Colors.green,),
            MaterialButton(onPressed: () async{
              int updateId=await DatabaseHelper.instance.insert({
                DatabaseHelper.columnId:12,
                DatabaseHelper.columnName:'Mark'
              });
              print(updateId);

              
            },child: Text('update'),color: Colors.blue,),
            MaterialButton(onPressed: () async{
              int roweffected=await DatabaseHelper.instance.delete(13);
              print(roweffected);
            },child: Text('delete'),color: Colors.red,),
          ],
        ),
      ),
    );
  }
}
