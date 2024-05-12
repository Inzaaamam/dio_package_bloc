
import 'package:dio_fatch_bloc/bloc/api_dio_bloc.dart';
import 'package:dio_fatch_bloc/bloc/api_dio_event.dart';
import 'package:dio_fatch_bloc/fatch_api_data/utail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio_fatch_bloc/bloc/api_dio_state.dart';
import 'package:dio_fatch_bloc/dio/model_class.dart';

class DioScrren extends StatefulWidget {
  const DioScrren({super.key});

  @override
  State<DioScrren> createState() => _DioScrrenState();
}

class _DioScrrenState extends State<DioScrren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DioBloc>().add(const  FatchedData());
  }
  @override
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Dio Data'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.refresh),
        onPressed: (){
        context.read<DioBloc>().add(const  FatchedData());
      }, ),
      body: BlocBuilder<DioBloc, DioState>(
        builder: (context, state) {
          if (state.status == PostStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == PostStatus.sucess) {
            return ListView.builder(
              itemCount: state.posts!.length,
              itemBuilder: (context, index) {
                DioModelClass post = state.posts![index];
                return Card(
                  child: ListTile(
                    title: Column(children: [
                       Text(post.id.toString()),
                       Text(post.name.toString()),
                     Text(post.email.toString()),
                     Text(post.body.toString()),
                    ],)
                    
                    // You can display other fields of the model here
                  ),
                );
              },
            );
          } else if (state.status == PostStatus.fail) {
            return Center(
              child: Text('Failed to load data: ${state.error}'),
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
