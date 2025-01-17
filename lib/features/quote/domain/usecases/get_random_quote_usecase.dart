import 'package:daily_quotes/features/quote/domain/models/photo/photo_entity.dart';
import 'package:daily_quotes/features/quote/domain/models/photo/photo_model.dart';
import 'package:daily_quotes/features/quote/domain/repository/auth_repository.dart';
import 'package:daily_quotes/infrastructure/usecase.dart';
import 'package:daily_quotes/infrastructure/usecase_input.dart';
import 'package:daily_quotes/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetRandomPhotoUsecaseInput extends Input {
  GetRandomPhotoUsecaseInput();
}

class GetRandomPhotoUsecaseOutput extends Output {
  GetRandomPhotoUsecaseOutput({required PhotoEntity photo}) : _photo = photo;

  final PhotoEntity _photo;

  PhotoModel get photo => PhotoModel.fromEntity(_photo);
}

@lazySingleton
class GetRandomPhotoUsecase
    extends Usecase<GetRandomPhotoUsecaseInput, GetRandomPhotoUsecaseOutput> {
  final AuthRepository _authRepository;

  GetRandomPhotoUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<GetRandomPhotoUsecaseOutput> call(
      GetRandomPhotoUsecaseInput input) async {
    return await _authRepository.getRandomPhoto(input);
  }
}
