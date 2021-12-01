import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worky/Logic/Controller.dart';
import 'Class and Constant/TrabajadorClass.dart';
import 'Logic/HttpSerices.dart';
import 'ShowModalTrabajadorCreate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        accentColor: Colors.black,
      ),
      home: MyHomePage(title: 'List Worky'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpService().gettrabajadores(),
      builder: (BuildContext context, AsyncSnapshot<TrabajadorClass> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return Scaffold(
                appBar: appBar(context),
                body: GetBuilder<Controller>(
                    builder: (_dx) => ListView.builder(
                          itemCount: _dx.listTrabajador.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                _cards(_dx.listTrabajador[index], context)
                              ],
                            );
                          },
                        )));
        }
        return null;
      },
    );
  }
}

Widget _cards(trabajador, BuildContext context) {
  final controlador = Get.put(Controller());
  controlador.SelectedTrabajador(trabajador);

  return Column(
    children: <Widget>[
      GestureDetector(
        child: Card(
          color: Colors.greenAccent,
          elevation: 10,
          child: ListTile(
            title: Text(
              '${controlador.trabajadorSelected.name}  ${controlador.trabajadorSelected.lastname}',
            ),
            subtitle: Text('${trabajador.status}'),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  'https://lh3.googleusercontent.com/ogw/ADGmqu_dqc7bdHNdXvRnNY6fG3LF4q7xD1KXvLTqikjuMw=s83-c-mo'),
            ),
          ),
        ),
        onTap: () {
          _oncardPressed(trabajador, context);
        },
      ),
    ],
  );
}

Widget _oncardPressed(Doc trabajador, BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  final controlador = Get.put(Controller());
  controlador.SelectedTrabajador(trabajador);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: new BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: ShowModalTrabajadorCreate(
        size: size,
      ),
    ),
  );
}

AppBar appBar(BuildContext context){
  final controlador = Get.put(Controller());
  return AppBar(
    title: Center(child: Text(controlador.nameAppbar.value)),
    actions: [
      Row(
        children: [
          ElevatedButton(
            onPressed: () => controlador.reorderList()
            ,
            child: Text(
              "A-Z",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic),
            ),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () => controlador.reorderListReverse(),
            child: Text(
              "Z-A",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic),
            ),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor),
          ),
        ],
      )
    ],
  );
}

