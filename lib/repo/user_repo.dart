import 'dart:convert';
import 'dart:async';

import 'package:apicrud/models/UserModel.dart';
import 'package:http/http.dart' as http;

class UserRepo{
Future<List<UserModel>>getuser()async{
 List<UserModel>mylist=[];
    try {
      final response=await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
var myData=await jsonDecode(response.body.toString());
      if(response.statusCode==200){
    for(var i in myData['data']){
      // mylist.add(UserModel.fromJson(i));
      UserModel model= UserModel.fromjson(i);
      mylist.add(model);
    }
return mylist;
      }
      else{
return mylist;
      }

    } catch (e) {
            print("Exception $e");

        throw e;
    }


}

  
}