import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery_app/config/theme/app_theme.dart';
import 'package:my_gallery_app/core/constants.dart';
import 'package:my_gallery_app/core/main_functions.dart';
import 'package:my_gallery_app/presentation/pages/home/components/home_alert_content.dart';
import 'package:my_gallery_app/presentation/pages/home/components/home_buttons.dart';
import 'package:my_gallery_app/presentation/pages/home/components/home_item.dart';
import 'package:my_gallery_app/presentation/pages/home/cubit/home_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'components/home_header.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scrollController = ScrollController();

  String image = '';
   int _selectedIndex = 0;

  selectImageFromGallery() async{
    XFile? file = await ImagePicker().pickImage(source: _selectedIndex == 0 ?
    ImageSource.gallery : ImageSource.camera
    );
    setState(() {
      if(file != null){
        image =  file.path;
      } else{
        image = '';
      }
      HomeCubit.get(context).uploadPicture(imagePath: image);
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getMyGallery();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          AppLinks.homeBackgroundImage
                      ),
                      fit: BoxFit.fill
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const HomeHeader(),
                    AppSize.h15.ph,
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: AppSize.w20
                        ),
                        child: Column(
                          children: [
                           HomeButtons(
                               uploadFunction: ()=>customAlertDialog(
                                   context: context,
                                   dialogType: DialogType.noHeader,
                                   content:  ListView.separated(
                                     shrinkWrap: true,
                                     itemCount: 2,
                                     itemBuilder: (context , index) =>HomeAlertContent(
                                         function: (){
                                           setState(() {
                                             _selectedIndex = index;
                                           });
                                           selectImageFromGallery();
                                         },
                                         index: index
                                     ),
                                     separatorBuilder: (context , index)=>AppSize.h30.ph,
                                   )
                               )
                           ),
                            AppSize.h30.ph,
                            BlocConsumer<HomeCubit, HomeState>(
                             listener: (context, state) {
                               if(state is UploadPictureSuccessState) {
                                 HomeCubit.get(context).getMyGallery();
                               }
                             },
                              builder: (context, state) {
                               var homeCubit = HomeCubit.get(context);
                               var myGalleryDataModel = homeCubit.myGalleryDataModel.data;
                               return ConditionalBuilder(
                                 condition: state is! GetMyGalleryLoadingState && myGalleryDataModel != null,
                                 builder: (context) => GridView.builder(
                                     physics: const ClampingScrollPhysics(),
                                     shrinkWrap: true,
                                     controller: scrollController,
                                     itemCount: myGalleryDataModel!.images!.length,
                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                         crossAxisCount: 3,
                                         mainAxisSpacing: AppSize.h15,
                                         crossAxisSpacing: AppSize.w15,
                                         mainAxisExtent: 100.h
                                     ),
                                     itemBuilder: (context,index) =>HomeItem(
                                         decorationImage: DecorationImage(
                                             image: NetworkImage(
                                                 myGalleryDataModel.images![index]
                                             ),
                                             fit: BoxFit.fill
                                         )
                                     )
                                 ),
                                 fallback: (context) =>Padding(
                                   padding:  EdgeInsets.symmetric(
                                     vertical: 240.h
                                   ),
                                   child: CupertinoActivityIndicator(
                                     radius: 15.r,
                                   ),
                                 ),
                               );
                             },
                           ),
                          ],
                        ),
                      ),
                    ),
                  ),
                    100.h.ph
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
