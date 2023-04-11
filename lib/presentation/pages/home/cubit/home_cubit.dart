import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery_app/network/models/myGallery.dart';

import '../../../../core/shared_preferences.dart';
import '../../../../network/remote/app_services.dart';
import '../../../../network/remote/dio.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


  // Get My Gallery Cubit //

  MyGalleryDataModel myGalleryDataModel = MyGalleryDataModel();
  void getMyGallery() async{
    try {
      emit(GetMyGalleryLoadingState());
      Response response = await DioHelper.getData(
        url: AppServices.myGallery,
        token: prefs.getString('token'),
      );
      if (response.statusCode == 200) {
        myGalleryDataModel = MyGalleryDataModel.fromJson(response.data);
        print(response.data.toString());
        emit(GetMyGallerySuccessState());
      }
    } on DioError catch (messageError) {
      print(messageError.toString());
      emit(GetMyGalleryErrorState(error: messageError.toString()));
    }
  }

  // Upload Picture Cubit //

  void uploadPicture({
    required String imagePath
}) async{
    try {
      var data = FormData.fromMap({
        'img' : await MultipartFile.fromFile(imagePath)
      });
      emit(UploadPictureLoadingState());
      Response response = await DioHelper.postData(
        url: AppServices.uploadPicture,
        token: prefs.getString('token'),
        body: data

      );
      if (response.statusCode == 200) {
        print(response.data.toString());
        emit(UploadPictureSuccessState());
      }
    } on DioError catch (messageError) {
      print(messageError.toString());
      emit(UploadPictureErrorState(error: messageError.toString()));
    }
  }
}
