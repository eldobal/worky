import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:worky/Class%20and%20Constant/TrabajadorClass.dart';
import 'package:worky/Class%20and%20Constant/TrabajadorClass.dart' as doc;
import 'package:worky/Class%20and%20Constant/constantsApi.dart';
import 'package:worky/Logic/Controller.dart';

class HttpService extends GetxController{
  final String url = '${ConstantApi().listtrabajador.toString()}';
  Controller controller  = Get.put(Controller());
  Future<TrabajadorClass> gettrabajadores() async {
    Map match = {
      "type": "FREELANCER",
      "category": "BARBERIA",
      "locationInfo": {
        "city": "OSORNO",
        "commune": "OSORNO",
        "country": "Chile"
      }
    };
    var res = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(match),
    );
    //codigo 200 == correcto
    if (res.statusCode == 200) {
      Map<String, dynamic> map = json.decode(res.body);
      TrabajadorClass listaTrabajdores = doc.TrabajadorClass.fromJson(map);
      controller.saveTrabajadores(listaTrabajdores.docs);
      //retorna la lista
      return listaTrabajdores;
    } else {
      throw 'Error on database';
    }
  }





}