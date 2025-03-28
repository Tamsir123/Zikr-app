// import 'package:flutter/material.dart';
// import '../../core/constants/app_colors.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final List<Widget>? actions;
//   final bool showBackButton;
//   final Color backgroundColor;
//   final Color textColor;

//   const CustomAppBar({
//     Key? key,
//     required this.title,
//     this.actions,
//     this.showBackButton = true,
//     this.backgroundColor = AppColors.primary,
//     this.textColor = AppColors.white,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: backgroundColor,
//       elevation: 0,
//       centerTitle: true,
//       title: Text(
//         title,
//         style: TextStyle(
//           color: textColor,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       leading:
//           showBackButton
//               ? IconButton(
//                 icon: Icon(Icons.arrow_back, color: textColor),
//                 onPressed: () => Navigator.of(context).pop(),
//               )
//               : null,
//       actions: actions,
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(56.0);
// }
