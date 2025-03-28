// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../models/zikr_category.dart';
// import '../../widgets/common/custom_app_bar.dart';
// import '../../widgets/zikr_detail/zikr_item_card.dart';
// import 'zikr_details_controller.dart';

// class ZikrDetailsScreen extends StatelessWidget {
//   final ZikrCategory category;

//   const ZikrDetailsScreen({Key? key, required this.category}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create:
//           (_) => ZikrDetailsController(
//             category: category,
//             zikrService: Provider.of(context, listen: false),
//           ),
//       child: Scaffold(
//         appBar: CustomAppBar(title: category.name),
//         body: Consumer<ZikrDetailsController>(
//           builder: (context, controller, _) {
//             return Column(
//               children: [
//                 _buildHeader(context, controller),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: category.items.length,
//                     itemBuilder: (context, index) {
//                       final item = category.items[index];
//                       return ZikrItemCard(
//                         zikrItem: item,
//                         onCompleted: (completed) {
//                           controller.updateItemStatus(item, completed);
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context, ZikrDetailsController controller) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Text(
//             category.arabicName,
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           LinearProgressIndicator(
//             value: category.completionPercentage / 100,
//             backgroundColor: Colors.grey[300],
//             valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
//           ),
//           SizedBox(height: 4),
//           Text(
//             '${category.completedCount}/${category.totalCount} completed',
//             style: TextStyle(color: Colors.grey[600]),
//           ),
//         ],
//       ),
//     );
//   }
// }
