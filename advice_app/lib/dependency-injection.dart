import 'package:advice_app/application/pages/advice/bloc/advice_bloc.dart';
import 'package:advice_app/data/data%20source/advice.remote.datasource.dart';
import 'package:advice_app/data/repositories%20impl/advice.repository.impl.dart';
import 'package:advice_app/domain/usecases/advice.usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
// ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory(() => AdviceBloc(adviceUseCases: sl()));

// ! domain Layer
  sl.registerFactory(() => AdviceUseCases(adviceRepository: sl()));

// ! data Layer
  sl.registerFactory<AdviceRepositoryImpl>(
          () => AdviceRepositoryImpl(adviceRemoteDataSource: sl()));
  sl.registerFactory<AdviceRemoteDataSourceImpl>(
          () => AdviceRemoteDataSourceImpl(client: sl()));

// ! externs
  sl.registerFactory(() => http.Client());
}
