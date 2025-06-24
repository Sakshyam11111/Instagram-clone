import 'package:flutter/material.dart';
import 'package:insta_app/VideoPage.dart';
import 'package:insta_app/home_page.dart';
import 'package:insta_app/search_page.dart';
import 'package:insta_app/explore_page.dart';
import 'package:insta_app/profile_page.dart'; // Import the ProfilePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Color.fromRGBO(40, 40, 40, 1)),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          color: Colors.white,
          iconTheme: IconThemeData(color: Color.fromRGBO(40, 40, 40, 1)),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage == 1
          ? const SearchPage()
          : currentPage == 2
              ? const VideoPage()
              : currentPage == 3
                  ? const ExplorePage()
                  : currentPage == 4
                      ? const ProfilePage() // Navigate to ProfilePage when currentPage is 4
                      : const HomePage(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.home,
                color: currentPage == 0
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.message_outlined,
                color: currentPage == 1
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.ondemand_video,
                color: currentPage == 2
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 2;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.search,
                color: currentPage == 3
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 3;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.person,
                color: currentPage == 4
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 4;
                });
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}