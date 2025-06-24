// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of profile images
  List<String> profileImages = [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg",
    "images/6.jpg",
    "images/7.jpg",
    "images/8.jpg",
  ];

  // List of post images
  List<String> posts = [
    "images/post_1.jpg",
    "images/post_2.jpg",
    "images/post_3.jpg",
    "images/post_4.jpg",
    "images/post_5.jpg",
    "images/post_6.jpg",
    "images/post_7.jpg",
    "images/post_8.jpg",
    "images/post_9.jpg",
    "images/post_10.jpg",
    "images/post_11.jpg",
    "images/post_12.jpg",
  ];

  // List of usernames for variety
  List<String> usernames = [
    "aaku_01",
    "potter__",
    "an_jumagar_",
    "sharma__2",
    "utk_123",
    "shaynehydn_",
    "ritukumari_3",
    "fiona.szee",
  ];

  // Track like state for each post
  late List<bool> _isLiked;

  @override
  void initState() {
    super.initState();
    // Initialize like state for each post (false = unliked)
    _isLiked = List<bool>.filled(posts.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/instatitle.png", height: 50),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => print("Add post tapped"),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => print("Likes tapped"),
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () => print("Messages tapped"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  profileImages.length, 
                  (index) => Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: const AssetImage("images/story.png"),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(profileImages[index]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          usernames[index], 
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            // Posts section
            Column(
              children: List.generate(
                posts.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: CircleAvatar(
                            radius: 17, 
                            backgroundImage:
                                const AssetImage("images/story.png"),
                            child: CircleAvatar(
                              radius: 14, 
                              backgroundImage: AssetImage(profileImages[
                                  index % profileImages.length]), 
                            ),
                          ),
                        ),
                        Text(usernames[index % usernames.length]),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () => print("More options tapped"),
                        ),
                      ],
                    ),
                    // Post image
                    Image.asset(
                      posts[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    // Post actions
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            _isLiked[index] ? Icons.favorite : Icons.favorite_border,
                            color: _isLiked[index] ? Colors.red : null, 
                          ),
                          onPressed: () {
                            setState(() {
                              _isLiked[index] = !_isLiked[index]; 
                            });
                            print("Like tapped for post $index");
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.chat_bubble_outline),
                          onPressed: () => print("Comment tapped"),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () => print("Share tapped"),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.bookmark_outline),
                          onPressed: () => print("Save tapped"),
                        ),
                      ],
                    ),
                    // Post caption and likes
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                const TextSpan(text: "Liked by "),
                                TextSpan(
                                  text: usernames[index % usernames.length],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(text: " and "),
                                TextSpan(
                                  text: _isLiked[index] ? "others" : "others",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "${usernames[index % usernames.length]} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text:
                                      "This is the most amazing picture put on Instagram. This is also best course ever made!!!",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "View all 12 comments",
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}