import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:devquiz/core/core.dart';

class ButtonNextWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback? onTap;

  const ButtonNextWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
  }) : super(key: key);

  ButtonNextWidget.green({required String label, required VoidCallback onTap})
      : backgroundColor = AppColors.darkGreen,
        fontColor = AppColors.white,
        borderColor = AppColors.lightGreen,
        overlayColor = AppColors.darkenGreen,
        onTap = onTap,
        label = label;

  ButtonNextWidget.disabled({required String label})
      : backgroundColor = AppColors.lightGrey,
        fontColor = AppColors.white,
        borderColor = AppColors.lightGrey,
        overlayColor = AppColors.lightGrey,
        onTap = null,
        label = label;

  ButtonNextWidget.white({required String label, required VoidCallback onTap})
      : backgroundColor = AppColors.white,
        fontColor = AppColors.grey,
        borderColor = AppColors.border,
        overlayColor = AppColors.border,
        onTap = onTap,
        label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(overlayColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                side:
                    MaterialStateProperty.all(BorderSide(color: borderColor))),
            onPressed: onTap,
            child: Text(
              label,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600, fontSize: 15, color: fontColor),
            )));
  }
}
