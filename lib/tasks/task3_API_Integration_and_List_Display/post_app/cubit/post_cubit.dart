import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  static PostCubit get(context) => BlocProvider.of(context);

  List posts = [];

  Future fetchPosts() async {
    emit(PostLoading());
    try {
      http.Response response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      posts = jsonDecode(response.body);
      print(posts);
      emit(PostSuccess());
    } catch (e) {
      emit(PostFailure(msg: e.toString()));
    }
  }
}
