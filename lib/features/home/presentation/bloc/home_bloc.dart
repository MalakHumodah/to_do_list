import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../../Services/shared_pref.dart';
import '../../data/post_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController date = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  HomeBloc() : super(const HomeState()) {
    on<GetPost>(_getPosts);
    on<AddPost>(_addPost);
    on<UpdateDate>(_updateDate);
    on<UpdateCheckbox>(_updateCheckbox);
    on<RestData>(_restData);
    on<DeletePost>(_deletePost);

    add(GetPost());
  }

  Future<FutureOr> _getPosts(GetPost event, Emitter<HomeState> emit) async {
    emit(state.copyWith(states: HomeStateStatus.loading));
    await Future.delayed(Duration(seconds: 2));
    List<dynamic> decodedData =
        json.decode(Prefs.getString('posts') ?? ""); //List of Maps
    List<PostModel> posts = [];
    for (var model in decodedData) {
      posts.add(PostModel.fromMap(model));
    }
    if (posts.isEmpty) {
      emit(
        state.copyWith(
          states: HomeStateStatus.empty,
        ),
      );
    } else {
      emit(
        state.copyWith(
          states: HomeStateStatus.success,
          listModel: posts,
        ),
      );
    }
  }

  Future<void> _addPost(AddPost event, Emitter<HomeState> emit) async {
    List<PostModel> newPosts = [];
    List<Map<String, dynamic>> posts = [];
    newPosts.addAll(state.listModel);
    newPosts.add(PostModel(
        id: Uuid().v1(),
        title: title.text,
        body: body.text,
        date: state.selectedDate,
        isVisible: state.isChecked));
    for (var model in newPosts) {
      posts.add(model.toMap());
    }
    await Prefs.setString('posts', json.encode(posts));

    emit(state.copyWith(listModel: newPosts));
  }

  FutureOr<void> _updateCheckbox(
    UpdateCheckbox event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(isChecked: event.isChecked));
  }

  FutureOr<void> _updateDate(UpdateDate event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedDate: event.pickedValue.toString()));
  }

  FutureOr<void> _restData(RestData event, Emitter<HomeState> emit) {
    title.text = '';
    body.text = '';
    add(UpdateCheckbox(isChecked: false));
    add(UpdateDate(pickedValue: DateTime.now()));
  }

  Future<FutureOr<void>> _deletePost(DeletePost event, Emitter<HomeState> emit) async {
    emit(state.copyWith(states: HomeStateStatus.loading));

  List<PostModel> newList=[];
  newList.addAll(state.listModel);
  newList.remove(event.postModel);

  List<Map> posts=[];
  for(PostModel model in newList){
    posts.add(model.toMap());
  }

  await Prefs.setString('posts',json.encode(posts));

  emit(state.copyWith(listModel: newList,states: HomeStateStatus.success ));
  }
}
