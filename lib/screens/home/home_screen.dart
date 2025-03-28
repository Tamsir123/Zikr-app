// // lib/screens/home/home_screen.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../services/zikr_service.dart';
// import '../../core/constants/app_styles.dart';
// import '../../widgets/home/total_zikr_card.dart';
// import '../../widgets/home/quote_card.dart';
// import '../../widgets/home/zikr_category_card.dart';
// import '../../widgets/common/bottom_navigation.dart';
// import '../../screens/zikr_details/zikr_details_screen.dart'; // Fixed import path
// import 'home_screen_controller.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create:
//           (_) => HomeScreenController(
//             zikrService: Provider.of<ZikrService>(context, listen: false),
//           ),
//       child: Scaffold(
//         body: Consumer<HomeScreenController>(
//           builder: (context, controller, child) {
//             return SafeArea(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildAppBar(),
//                     TotalZikrCard(totalZikrCount: controller.totalZikrCount),
//                     const QuoteCard(), // Add 'const' to correctly instantiate the widget
//                     _buildZikrCategoriesSection(context, controller),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//         bottomNavigationBar: CustomBottomNavigation(),
//       ),
//     );
//   }

//   Widget _buildAppBar() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('Zikr Tracker', style: AppStyles.headerStyle),
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               // Implement notifications
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildZikrCategoriesSection(
//     BuildContext context,
//     HomeScreenController controller,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Text('Zikr Categories', style: AppStyles.headerStyle),
//         ),
//         SizedBox(
//           height: 180,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: controller.zikrCategories.length,
//             itemBuilder: (context, index) {
//               final category = controller.zikrCategories[index];
//               return ZikrCategoryCard(
//                 category: category,
//                 onTap:
//                     () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder:
//                             (context) => ZikrDetailsScreen(category: category),
//                       ),
//                     ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
