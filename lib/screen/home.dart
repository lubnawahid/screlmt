import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child:Padding(
        padding:const EdgeInsets.all(20),
    child:
    SingleChildScrollView(
    physics: ScrollPhysics(),
    child: Column(
    children: [
    Container(
    alignment: Alignment.center,
    height: 60,
    width: MediaQuery.of(context).size.width,
    decoration:BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    color: Colors.grey[300],
    ),

    child: TextField(
    controller: searchController,
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.search),
    hintText: "Search",
    border: InputBorder.none
    ),
    ),
    ),
    ],
    ),
        ),
    ),
        ),
    );
  }
}
