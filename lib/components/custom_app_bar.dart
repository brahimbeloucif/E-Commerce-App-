import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.isBlack});
  final bool isBlack;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: isBlack ? AppColors.primaryColor : Colors.white,
      leadingWidth: 48,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SvgPicture.asset(
          AppAssets.svgMenu,
          color: isBlack ? Colors.white : AppColors.primaryColor,
        ),
      ),
      title: SvgPicture.asset(
        AppAssets.svgLogoBg,
        color: isBlack ? Colors.white : AppColors.primaryColor,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SvgPicture.asset(
            AppAssets.svgSearch,
            color: isBlack ? Colors.white : AppColors.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SvgPicture.asset(
            AppAssets.svgShoppingBag,
            color: isBlack ? Colors.white : AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
