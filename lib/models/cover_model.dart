import 'package:e_commerce/core/app_assets.dart';

class CoverModel {
  final String label , img;

  CoverModel({required this.label, required this.img});

  static List<CoverModel> covers = [
    CoverModel(label: 'Black collection', img: AppAssets.imgCover3),
    CoverModel(label: 'HAE BY HAEKIM', img: AppAssets.imgCover2),
    CoverModel(label: 'White collection', img: AppAssets.imgCover1),
  ];
}