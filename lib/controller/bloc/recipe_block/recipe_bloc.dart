import 'package:bloc_app/controller/api/productapi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'recipe_event.dart';
import 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final ApiService apiService;

  RecipeBloc(this.apiService) : super(RecipeInitial()) {
    on<FetchRecipes>(_onFetchRecipes);
  }

  Future<void> _onFetchRecipes(
      FetchRecipes event, Emitter<RecipeState> emit) async {
    emit(RecipeLoading());
    try {
      final recipes = await apiService.fetchRecipes();
      emit(RecipeLoaded(recipes));
    } catch (e) {
      emit(RecipeError("Failed to load recipes"));
    }
  }
}
