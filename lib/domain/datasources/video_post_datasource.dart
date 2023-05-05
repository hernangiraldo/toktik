import 'package:toktik/domain/entities/video_post.dart';

abstract class GetAll {
  Future<List<VideoPost>> getAll();
}

abstract class GetByPage<T> {
  Future<List<T>> getByPage(int page);
}

abstract class VideoPostDatasource implements GetByPage<VideoPost> {}