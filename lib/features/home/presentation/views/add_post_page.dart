import 'package:flutter/material.dart';

import '../widgets/add_post_widget.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Post Page'),),
      body: AddPostWidget(),
    );
  }
}
