import 'package:e_commerce/core/app_assets.dart';

class ProductModel {
  final String name;
  final String img;
  final double price;
  final String despcription;

  ProductModel({
    required this.name,
    required this.img,
    required this.price,
    required this.despcription,
  });


  static List<ProductModel> products = [
    ProductModel(name: 'October', img: AppAssets.imgProduct1, price: 130, despcription: 'Reversible Angora Aardigan'),
    ProductModel(name: 'October', img: AppAssets.imgProduct2, price: 198, despcription: 'Reversible Angora Aardigan'),
    ProductModel(name: 'October', img: AppAssets.imgProduct3, price: 133, despcription: 'Reversible Angora Aardigan'),
    ProductModel(name: 'October', img: AppAssets.imgProduct4, price: 392, despcription: 'Reversible Angora Aardigan'),
    ProductModel(name: 'October', img: AppAssets.imgProduct5, price: 99, despcription: 'Reversible Angora Aardigan'),
    ProductModel(name: 'October', img: AppAssets.imgProduct6, price: 520, despcription: 'Reversible Angora Aardigan'),

  ];
}


