import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<Map<String, String>> posts = [
    {"thumbnail": "images/post_1.jpg", "username": "aaku_01"},
    {"thumbnail": "images/post_2.jpg", "username": "potter__"},
    {"thumbnail": "images/post_3.jpg", "username": "an_jumagar_"},
    {"thumbnail": "images/post_12.jpg", "username": "sharma__2"},
    {"thumbnail": "images/post_4.jpg", "username": "sharma__2"},
    {"thumbnail": "images/post_5.jpg", "username": "utk_123"},
    {"thumbnail": "images/post_6.jpg", "username": "shaynehydn_"},
    {"thumbnail": "images/post_7.jpg", "username": "ritukumari_3"},
    {"thumbnail": "images/post_9.jpg", "username": "aaku_01"},
    {"thumbnail": "images/post_10.jpg", "username": "potter__"},
    {"thumbnail": "images/post_8.jpg", "username": "fiona.szee"},
    {"thumbnail": "images/post_11.jpg", "username": "an_jumagar_"},
  ];

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredPosts = [];

  @override
  void initState() {
    super.initState();
    _filteredPosts = posts;
    _searchController.addListener(_filterPosts);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterPosts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPosts = posts
          .where((post) => post['username']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
      ),
      body: _filteredPosts.isEmpty
          ? const Center(child: Text('No results found', style: TextStyle(color: Colors.white)))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: _filteredPosts.length,
              itemBuilder: (context, index) {
                final post = _filteredPosts[index];
                return Image.asset(
                  post['thumbnail']!,
                  fit: BoxFit.cover,
                  semanticLabel: 'Post by ${post['username']}',
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[900],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                );
              },
            ),
      backgroundColor: Colors.black,
    );
  }
}