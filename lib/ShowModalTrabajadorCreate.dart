import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Class and Constant/TrabajadorClass.dart';
import 'Logic/Controller.dart';

class ShowModalTrabajadorCreate extends StatefulWidget {
  final Size size;

  const ShowModalTrabajadorCreate({Key key, @required this.size})
      : super(key: key);

  @override
  _ShowModalTrabajadorCreateState createState() =>
      _ShowModalTrabajadorCreateState();
}

class _ShowModalTrabajadorCreateState extends State<ShowModalTrabajadorCreate> {
  final controlador = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      SizedBox(
        height: widget.size.height,
        child: Align(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  controlador.trabajadorSelected.name +
                      " " +
                      controlador.trabajadorSelected.lastname,
                  style: GoogleFonts.lato(fontSize: 32),
                ),
              ),
              sizedBox(),
              Expanded(
                  child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://lh3.googleusercontent.com/ogw/ADGmqu_dqc7bdHNdXvRnNY6fG3LF4q7xD1KXvLTqikjuMw=s83-c-mo'),
                  ),
                  sizedBox(),
                  Text(
                    "Rut:  " + controlador.trabajadorSelected.rut,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                  sizedBox(),
                  Text(
                    "Estado:  " + controlador.trabajadorSelected.status,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                  sizedBox(),
                  Text(
                    "Telefono:  " + controlador.trabajadorSelected.cellphone,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                  sizedBox(),
                  Text(
                    "Email:  " + controlador.trabajadorSelected.email,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),

                  sizedBox(),
                  Text(
                    "Pais:  " +
                        controlador.trabajadorSelected.locationInfo.country,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                  sizedBox(),
                  Text(
                    "Comuna:  " +
                        controlador.trabajadorSelected.locationInfo.commune,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                  sizedBox(),
                  Text(
                    "Ciudad:  " +
                        controlador.trabajadorSelected.locationInfo.city,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                  sizedBox(),
                ],
              )),
            ],
          ),
        ),
      ),
    ]);
  }
}

SizedBox sizedBox() {
  return SizedBox(
    height: 20,
  );
}
