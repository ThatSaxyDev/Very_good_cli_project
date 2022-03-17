import 'package:bloc/bloc.dart';
import 'package:very_good_cli_project/model/kiishi_model.dart';
import 'package:very_good_cli_project/services/the_api_service.dart';

class TheAppCubit extends Cubit<List<Kiishi>> {
  TheAppCubit() : super([]);
  final _theApiService = TheApiService();

  void get favourite  => emit( _theApiService.getData());
  //void get favourite => emit( _theAppService.getData());

}
