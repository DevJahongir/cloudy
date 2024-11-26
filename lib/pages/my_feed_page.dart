import 'package:flutter/material.dart';
import '../widgets/posts.dart';
import '../widgets/user_stories.dart';

class MyFeedPage extends StatelessWidget {
  const MyFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: const Text(
          'Cloudy',
          style: TextStyle(
            color: Color(0xFF6D60BC),
            fontSize: 32,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black54,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black54,
              size: 35,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Stories Section
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                usersStories('You', 'assets/img/you.jpg', true),
                usersStories('Julia', 'assets/img/julia.jpg'),
                usersStories('John', 'assets/img/3.jpg'),
                usersStories('Maria', 'assets/img/Maria.jpg'),
                usersStories('Izabella', 'assets/img/izabella.jpg'),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Posts Section
          Posts(
            username: 'Opphen',
            location: 'Manhattan, NYC',
            image_post: 'assets/img/post11.jpg',
            profile_image: 'assets/img/post1.jpg',
            likes: 138,
          ),
          const SizedBox(height: 20),
          Posts(
            username: 'Morbius',
            location: 'London, UK',
            image_post: 'assets/img/post2.png',
            profile_image: 'assets/img/user.jpg',
            likes: 110,
          ),
        ],
      ),
    );
  }
}
