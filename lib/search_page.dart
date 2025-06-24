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
    return Scaffold(
      body: Row(
        children: [
          // Left panel with search and messages
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  // Search bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[850],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // Messages list
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('images/8.jpg'),
                          ),
                          title: Text(
                            'fiona.szee',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Send message',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('images/4.jpg'),
                          ),
                          title: Text(
                            'sharma_2',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Send message',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('images/1.jpg'),
                          ),
                          title: Text(
                            'aaku_01',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Send message',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),

                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('images/2.jpg'),
                          ),
                          title: Text(
                            'potter_',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Send message',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('images/7.jpg'),
                          ),
                          title: Text(
                            'ritukumari_3',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Send message',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('images/6.jpg'),
                          ),
                          title: Text(
                            'shaynehydn_',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Send message',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('images/3.jpg'),
                          ),
                          title: Text(
                            'an_jumagar_',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Send message',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('images/5.jpg'),
                          ),
                          title: Text(
                            'utk_123',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Send message',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right panel with send message option
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message, color: Colors.white, size: 50),
                  SizedBox(height: 16),
                  Text(
                    'Your messages',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Send private photos and messages to a friend or group.',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Send message', style: TextStyle(color: Colors.white),),
                    
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(home: SearchPage()));
}
