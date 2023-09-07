// import 'package:bloc/bloc.dart';

// import '../../domain/entities/user_entity.dart';
// import '../../domain/usecases/user_details.dart';

// class UserDetailsCubit extends Cubit<UserDetailsState> {
//   UserDetailsCubit(this.getUserDetailsUseCase) : super(UserDetailsInitial());
//   final GetUserDetailsUseCase getUserDetailsUseCase;

//   Future<void> loadUserInfo() async {
//     try {
//       final UserEntity user = await getUserDetailsUseCase.execute();
//       emit(UserDetailsLoaded(user));
//     } catch (e) {
//       emit(UserDetailsError(e.toString()));
//     }
//   }
// }

// abstract class UserDetailsState {}

// class UserDetailsInitial extends UserDetailsState {}

// class UserDetailsLoaded extends UserDetailsState {
//   UserDetailsLoaded(this.user);

//   final UserEntity user;
// }

// class UserDetailsError extends UserDetailsState {
//   UserDetailsError(this.errorMessage);

//   final String errorMessage;
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_module/modules/user_details/domain/entities/user_entity.dart';

import '../../domain/usecases/user_details.dart';

abstract class UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final UserEntity user;

  UserInfoLoaded({required this.user});
}

class UserInfoError extends UserInfoState {}

class UserInfoEvent {}

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final GetUserInfo getUserInfo;

  UserInfoBloc({required this.getUserInfo}) : super(UserInfoLoading());

  @override
  Stream<UserInfoState> mapEventToState(UserInfoEvent event) async* {
    try {
      final UserEntity user = await getUserInfo.execute();
      yield UserInfoLoaded(user: user);
    } catch (e) {
      yield UserInfoError();
    }
  }
}
