import 'package:get/get.dart';
import 'package:worky/Class%20and%20Constant/TrabajadorClass.dart';

class Controller extends GetxController{

 final nameAppbar ="List Worky".obs;

 List<Doc> listTrabajador =[];
 Doc trabajadorSelected;

 void saveTrabajadores(List<Doc> listatrbajadores)=> listTrabajador = listatrbajadores;


 void SelectedTrabajador(Doc trabajadorClass) => trabajadorSelected=trabajadorClass;


 void reorderList(){
  if(listTrabajador.isNotEmpty) {
   listTrabajador.sort((a, b) => a.name.compareTo(b.name));
   update();
  }else{
   //trow
  }
 }

 void reorderListReverse(){
  if(listTrabajador.isNotEmpty) {
   listTrabajador.sort((b, a) => a.name.compareTo(b.name));
   update();
  }else{
   //trow
  }
 }


}