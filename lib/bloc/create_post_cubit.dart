import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/create_post_state.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/services/http_service.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInit());

  void apiPostCreate(Post post) async {
    print(post.toJson());
    emit(CreatePostLoading());
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if(response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}