import 'package:apicrud/models/UserModel.dart';
import 'package:apicrud/repo/user_repo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 
UserRepo userRepo=UserRepo();
    List<UserModel> list=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
        FloatingActionButton(onPressed: ()async{
        List<UserModel> lists = await UserRepo().getuser();
         setState(() {
                 list=lists;
          print("data :${list.first.first_name}");
         });
//         return UserRepo().getuser().then((List<UserModel>lists){
// setState(() {
//   list=lists;
//   print("data :${list.first.first_name}");
// });
//           }
       
//          );
          },
        child: Icon(Icons.add),
        ),
      
        SizedBox(height: 10,),
      Expanded(
        child: ListView.builder(
                        shrinkWrap: true,
      
          itemCount: list.length,
        
          itemBuilder: ((context, index) {
        
          return ListTile(
        title: Text(list[index].first_name),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(list[index].avatar),
          
        ),
         
          );
        
        })),
      )
      
        ],
        
      )
    );
  }
}
