import 'package:bloc/bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/user_details.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit(this.getUserDetailsUseCase) : super(UserDetailsInitial());
  final GetUserDetailsUseCase getUserDetailsUseCase;

  Future<void> loadUserInfo() async {
    try {
      final UserEntity user = await getUserDetailsUseCase.execute();
      emit(UserDetailsLoaded(user));
    } catch (e) {
      emit(UserDetailsError(e.toString()));
    }
  }
}

abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  UserDetailsLoaded(this.user);

  final UserEntity user;
}

class UserDetailsError extends UserDetailsState {
  UserDetailsError(this.errorMessage);

  final String errorMessage;
}
