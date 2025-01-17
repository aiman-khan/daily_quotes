import 'package:daily_quotes/features/quote/domain/models/photo/photo_entity.dart';
import 'package:daily_quotes/features/quote/domain/models/photo_url/photo_url_model.dart';

class PhotoModel {
  final PhotoUrlModel urls;

  PhotoModel({required this.urls});

  factory PhotoModel.fromEntity(PhotoEntity entity) {
    return PhotoModel(urls: PhotoUrlModel.fromEntity(entity.urls!));
  }
}
