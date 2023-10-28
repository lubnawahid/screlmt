import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List name=['Leanne Graham','Ervin Howell','Clementine Bauch','Patricia Lebsack','Chelsey Dietrich','Mrs. Dennis Schulist','Kurtis Weissnat','Nicholas Runolfsdottir V','Glenna Reichert','Clementina DuBuque'];
  TextEditingController searchController = TextEditingController();
  List<String> filteredNames = [];

  void onSearch() {
    String searchTerm = searchController.text;
    print("Search term: $searchTerm");

    // Filter names based on the search term
    setState(() {
    //  filteredNames = name.where((n) => n.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final object= Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
        centerTitle: true,
        actions: [Padding(padding: EdgeInsets.only(right: 12),
          child: IconButton(icon: Icon(Icons.person,size: 30,),
            onPressed: (){
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultCart()));
            },
          ),
        )
        ],
      ),
      body: Column(
          children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
      Expanded(
      child: TextField(
      controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
        ),
      ),
    ),

        ],
      ),
    ),
      Expanded(child:ListView.builder(
          shrinkWrap: true,
          itemCount: filteredNames.isEmpty ? name.length : filteredNames.length, // Use the length of the name list
          itemBuilder: (context, index) {
    final displayedName = filteredNames.isEmpty ? name[index] : filteredNames[index];
    return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * .113,
    decoration: BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Text('Name : ',style: TextStyle(fontSize: 16),),
    Text(name[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
    ],
    ),


    ],
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ElevatedButton(
    onPressed: (){
    object.Users(name[index]);
    },
    child: Text('Details',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blueGrey.shade900,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    fixedSize: Size(80, 27),
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    );
          },
      ),
      ),
          ],
      ),
    );
  }
}
