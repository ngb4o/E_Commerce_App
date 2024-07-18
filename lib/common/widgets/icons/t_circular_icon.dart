import 'package:ee_commerce_app/utils/constants/sizes.dart';
import 'package:ee_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.sizeIcon = TSizes.lg,
    required this.icon,
    this.colorIcon,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, sizeIcon;
  final IconData icon;
  final Color? colorIcon;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: colorIcon,
          size: sizeIcon,
        ),
      ),
    );
  }
}
