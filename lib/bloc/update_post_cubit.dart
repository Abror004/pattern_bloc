import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/update_post_state.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/services/http_service.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInit());

  void apiPostUpdate(Post post) async {
    post.userId = 1;
    print(post.toJson());
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    if(response != null) {
      emit(UpdatePostLoaded(isUpdate: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}