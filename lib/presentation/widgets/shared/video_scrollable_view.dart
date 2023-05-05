import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/full_screen_player.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';


class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                url: videoPost.videoUrl,
              )
            ),
            Positioned(
              bottom: 40,
              right: 24,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      },
    );
  }
}