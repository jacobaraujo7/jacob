import 'package:appmodel/src/layout/components/BackToolBar.dart';
import 'package:appmodel/src/layout/components/LogoWidget.dart';
import 'package:appmodel/src/layout/home/compoenets/CardItem.dart';
import 'package:appmodel/src/layout/home/compoenets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  Widget _appBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: Offset(0.0, 1.0),
              blurRadius: 15)
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackToolBar(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, bottom: 10),
                child: LogoWidget(),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 25, bottom: 20),
                child: IconButton(
                  onPressed: () {
                    _keyScaffold.currentState.openEndDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 34,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10, right: 20, left: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Nome do Aplicativo",
            style: TextStyle(fontSize: 24),
          ),
          Text("ESTAÇÕES"),
        ],
      ),
    );
  }

  Widget _botton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RaisedButton.icon(
        
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        icon: Icon(Icons.email),
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Contato"),
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      endDrawer: DrawerWidget(),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: 90, left: 15, right: 15),
            children: <Widget>[
              _header(),
              CardItem(),
              CardItem(),
              CardItem(),
              CardItem(),
            ],
          ),
          _appBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _botton(),
          )
        ],
      ),
    );
  }
}
