import 'package:flutter_architecture/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_data/module_data.dart';
import 'package:module_domain/module_domain.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final photoRepository = PhotoRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc(photoRepository: photoRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Photo List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Buttons(),
            Expanded(
                child: PhotoList()
            )
          ],
        ),
      ),
    );
  }
}
