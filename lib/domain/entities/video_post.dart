class VideoPost {
  final String caption;
  final int likes;
  final int views;
  final String videoUrl;

  VideoPost({
    required this.caption,
    this.likes = 0,
    this.views = 0,
    required this.videoUrl,
  });
}