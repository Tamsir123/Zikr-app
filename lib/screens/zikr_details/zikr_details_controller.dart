// import 'package:flutter/material.dart';
// import '../../models/zikr_category.dart';
// import '../../models/zikr_item.dart';
// import '../../services/zikr_service.dart';

// class ZikrDetailsController extends ChangeNotifier {
//   final ZikrCategory category;
//   final ZikrService zikrService;

//   ZikrDetailsController({required this.category, required this.zikrService});

//   void updateItemStatus(ZikrItem item, bool completed) {
//     zikrService.updateZikrItemStatus(item, completed);

//     // Update category completion count
//     if (completed && !item.isCompleted) {
//       category.completedCount++;
//     } else if (!completed && item.isCompleted) {
//       category.completedCount--;
//     }

//     notifyListeners();
//   }
// }
