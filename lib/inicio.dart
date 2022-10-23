import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/fondoapp.png"),
                    fit: BoxFit.cover)
            )
        ),
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: MediaQuery.of(context).size.height * 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/iconoapp.png",
                      scale: 0.5,
                      height: 60.0,
                    ),
                    SizedBox(height: 20),
                    Container(
                        child: Center(
                            child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text("Autos",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)))),
                        Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text("Originales",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)))),
                        SizedBox(height: 30),
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text("Catálogo",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ))
                      ],
                    ))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    height: 40.0,
                    width: 180.0,
                    child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: Text("Empezar"),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                          primary: Colors.red[900],
                          elevation: 7.0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        )),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
