import 'package:flutter/material.dart';

class WebViewWidget extends StatefulWidget {
  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewWidget extends StatefulWidget {
//   @override
//   _WebViewWidgetState createState() => _WebViewWidgetState();
// }

// class _WebViewWidgetState extends State<WebViewWidget> {

//    final Completer<WebViewController> _controller =
//       Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return WebView(
//           initialUrl: 'https://5b7f3c45ab7c2.streamlock.net:443/8016/ngrp:8016_all/playlist.m3u8?DVR',
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webViewController) {
//             _controller.complete(webViewController);
//           },
//           // TODO(iskakaushik): Remove this when collection literals makes it to stable.
//           // ignore: prefer_collection_literals
//           javascriptChannels: <JavascriptChannel>[
//             _toasterJavascriptChannel(context),
//           ].toSet(),
//         );
//   }

//   JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
//     return JavascriptChannel(
//         name: 'Toaster',
//         onMessageReceived: (JavascriptMessage message) {
//           Scaffold.of(context).showSnackBar(
//             SnackBar(content: Text(message.message)),
//           );
//         });
//   }
// }