import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('user', style: TextStyle(color: Colors.white)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    // Handle edit profile action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.archive_outlined, color: Colors.white),
                  onPressed: () {
                    // Handle view archive action
                  },
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                  itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('Option 1')),
                    const PopupMenuItem(child: Text('Option 2')),
                  ],
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: const AssetImage('images/user_image.png'),
                    child: Builder(
                      builder: (context) {
                        return Image.asset(
                          'images/user_image.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print('Detailed Error loading user_image.png: $error, StackTrace: $stackTrace');
                            return const Icon(Icons.error, color: Colors.red);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '6 posts',
                              style: TextStyle(color: Colors.white),
                            ),
                            const Text(
                              '279 followers',
                              style: TextStyle(color: Colors.white),
                            ),
                            const Text(
                              '224 following',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Username',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Heyy, who is here?',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Story Highlights
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildHighlight('images/post_1.jpg', ''),
                  _buildHighlight('images/post_2.jpg', ''),
                  _buildHighlight('images/post_3.jpg', ''),
                  _buildAddStoryButton(),
                ],
              ),
            ),
            // Posts, Saved, Tagged Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTab('POSTS'),
                  _buildTab('SAVED'),
                  _buildTab('TAGGED'),
                ],
              ),
            ),
            // Grid of Posts
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final imagePaths = [
                  'images/post_1.jpg',
                  'images/post_2.jpg',
                  'images/post_3.jpg',
                  'images/post_4.jpg',
                  'images/post_9.jpg',
                  'images/post_8.jpg',
                ];
                final imagePath = imagePaths[index % imagePaths.length];
                return Image.asset(imagePath, fit: BoxFit.cover);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlight(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildAddStoryButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildTab(String label) {
    return Text(label, style: const TextStyle(color: Colors.white));
  }
}