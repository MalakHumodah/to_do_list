
import 'package:to_do_list/features/home/data/post_model.dart';

abstract class HomeEvents {}

class GetPost extends HomeEvents {}

class AddPost extends HomeEvents {}

class UpdateDate extends HomeEvents {
  final DateTime ? pickedValue;

  UpdateDate({required this.pickedValue});
}
class UpdateCheckbox extends HomeEvents{
  final bool isChecked;

  UpdateCheckbox({required this.isChecked});
}

class RestData extends HomeEvents{}
class DeletePost extends HomeEvents{
  final PostModel postModel;

  DeletePost(this.postModel);

}
