import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive layout
    final screenWidth = MediaQuery.of(context).size.width;
    // Adjust flex ratios based on screen size
    final leftPanelFlex = screenWidth < 600 ? 1 : 2;
    final rightPanelFlex = screenWidth < 600 ? 1 : 3;

    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              // Left panel with search and messages
              Expanded(
                flex: leftPanelFlex,
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.02,
                    vertical: constraints.maxWidth * 0.01,
                  ),
                  child: Column(
                    children: [
                      // Search bar
                      Padding(
                        padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            prefixIcon: Icon(Icons.search, color: Colors.grey, size: screenWidth < 600 ? 20 : 24),
                            filled: true,
                            fillColor: Colors.grey[850],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: screenWidth < 600 ? 12 : 16,
                              horizontal: 12,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth < 600 ? 14 : 16,
                          ),
                        ),
                      ),
                      // Messages list
                      Expanded(
                        child: ListView.builder(
                          itemCount: _sampleUsers.length,
                          itemBuilder: (context, index) {
                            final user = _sampleUsers[index];
                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth * 0.02,
                                vertical: 4,
                              ),
                              leading: CircleAvatar(
                                radius: screenWidth < 600 ? 20 : 24,
                                backgroundImage: AssetImage(user['image']!),
                                onBackgroundImageError: (_, __) => Icon(Icons.error, color: Colors.grey),
                              ),
                              title: Text(
                                user['name']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth < 600 ? 14 : 16,
                                ),
                              ),
                              subtitle: Text(
                                'Send message',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth < 600 ? 12 : 14,
                                ),
                              ),
                              onTap: () {
                                // Add navigation or message action here
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Right panel with send message option
              Expanded(
                flex: rightPanelFlex,
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(constraints.maxWidth * 0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message,
                        color: Colors.white,
                        size: screenWidth < 600 ? 40 : 50,
                      ),
                      SizedBox(height: constraints.maxWidth * 0.02),
                      Text(
                        'Your messages',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth < 600 ? 16 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: constraints.maxWidth * 0.01),
                      Text(
                        'Send private photos and messages to a friend or group.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth < 600 ? 12 : 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: constraints.maxWidth * 0.02),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth < 600 ? 16 : 24,
                            vertical: screenWidth < 600 ? 10 : 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Send message',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth < 600 ? 14 : 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Sample user data (replace with actual data source)
  final List<Map<String, String>> _sampleUsers = [
    {'name': 'fiona.szee', 'image': 'assets/images/8.jpg'},
    {'name': 'sharma_2', 'image': 'assets/images/4.jpg'},
    {'name': 'aaku_01', 'image': 'assets/images/1.jpg'},
    {'name': 'potter_', 'image': 'assets/images/2.jpg'},
    {'name': 'ritukumari_3', 'image': 'assets/images/7.jpg'},
    {'name': 'shaynehydn_', 'image': 'assets/images/6.jpg'},
    {'name': 'an_jumagar_', 'image': 'assets/images/3.jpg'},
    {'name': 'utk_123', 'image': 'assets/images/5.jpg'},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(const MaterialApp(home: SearchPage()));
}