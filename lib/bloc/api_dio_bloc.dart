

import 'package:bloc/bloc.dart';
import 'package:dio_fatch_bloc/bloc/api_dio_event.dart';
import 'package:dio_fatch_bloc/bloc/api_dio_state.dart';
import 'package:dio_fatch_bloc/dio/dio_repository.dart';
import 'package:dio_fatch_bloc/dio/model_class.dart';
import 'package:dio_fatch_bloc/fatch_api_data/utail.dart';

class DioBloc extends Bloc<DioEvent, DioState> {
  DioBloc() : super(DioState()) {
    on<FatchedData>(fatchData);
  }
  final DioRepositry dioRepositry = DioRepositry();
  void fatchData(FatchedData event, Emitter<DioState> emit) async {
    try {
      final List<DioModelClass> data = await dioRepositry.fetchData();
      emit(DioState(status: PostStatus.sucess, posts: data));
    // ignore: unused_catch_stack
    } catch (error, stackTrace) {
      emit(DioState(status: PostStatus.fail, error: error.toString()));
    }
  }
}