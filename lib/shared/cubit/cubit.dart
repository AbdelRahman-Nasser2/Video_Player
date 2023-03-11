import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videoplayer/shared/cubit/states.dart';
import 'package:videoplayer/shared/network/remote/end_points.dart';
import 'package:videoplayer/shared/network/remote/http_Helper/http.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void getHomeData() {
    emit(HomeGetDataLoading());
    HTTP.getHomeData(HOME).then((value) async {
      // allPokemonsModel = AllPokemonsModelFromJson(value.body);
      emit(HomeGetDataSuccess());
    }).catchError((error) {
      emit(HomeGetDataError(error));
    });
  }

  void getPokemonData(String? url) {
    emit(PokemonGetDataLoading());
    HTTP.getHomeData(url).then((value) async {
      // pokemonModel = PokemonModelFromJson(value.body);
      emit(PokemonGetDataSuccess());
    }).catchError((error) {
      emit(PokemonGetDataError(error));
    });
  }
}
