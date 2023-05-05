import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

final String url;
final String caption;

  const FullScreenPlayer({
    super.key,
    required this.url,
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.url)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if ( snapshot.connectionState != ConnectionState.done ) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GestureDetector(
          onTap: () {
            if ( controller.value.isPlaying ) {
              controller.pause();
              return;
            }

            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                _GradientBackground(stops: const [0.6, 1.0], colors: [Colors.transparent, Colors.black.withOpacity(0.9)],),
                _VideoCaption(caption: widget.caption)
              ]
            ),
          ),
        );
      },
    );
  }
}

class _GradientBackground extends StatelessWidget {
  final Alignment beginGradient;
  final Alignment endGradient;
  final List<Color> colors;
  final List<double> stops;

  const _GradientBackground({
    begin = Alignment.topCenter,
    end = Alignment.bottomCenter,
    this.colors = const [
      Colors.transparent,
      Colors.black,
    ],
    this.stops = const [
      0.0,
      0.5,
    ]
  }): beginGradient = begin, endGradient = end, assert(colors.length == stops.length, 'Stops and colors should have the same length');
  
  @override
  Widget build(Object context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: beginGradient,
            end: endGradient,
            colors: colors,
            stops: stops
          ),
        ),
      )
    );
  }


}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({
    required this.caption,
  });


  @override
  Widget build(BuildContext context) {

    final screenWitdh = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 50,
      child: SizedBox(
        width: screenWitdh * .6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            caption,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}