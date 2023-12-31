import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screlmt/screen/detailspage.dart';

import '../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List name=['Leanne Graham','Ervin Howell','Clementine Bauch','Patricia Lebsack','Chelsey Dietrich','Mrs. Dennis Schulist','Kurtis Weissnat','Nicholas Runolfsdottir V','Glenna Reichert','Clementina DuBuque'];
  List phone=['1-770-736-8031 x56442','010-692-6593 x09125','1-463-123-4447','493-170-9623 x156','(254)954-1289','1-477-935-8478 x6430','210.067.6132','586.493.6943 x140','(775)976-6794 x41206','024-648-3804'];
  List email=['Sincere@april.biz','Shanna@melissa.tv','Nathan@yesenia.net','Julianne.OConner@kory.org','Lucio_Hettinger@annie.ca','Karley_Dach@jasper.info','Telly.Hoeger@billy.biz','Sherwood@rosamond.me','Chaim_McDermott@dana.io','Rey.Padberg@karina.biz'];

  TextEditingController searchController = TextEditingController();
  List<String> filteredNames = [];

  void onSearch() {
    String searchTerm = searchController.text;
    print("Search term: $searchTerm");


    setState(() {
      filteredNames = name.where((n) => n.toLowerCase().contains(searchTerm.toLowerCase())).toList() as List<String>;

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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
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
        itemCount: filteredNames.isEmpty ? name.length : filteredNames.length,

    itemBuilder: (context, index) {
    final displayedName = filteredNames.isEmpty ? name[index] : filteredNames[index];
    return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * .113,
    decoration: BoxDecoration(
    color: Colors.grey.shade50,
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
    Text('Name : ', style: TextStyle(fontSize: 16)),
    Text(displayedName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
    onPressed: () {
      if (index >= 0 && index < email.length && index < phone.length) {
        object.Users(displayedName, email[index], phone[index]);
      }

    },
    child: Text('Details', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
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
