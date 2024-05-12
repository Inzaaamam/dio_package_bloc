
import 'package:dio/dio.dart';
import 'package:dio_fatch_bloc/dio/model_class.dart';

class DioRepositry {
  Dio dio = Dio();

  Future<List<DioModelClass>> fetchData() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/comments?postId=1');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => DioModelClass.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
}}}