import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  final String username;
  final String location;
  final String image_post;
  final String profile_image;
  final int likes;

  const Posts({
    super.key,
    required this.username,
    required this.location,
    required this.image_post,
    required this.profile_image,
    required this.likes,
  });

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool isFavorited = false;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.profile_image),
            ),
            title: Text(
              widget.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(widget.location),
            trailing: const Icon(Icons.more_vert),
          ),

          // Post Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(widget.image_post),
          ),

          // Action Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Favorite Icon
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                  },
                  child: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.black54,
                  ),
                ),
                const SizedBox(width: 8),
                // Comment Icon
                const Icon(Icons.chat_bubble_outline, color: Colors.black54),
                const SizedBox(width: 8),
                // Send Icon
                const Icon(Icons.send, color: Colors.black54),
                const Spacer(),
                // Bookmark Icon
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                  child: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? Color(0xFF6D60BC) : Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // Likes Section with Bottom Alignment
          Stack(
            children: [
              // Liked User Avatars
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/img/user.jpg'),
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/img/julia.jpg'),
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/img/Maria.jpg'),
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/img/you.jpg'),
                    ),
                  ],
                ),
              ),
              // Text liked
              Positioned(
                bottom: 0,
                right: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'liked by',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      ' Izabella',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' and',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      ' ${widget.likes}K more',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
