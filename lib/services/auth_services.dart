import 'package:api_animals/models/user_model.dart';
import 'package:api_animals/services/client.dart';
import 'package:dio/dio.dart';

class AuthService{

Future signUp({required User user})async{


 // late String token token late (intialization)
  
  String token = "";

try{

final Response response = await ApiClient.dio.post("/siging");
response.data("token");



}catch(e){

throw e.toString();



}

}





}
