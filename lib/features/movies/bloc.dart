import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_login_regsister/core/logic/constants.dart';
import 'package:flutter_login_regsister/core/logic/dio_helper2.dart';

part 'states.dart';
part 'events.dart';
part 'model.dart';

class MoviesBloc extends Bloc<MoviesEvents,MoviesStates>{
  MoviesBloc():super(MoviesStates()){
    on<GetMoviesDataEvent>(_getMovieData);
  }

  List<MovieModel> _list=[];
  int currentPage=1;
  bool isLoading=true;
  bool isPagination=false;



  Future<void> _getMovieData(GetMoviesDataEvent event, Emitter<MoviesStates> emit) async {
    if(isLoading){
      isLoading=false;
      isPagination=true;
      emit(MoviesLoadingState());
    }else if(isPagination){
      emit(MoviesPaginationState(msg: "More data is loading ..."));
    }
    
    final response=await DioHelper2.get("discover/movie",data: {
      "api_key":Constants.Movies_Api_Key,
      "page":currentPage
    });

    if(response.isSucess){
      final model=MoviesData.fromJson(response.data);

      //if(model.totalPages > currentPage){
      if(5 > currentPage){
        currentPage++;
        _list.addAll(model.movies);
        emit(MoviesSuccessState(movieList: _list));
      }else{
        emit(MoviesPaginationFinishedState(msg: "No more data!"));
      }
    }else{
      print("Error:- ${response.msg}");
      emit(MoviesFailedState(msg: response.msg));
    }
  }
}