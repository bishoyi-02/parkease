import 'package:flutter/material.dart';

class ProfileImageWithUpload extends StatelessWidget {
  const ProfileImageWithUpload(
      {required this.imageUrl, required this.onUploadPressed, super.key});

  final String imageUrl;
  final VoidCallback onUploadPressed;
  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 16.0), // Add space between app bar and image
          GestureDetector(
            onTap: onUploadPressed,
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: imageUrl.isEmpty ? null : NetworkImage(imageUrl),
              backgroundColor: Colors.grey, // Placeholder background color
              child: imageUrl.isEmpty
                  ? const Icon(
                      Icons.cloud_upload,
                      size: 40.0,
                      color: Colors.white, // Placeholder icon color
                    )
                  : null, // Show image if imageUrl is not empty
            ),
          ),
          const SizedBox(height: 16.0),
          // Text widget for the name is now included within the Container above
        ],
      ),
    );
  }
}
