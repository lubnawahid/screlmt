

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  List name=['Leanne Graham','Ervin Howell','Clementine Bauch','Patricia Lebsack','Chelsey Dietrich','Mrs. Dennis Schulist','Kurtis Weissnat','Nicholas Runolfsdottir V','Glenna Reichert','Clementina DuBuque'];
  List phone=['1-770-736-8031 x56442','010-692-6593 x09125','1-463-123-4447','493-170-9623 x156','(254)954-1289','1-477-935-8478 x6430','210.067.6132','586.493.6943 x140','(775)976-6794 x41206','024-648-3804'];
  List email=['Sincere@april.biz','Shanna@melissa.tv','Nathan@yesenia.net','Julianne.OConner@kory.org','Lucio_Hettinger@annie.ca','Karley_Dach@jasper.info','Telly.Hoeger@billy.biz','Sherwood@rosamond.me','Chaim_McDermott@dana.io','Rey.Padberg@karina.biz'];


  @override
  Widget build(BuildContext context) {

    final object= Provider.of<UserProvider>(context);
    List nameStore=object.detail_name;
    List emailStore=object.detail_email;
    List phoneStore=object.detail_phone;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: nameStore.length,
          itemBuilder: (context,index){
    if (index < nameStore.length) {
            return Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.113,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),

                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Name : ',style: TextStyle(fontSize: 16),),
                            Text(nameStore[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('email: ',style: TextStyle(fontSize: 16),),
                            Text(emailStore[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('Phone :',style: TextStyle(fontSize: 16),),
                            Text(phoneStore[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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
                              object.Users( nameStore[index], emailStore[index], phoneStore[index]);
                            },
                           child: Text('',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.blueGrey.shade900,
                          //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          //     fixedSize: Size(101, 27),
                          //   ),
                          // ),
                         ),

                        )

                      ],
                    )
                  ],
                ),
              ),
            );
          }
    else{
    return SizedBox.shrink();
    }
    )
    );
    }
  }
