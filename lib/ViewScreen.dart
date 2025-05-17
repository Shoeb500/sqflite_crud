import 'package:crud_sq/Data/Database/DataBase.dart';
import 'package:crud_sq/HomeScrren.dart';
import 'package:flutter/material.dart';

class Viewscreen extends StatefulWidget {
  const Viewscreen({super.key});

  @override
  State<Viewscreen> createState() => _ViewscreenState();
}

class _ViewscreenState extends State<Viewscreen> {

  DBHelper? dbRef;
@override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
  }

  final TextEditingController _name=TextEditingController();
  final TextEditingController _Desc=TextEditingController();
  final TextEditingController _title=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Add",
              style: TextStyle(fontSize: 20, color: Colors.black38),
            ),
            SizedBox(width: 4), // small space between the texts
            Text(
              "User",
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
          ],
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height:12,),
            _buildNameField(),
            SizedBox(height:12,),
            _buildtitleField(),
            SizedBox(height:12,),
            _buildDescField(),
            SizedBox(height:12,),
            _buildButtonField()
          ],
        ),
      ),
    );
  }
  Widget _buildNameField() {
    return TextField(
      controller:_name,
      keyboardType: TextInputType.emailAddress,
      decoration:InputDecoration(
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(15),
              borderSide:BorderSide(color:Colors.black)
        ),
        hintText: "Name",
      ),
    );
  }
  Widget _buildtitleField() {
    return TextField(
      controller:_title,
      keyboardType: TextInputType.emailAddress,
      decoration:InputDecoration(
        border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(15),
            borderSide:BorderSide(color:Colors.black)
        ),
        hintText: "title",
      )
    );
  }
  Widget _buildDescField() {
    return TextField(
      controller:_Desc,
      keyboardType: TextInputType.emailAddress,
      decoration:InputDecoration(
        border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(15),
            borderSide:BorderSide(color:Colors.black,)
        ),
        hintText: "Describtions",
      )
    );
  }

  Widget _buildButtonField(){
    return ElevatedButton(
      onPressed:()async{
        await dbRef!.addNotes(
            mtitile:_title.text,
            name: _name.text,
            mDesc: _Desc.text
        );
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Homescrren()));
      },
      child:Text("Add This "),
    );
  }
}
