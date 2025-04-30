import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';



class CommunityFeedScreen extends StatefulWidget {
  const CommunityFeedScreen({super.key});

  @override
  _CommunityFeedScreenState createState() => _CommunityFeedScreenState();
}

class _CommunityFeedScreenState extends State<CommunityFeedScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(/*
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Community Feed',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      actions: [
          IconButton(
            icon: Icon(
              Icons.chat,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserSelectionScreen()),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeader(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('posts')
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(color: Colors.orange,));
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No posts yet.'));
                    }

                    final posts = snapshot.data!.docs;

                    if (index >= posts.length) {
                      return SizedBox.shrink(); // Empty widget if index out of range
                    }

                    final post = posts[index];

                    // Fetch post uploader's name
                    return FutureBuilder<DocumentSnapshot>(
                      future: _firestore
                          .collection('users')
                          .doc(post['userId'])
                          .get(),
                      builder: (context, userSnapshot) {
                        if (userSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator(color: Colors.orange));
                        }

                        if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
                          return Center(child: Text('User data unavailable'));
                        }

                        final userName = userSnapshot.data!['name'] ?? 'User';

                        return _buildPostItem(context, post, userName);
                      },
                    );
                  },
                );
              },
              childCount: 1000, // Adjust based on your needs
            ),
          ),
        ],
      ),
      */
    );
  }

}