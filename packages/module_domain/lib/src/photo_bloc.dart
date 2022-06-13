
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_data/module_data.dart';
import 'package:module_domain/module_domain.dart';
import 'package:module_model/module_model.dart';

class PhotoBloc extends Bloc<PhotoEvent,PhotoState> {
  final PhotoRepository photoRepository;

  PhotoBloc({required this.photoRepository}) : super(PhotoEmptyState()) {
   on<PhotoLoadEvent>((event, emit) async {
     emit(PhotoLoadingState());

     try {
       final List<Photos> loadedPhotoList = await photoRepository.getAllPhotos();
       emit(PhotoLoadedState(loadedPhotos: loadedPhotoList));
     } catch (_) {
       emit(PhotoErrorState());
     }
   });
   on<PhotoClearEvent>((event, emit) async {
     emit(PhotoEmptyState());
   });
  }

}