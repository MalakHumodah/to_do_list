import 'package:equatable/equatable.dart';
import '../../data/post_model.dart';

enum HomeStateStatus { empty, loading, success, error }

class HomeState extends Equatable {
  final String? selectedDate;
  final bool isChecked;
  final HomeStateStatus states;
  final List<PostModel> listModel;

  const HomeState({
    this.listModel = const [],
    this.states = HomeStateStatus.empty,
    this.isChecked = false,
    this.selectedDate,
  });

  HomeState copyWith({
    List<PostModel>? listModel,
    HomeStateStatus? states,
    bool? isChecked,
    String? selectedDate,
  }) {
    return HomeState(
        listModel: listModel ?? this.listModel,
        selectedDate: selectedDate ?? this.selectedDate,
        isChecked: isChecked ?? this.isChecked,
        states: states ?? this.states);
  }

  @override
  List<Object?> get props => [
        listModel,
        isChecked,
        states,
        selectedDate,
      ];
}
