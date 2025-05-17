import "package:crud_sq/Data/Database/DataBase.dart";
import "package:crud_sq/ViewScreen.dart";
import "package:flutter/material.dart";

class Homescrren extends StatefulWidget {
  const Homescrren({super.key});

  @override
  State<Homescrren> createState() => _HomescrrenState();
}

class _HomescrrenState extends State<Homescrren> {

  List<Map<String,dynamic>> allNotes=[];
  DBHelper? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef=DBHelper.getInstance;
    getNotes();
  }

  void getNotes ()async{
    allNotes=await dbRef!.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Home",
              style: TextStyle(fontSize: 20, color: Colors.black38),
            ),
            SizedBox(width: 4), // small space between the texts
            Text(
              "Screen",
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
          ],
        ),
      ),
      body: allNotes.isNotEmpty? ListView.builder(
        itemCount: allNotes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(allNotes[index]['title']),
            subtitle: Text(allNotes[index]['desc']),
            trailing: Text(allNotes[index]['name']),
          );
        },
      ):Center(
        child:CircularProgressIndicator(),
      ),


      floatingActionButton:FloatingActionButton(
        onPressed: ()async{
          setState(() { });
Navigator.push(context,MaterialPageRoute(builder: (context)=>Viewscreen()));
        },
        backgroundColor: Colors.orange,
        child:Icon(Icons.add,color:Colors.white ),
      ),
    );
  }
}
