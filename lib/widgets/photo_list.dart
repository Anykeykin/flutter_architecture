import 'package:module_domain/module_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (BuildContext context, state) {
        if(state is PhotoEmptyState) {
          return Center(
              child: Text('Нет данных. Нажмите "Загрузить"', style: TextStyle(fontSize: 20),)
          );
        }
        if (state is PhotoLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is PhotoLoadedState) {
          return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.deepPurple[50],
                child: ListTile(
                  leading:CircleAvatar(
                    child: Image.network('${state.loadedPhotos[index].url}'),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Text(
                            'title: ${state.loadedPhotos[index].title}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'id: ${state.loadedPhotos[index].id}',
                            style: TextStyle(
                                fontStyle: FontStyle.italic
                            ),
                          ),
                    ],
                  ),
                ),
              )
          );
        }
        if (state is PhotoErrorState) {
          return Center(child: Text('Ошибка запроса фото', style: TextStyle(fontSize: 20.0),));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
