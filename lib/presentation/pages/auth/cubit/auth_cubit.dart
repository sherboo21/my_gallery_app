import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery_app/network/models/userData.dart';

import '../../../../core/shared_preferences.dart';
import '../../../../network/remote/app_services.dart';
import '../../../../network/remote/dio.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  // Auth Login Function //

UserDataModel userDataModel = UserDataModel();
  void logIn({
    required String email,
    required String password
  }) async {
    try {
      emit(LogInLoadingState());
      Response response = await DioHelper.postData(
        url: AppServices.loginUrl,
        body: {
          'email': email,
          'password': password
        },
      );
      if (response.statusCode == 200) {
        userDataModel = UserDataModel.fromJson(response.data);
        print(response.data.toString());
        prefs.setString('token', response.data['token']);
        prefs.setBool('isLogin', true);
        emit(LogInSuccessState());
      }
    } on DioError catch (messageError) {
      print(messageError.toString());
      emit(LogInErrorState(error: messageError.toString()));
    }
  }

}
