
import 'package:dio_fatch_bloc/dio/model_class.dart';
import 'package:dio_fatch_bloc/fatch_api_data/utail.dart';

class DioState {
  final PostStatus status;
  final List<DioModelClass>? posts;
  final String? error;
  DioState({this.status = PostStatus.loading, this.posts = const <DioModelClass>[], this.error});
  DioState copyWith({
    PostStatus? status,
    List<DioModelClass>? posts,
    String? error,
  }) {
    return DioState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      error: error ?? this.error,);
}
}