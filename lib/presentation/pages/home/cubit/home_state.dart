part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

// Get My Gallery State //

class GetMyGalleryLoadingState extends HomeState{}
class GetMyGallerySuccessState extends HomeState{}
class GetMyGalleryErrorState extends HomeState {
  String error;

  GetMyGalleryErrorState({
    required this.error
  });
}

  // Upload Picture State //

  class UploadPictureLoadingState extends HomeState{}
  class UploadPictureSuccessState extends HomeState{}
  class UploadPictureErrorState extends HomeState{
  String error;
  UploadPictureErrorState({
  required this.error
  });
}