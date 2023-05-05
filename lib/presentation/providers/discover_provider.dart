import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepository videoPostRepository;
  List<VideoPost> videos = [];
  bool initialLoading = true;

  DiscoverProvider({required this.videoPostRepository});


  Future<void> loadNextPage() async {
    final List<VideoPost> newVideos = await videoPostRepository.getByPage(1);
    
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}