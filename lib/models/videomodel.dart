class VideoModel {
  String? title;
  String? time;
  String? thumbnail;
  String? videoUrl;

  VideoModel({
    this.title,
    this.time,
    this.thumbnail,
    this.videoUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        title: json["title"],
        time: json["time"],
        thumbnail: json["thumbnail"],
        videoUrl: json["videoUrl"],
      );
}
