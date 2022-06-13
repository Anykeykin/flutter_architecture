
import 'package:module_domain/module_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhotoBloc _photoBloc = BlocProvider.of<PhotoBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            _photoBloc.add(PhotoLoadEvent());
          },
          child: Text('Загрузить'),
          style: ElevatedButton.styleFrom(
              primary: Colors.green
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        ElevatedButton(
          onPressed: () {
            _photoBloc.add(PhotoClearEvent());
          },
          child: Text('Очистить'),
          style: ElevatedButton.styleFrom(
              primary: Colors.red
          ),
        ),
      ],
    );
  }
}
