import 'package:cloudy/widgets/profile_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            'Tiner Stark',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.grey.shade200),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Profile Information
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/img/profile.png'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiner Stark',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'UI Designer And Developer',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Text(
                      'JockySpa.com',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Story Highlights
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profileStory('assets/img/story1.jpg'),
                profileStory('assets/img/story2.jpg'),
                profileStory('assets/img/story3.jpg'),
                profileStory('assets/img/story4.jpg'),
                profileStory('assets/img/story5.jpg'),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Stats Row
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoUser('455', 'Images'),
                _infoUser('566K', 'Followers'),
                _infoUser('894', 'Following'),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Action Buttons
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    height: 60,
                    color: Color(0xFF6D60BC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () {},
                    child: Text(
                      'FOLLOWING',
                      style: TextStyle(color: Colors.white, fontSize: 16,),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                MaterialButton(
                  minWidth: 70,
                  height: 60,
                  color: Color(0xFF6D60BC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {
                  },
                  child: Icon(Icons.message_rounded, color: Colors.white, size: 28,),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // Grid of Images
          SizedBox(
            height: 500,
            child: GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final List<String> imagePaths = [
                    'assets/img/galaxy.jpg',
                    'assets/img/post11.jpg',
                    'assets/img/grid3.jpg',
                    'assets/img/img.png',
                    'assets/img/img_1.png',
                    'assets/img/img_2.png',
                  ];

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePaths[index % imagePaths.length],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _infoUser(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
