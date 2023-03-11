import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:videoplayer/models/videomodel.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  Widget build(BuildContext context) {
    List<VideoModel>? videoList = [];
    bool _playArea = false;
    bool _isPlaying = true;
    bool _disposed = false;
    int _isPlayingIndex = 0;
    String _curPos = "";
    String _totalPos = "";
    String _videoTime = "00:00";
    VideoPlayerController? _controller;
    Future<void>? _initializeVideoPlayerFuture;

    initData() async {
      if (_controller != null) {
        // _controller?.removeListener(videoListener);
        _controller?.dispose();
        _controller = null;
      }
      if (_initializeVideoPlayerFuture != null) {
        _initializeVideoPlayerFuture = null;
      }
      var res = await DefaultAssetBundle.of(context)
          .loadString("json/videoinfo.json");
      var resInfo = json.decode(res);

      setState(() {
        // videoList = List<Video>.from(resInfo.map((x) => Video.fromJson(x)));
        // print(videoList);
      });
    }

    void videoListener() {
      print("_videoListener");
      var curPosition = _controller?.value.position;
      var totalPosition = _controller?.value.duration;
      setState(() {
        _curPos = curPosition.toString().substring(2, 7);
        _totalPos = totalPosition.toString().substring(2, 7);
        _videoTime = "${_curPos}/${_totalPos}";
      });
      print("当前位置${_curPos}，全部${_totalPos}");
      if (curPosition.toString() != "0:00:00.000000" &&
          curPosition == totalPosition) {
        setState(() {
          _isPlayingIndex = _isPlayingIndex + 1;
          if (_isPlayingIndex >= videoList.length) {
            _isPlayingIndex = 0;
          }
        });
        // playVideo(videoList.elementAt(_isPlayingIndex).videoUrl!);
      }
    }

    playVideo(String url) {
      setState(() {
        _controller?.removeListener(videoListener);
        _controller?.dispose();
        _controller = null;
        _initializeVideoPlayerFuture = null;
        _curPos = "";
        _totalPos = "";
        _videoTime = "";
        _controller = VideoPlayerController.network(url);

        _initializeVideoPlayerFuture = _controller?.initialize().then((_) {
          _controller?.seekTo(Duration(milliseconds: 0));
          _controller?.play();
          _controller?.addListener(videoListener);
        });
      });
    }

    @override
    void initState() {
      initData();
      super.initState();
    }

    @override
    void dispose() {
      _disposed = true;
      _controller?.removeListener(videoListener);
      _controller?.dispose();
      _controller = null;
      _initializeVideoPlayerFuture = null;
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
