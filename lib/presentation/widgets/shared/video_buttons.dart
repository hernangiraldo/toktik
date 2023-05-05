import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(counter: video.likes, iconColor: Colors.red, icon: Icons.favorite),
        const SizedBox(height: 16),
        _CustomIconButton(counter: video.likes, icon: Icons.remove_red_eye_outlined),
        const SizedBox(height: 16),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 2),
          child: const _CustomIconButton(counter: 0, icon: Icons.music_note_outlined, iconSize: 28.0,)
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int counter;
  final IconData icon;
  final double? size;
  final Color? color;

  const _CustomIconButton({
    required this.counter,
    required this.icon,
    iconColor,
    iconSize
  }): color = iconColor ?? Colors.white,
      size = iconSize ?? 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, color: color, size: size,),
        ),

        if (counter > 0)
          Text(HumanFormats.humanReadebleNumber(counter.toDouble()))
      ],
    );
  }
}