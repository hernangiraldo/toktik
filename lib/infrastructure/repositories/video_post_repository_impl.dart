import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository {

  final VideoPostDatasource videosDS;

  VideoPostRepositoryImpl({required this.videosDS});

  @override
  Future<List<VideoPost>> getByPage(int page) {
    return videosDS.getByPage(page);
  }

}