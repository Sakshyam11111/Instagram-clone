import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  bool _isLiked = false; // Track like state

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/The_Middle_East.mp4')
      ..initialize()
          .then((_) {
            setState(() {});
            _controller.play();
            _controller.setLooping(true);
          })
          .catchError((error) {
            print('Error initializing video: $error');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to load video')),
            );
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      // Caption (Top Left Inside Video)
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Text(
                          'Wake up Twin WW3 opening just dropped 💀❤️💔',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Username and Follow Button (Bottom Left Inside Video)
                      Positioned(
                        bottom: 60,
                        left: 10,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: const AssetImage(
                                'images/3.jpg',
                              ),
                            ),
                            const SizedBox(width: 9),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'monke.listening.to.music',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'We got WW3 before GTA 6 💦 ... more',
                                  style: const TextStyle(color: Colors.black),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () => print('Follow pressed'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                              ),
                              child: const Text(
                                'Follow',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Audio Indicator (Bottom Center Inside Video)
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            color: Colors.black54,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.music_note,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'THE ORAL CIGARETTES - Kyouran Hey Kids!!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Play/Pause Indicator
                if (!_controller.value.isPlaying)
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white.withOpacity(0.5),
                    size: 60,
                  ),
                // Right-side buttons (Like, Comment, Share, Bookmark)
                Positioned(
                  right: 10,
                  bottom: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLiked = !_isLiked; 
                          });
                          print('Like pressed');
                        },
                        tooltip: 'Like',
                      ),
                      Text(
                        _isLiked ? '136' : '135',
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white,
                        ),
                        onPressed: () => print('Comment pressed'),
                        tooltip: 'Comment',
                      ),
                      const Text(
                        '35',
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () => print('Share pressed'),
                        tooltip: 'Share',
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.bookmark_add_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () => print('Bookmark pressed'),
                        tooltip: 'Bookmark',
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}