import 'package:module_model/module_model.dart';

abstract class PhotoState {}

class PhotoEmptyState extends PhotoState{}
class PhotoLoadingState extends PhotoState{}

class PhotoLoadedState extends PhotoState{
  List<Photos> loadedPhotos;
  PhotoLoadedState({
    required this.loadedPhotos,
  });
}

class PhotoErrorState extends PhotoState{}