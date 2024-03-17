import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/shared/const.dart';
import 'package:to_do_list/core/shared/widgets/custom_Checkbox.dart';
import 'package:to_do_list/features/home/data/post_model.dart';
import 'package:to_do_list/features/home/presentation/bloc/home_bloc.dart';
import 'package:to_do_list/features/home/presentation/bloc/home_state.dart';

import '../bloc/home_event.dart';

class HomeViewSuccess extends StatelessWidget {
  const HomeViewSuccess({super.key, required this.posts});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 15, bottom: 6, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts[index].title!,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                            fontFamily: 'PlayfairDisplay'),
                      ),
                      Divider(),
                      SizedBox(
                        height: 6,
                      ),
                      posts[index].isVisible!
                          ? bodyText(posts[index].body!)
                          : Text('**********'),
                      SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Row(
                        children: [
                          Text(
                            posts[index].date!.split(' ').first.trim(),
                            style: TextStyle(color: colorTheme),
                          ),
                          IconButton(
                              onPressed: () {
                                deletePost(context, posts[index]);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}

void deletePost(BuildContext context, PostModel post) {
  context.read<HomeBloc>().add(DeletePost(post));
}

Widget bodyText(String txt) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  );
}
