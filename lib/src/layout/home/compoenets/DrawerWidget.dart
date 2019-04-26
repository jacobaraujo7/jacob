import 'package:appmodel/src/appBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatelessWidget {
  Widget _getSaudacao() {
    String saudacao = "";
    var date = DateTime.now();
    if (date.hour > 00 && date.hour < 12)
      saudacao = "Olá, Bom dia!";
    else if (date.hour > 12 && date.hour < 18)
      saudacao = "Olá, Boa tarde!";
    else
      saudacao = "Olá, Boa Noite!";

    return Text(
      saudacao,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _itemList(
      {String text = "Text",
      IconData iconData = FontAwesomeIcons.globe,
      String url}) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(text),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            _getSaudacao(),
            Container(
              height: 20,
            ),
            StreamBuilder(
              stream: BlocProvider.of<AppBloc>(context).themeOut,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) return Container();

                return ListTile(
                  title: Text("Tema Noturno"),
                  trailing: Switch(
                    onChanged: (bool value) {
                      BlocProvider.of<AppBloc>(context).changeTheme(value);
                    },
                    value: snapshot.data,
                  ),
                );
              },
            ),
            Container(
              height: 20,
            ),
            _itemList(iconData: FontAwesomeIcons.globe, text: "Site"),
            _itemList(iconData: FontAwesomeIcons.facebookF, text: "Facebook"),
            _itemList(iconData: FontAwesomeIcons.twitter, text: "Twitter"),
            _itemList(iconData: FontAwesomeIcons.instagram, text: "Instagram"),
            _itemList(iconData: FontAwesomeIcons.whatsapp, text: "WhatsApp"),
            Container(
              height: 60,
            ),
            Center(
              child: Container(
                width: 100,
                child: Image.asset("assets/imgs/angel.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
