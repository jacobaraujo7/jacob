import 'package:appmodel/src/layout/player_v%C3%ADdeo/PlayerVideo.dart';
import 'package:flutter/material.dart';


class CardItem extends StatefulWidget {
  final String imageAsset;
  final String label;

  const CardItem(
      {Key key,
      this.imageAsset = "assets/imgs/banners/banner1.jpg",
      this.label = "Vídeo ao vivo"})
      : super(key: key);

  @override
  CardItemState createState() {
    return new CardItemState();
  }
}

class CardItemState extends State<CardItem> {
  bool isPlayer = false;

  @override
  Widget build(BuildContext context) {
    double radius = 5.0;
    return Container(
      height: 200,
      child: GestureDetector(
        onTap: () {
          if (!isPlayer) {
            setState(() {
              isPlayer = true;
            });
          }

          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          //   return WebViewWidget();
          // }));
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          //   return PlayerVideo();
          // }));
        },
        child: Card(
                child: isPlayer
            ? PlayerVideo()
            : Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(radius),
                          child: Image.asset(
                            widget.imageAsset,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(radius),
                            bottomRight: Radius.circular(radius)),
                        child: Container(
                          height: 95,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_circle_filled,
                        size: 55,
                        color: Colors.grey[500].withOpacity(0.7),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 34),
                        child: Text(
                          widget.label,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
