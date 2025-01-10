import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/darekThem/bloc/event.dart';
import 'package:untitled/darekThem/bloc/state.dart';

class BlocThemsFilse extends Bloc<BlocEventThems,BlocSateThems>{

  BlocThemsFilse() : super(BlocSateThems(isSelectedLight: false)){
    on<LightThems>((event, emit) {
      emit(BlocSateThems(isSelectedLight: false));
    },);

    on<DarkThems>((event, emit) {
      emit(BlocSateThems(isSelectedLight: true));
    },);
  }
}