
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/features/home/presentation/bloc/home_event.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../widgets/home_view_success.dart';
import 'add_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildViw(),
      floatingActionButton: _buildFloating(),
    );
  }

  Widget _buildFloating() {
    return FloatingActionButton(
      onPressed: () {
        context.read<HomeBloc>().add(RestData());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPostPage()),
        );
      },
      child: Icon(Icons.add),
    );
  }

  Widget _buildViw() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        if (state.states == HomeStateStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }
        else if (state.states == HomeStateStatus.empty) {
          return Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPostPage()),
                  );
                },
                child: Text('Add Task')),
          );
        } else if (state.states == HomeStateStatus.success) {
          return HomeViewSuccess(
            posts: state.listModel,
          );
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }
}
