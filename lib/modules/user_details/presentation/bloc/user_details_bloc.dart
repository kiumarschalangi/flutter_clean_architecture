import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_module/modules/user_details/domain/entities/user_entity.dart';

import '../../domain/usecases/user_details.dart';
import 'user_details_event.dart';
import 'user_details_state.dart';

class UserInfoBloc extends Bloc<GetUserInfoEvent, UserInfoState> {
  UserInfoBloc({required this.getUserInfo}) : super(UserInfoLoadingState()) {
    on<GetUserInfoEvent>(_onGetUserInfoEvent);
  }
  final GetUserInfo getUserInfo;

  Future<void> _onGetUserInfoEvent(
      GetUserInfoEvent event, Emitter<UserInfoState> emit) async {
    try {
      final UserEntity user = await getUserInfo.execute();
      emit(UserInfoLoadedState(user: user));
    } catch (e) {
      emit(UserInfoErrorState());
    }
  }
}
