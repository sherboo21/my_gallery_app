class MyGalleryDataModel {
  String? status;
  Data? data;
  String? message;

  MyGalleryDataModel({this.status, this.data, this.message});

  MyGalleryDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  List<String>? images;

  Data({this.images});

  Data.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
  }
}