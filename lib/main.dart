import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel times',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Travel moments'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime currentDate = DateTime.now();
  DateTime CurrentDate = DateTime.now();

  var image;
  List imageArray=[];
  Future getImage() async {
    // ignore: deprecated_member_use
    image = await ImagePicker.pickImage(
        source: ImageSource.gallery);
       return image;


   // setState(() {
    // image=imageArray;
    //});
  }

  Future<void> _startDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    return currentDate;
  }
  Future<void> _endDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: CurrentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != CurrentDate)
      setState(() {
        CurrentDate = pickedDate;
      });
    return CurrentDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Column(
        children:<Widget>[
           // Text(currentDate.toString()),
           // Text(CurrentDate.toString()),
          Align(
            alignment: Alignment.topCenter,
            // ignore: deprecated_member_use
           child: RaisedButton(
              onPressed: () => _startDate(context) ,
              child: Text('Start date'),
            ),
          ),
           Text(currentDate.toString()),
            Align(
              alignment: Alignment.topCenter,
            // ignore: deprecated_member_use
           child: RaisedButton(
              onPressed: () => _endDate(context),
              child: Text('end date'),
            ),
            ),
            // Text(currentDate.toString()),
            Text(CurrentDate.toString()),
          Align(
            alignment: Alignment.topCenter,
          // ignore: deprecated_member_use
            child:RaisedButton(
              onPressed:()=>getImage(),
             child: Icon(Icons.image),
      ),
          ),
          Container(
            height:MediaQuery.of(context).size.height*.5,
            decoration:BoxDecoration(border: Border.all(width:2)),
            child:imageArray.isEmpty
            ?Center(child:Text("No Image"))
            :GridView.count(
              crossAxisCount: 3,
            children:List.generate(imageArray.length,(index){
            var image =imageArray[index];
            return Container(child:Image.file(image));
    }),
            ),),
    ],
    ),
    );
  }
}

