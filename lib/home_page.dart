import 'package:flutter/material.dart';
import 'package:flutter_universe/detalle_page.dart';
import 'package:flutter_universe/searchdelegate.dart';
import 'constantes.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dato.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catálogo de autos",
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate:CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [gradientInicioColor, gradientFinColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.7]
          )
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Automóviles',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),            
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: autos.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetallePage(
                              autoInfo: autos[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 100),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 100),
                                      Text(
                                        autos[index].nombre,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 44,
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Autos',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 23,
                                          color: primarioTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 32),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Ver más',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: secundarioTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secundarioTextColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(
                            tag: autos[index].posicion,
                            child: Image.asset(autos[index].iconoImagen),
                          ),
                          Positioned(
                            right: 24,
                            bottom: 60,
                            child: Text(
                              autos[index].posicion.toString(),
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 200,
                                color: primarioTextColor.withOpacity(0.08),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Autos originales',style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Autos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
