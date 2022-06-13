
import 'package:module_data/module_data.dart';
import 'package:module_model/module_model.dart';

class PhotoRepository {
  final PhotoProvider _photoProvider = PhotoProvider();
  Future<List<Photos>> getAllPhotos() => _photoProvider.getPhotos();
}