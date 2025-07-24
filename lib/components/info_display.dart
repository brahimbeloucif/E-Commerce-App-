import 'package:e_commerce/components/custom_text.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class InfoDisplay extends StatelessWidget {
  const InfoDisplay({super.key, this.savedData, this.onTap});
  final dynamic savedData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return           GestureDetector(
                           onTap: onTap,
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      name:
                                          '${savedData['first'] + '  '+savedData['last']}'
                                              .toUpperCase(),
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                    const Gap(8),
                                    CustomText(
                                      name: '${savedData['address']}',
                                      size: 16,
                                      color: AppColors.orderGreyColor,
                                    ),
                                    const Gap(4),
                                    CustomText(
                                      name:
                                          '${savedData['city'] + '\t\tZip Code:' + savedData['zip']}',
                                      size: 16,
                                      color: AppColors.orderGreyColor,
                                    ),
                                    const Gap(4),
                                    CustomText(
                                      name: '${savedData['state']}',
                                      size: 16,
                                      color: AppColors.orderGreyColor,
                                    ),
                                    const Gap(4),
                                    CustomText(
                                      name: '${savedData['phone']}',
                                      size: 16,
                                      color: AppColors.orderGreyColor,
                                    ),
                                  ],
                                ),
                                
                                        SvgPicture.asset(
                                          AppAssets.svgArrow,
                                          width: 28,
                                        ),
                                      
                              ],
                            ),
                         )
                    ;
  }
}