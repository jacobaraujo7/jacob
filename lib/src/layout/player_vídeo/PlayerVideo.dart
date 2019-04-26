import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:screen/screen.dart';


class PlayerVideo extends StatefulWidget {
  final String url;

  const PlayerVideo(
      {Key key,
      this.url =
          'https://5b7f3c45ab7c2.streamlock.net:443/8016/ngrp:8016_all/playlist.m3u8?DVR'})
      : super(key: key);

  @override
  _PlayerVideoState createState() => _PlayerVideoState();
}

class _PlayerVideoState extends State<PlayerVideo> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(_resolveUrl());
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      isLive: Platform.isAndroid,

    );

    Screen.keepOn(true);

  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  String _resolveUrl() {
    String url = widget.url;
    if (Platform.isAndroid) {
      url = url.replaceFirst("?DVR", "");
    }

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
