import 'package:get_it/get_it.dart';
import 'package:new_test/core/util/pdf_helper.dart';
import 'package:new_test/core/util/share_helper.dart';
import 'package:new_test/data/repositories/user_repository_impl.dart';
import 'package:new_test/domain/repositories/user_repository.dart';
import 'package:new_test/domain/usecases/save_user_data_usecase.dart';
import 'package:new_test/domain/usecases/share_user_data_usecase.dart';
import 'package:new_test/presentation/user_register/cubit/user_cubit.dart';

final locator = GetIt.I;

Future<void> setup() async {
  //Presentation Layer
  locator.registerFactory<UserCubit>(
    () => UserCubit(
      saveUserDataUseCase: locator<SaveUserDataUseCase>(),
      shareUserDataUseCase: locator<ShareUserDataUseCase>(),
    ),
  );

  //Domain Layer
  locator.registerLazySingleton(
    () => SaveUserDataUseCase(
      repository: locator<UserRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => ShareUserDataUseCase(
      repository: locator<UserRepository>(),
    ),
  );

  //Data Layer
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      pdfHelper: locator<PdfHelper>(),
      shareHelper: locator<ShareHelper>(),
    ),
  );

  //External
  locator.registerLazySingleton<PdfHelper>(() => PdfHelper());
  locator.registerLazySingleton<ShareHelper>(() => ShareHelper());
}
