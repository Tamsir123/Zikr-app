// // lib/services/zikr_service.dart
// import 'package:flutter/material.dart'; // Added import for Icons
// import '../models/zikr_category.dart';
// import '../models/zikr_item.dart';

// class ZikrService {
//   // Mock data - in real app, this would come from a database
//   List<ZikrCategory> getZikrCategories() {
//     return [
//       ZikrCategory(
//         id: '1',
//         name: 'Morning Adhkar',
//         arabicName: 'أذكار الصباح',
//         completedCount: 124,
//         totalCount: 200,
//         icon: Icons.wb_sunny,
//         items: _getMorningAdhkarItems(),
//       ),
//       ZikrCategory(
//         id: '2',
//         name: 'Evening Adhkar',
//         arabicName: 'أذكار المساء',
//         completedCount: 87,
//         totalCount: 150,
//         icon: Icons.nights_stay,
//         items: _getEveningAdhkarItems(),
//       ),
//     ];
//   }

//   List<ZikrItem> _getMorningAdhkarItems() {
//     return [
//       ZikrItem(
//         id: '1',
//         arabicText: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
//         translation: 'Glory be to Allah and Praise be to Him',
//         description: 'Morning remembrance of Allah',
//         isCompleted: false, // Added default value
//       ),
//       // Add more morning zikr items
//     ];
//   }

//   List<ZikrItem> _getEveningAdhkarItems() {
//     return [
//       ZikrItem(
//         id: '1',
//         arabicText:
//             'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
//         translation:
//             'I seek refuge in Allah\'s perfect words from the evil of what He has created',
//         description: 'Evening protection prayer',
//         isCompleted: false, // Added default value
//       ),
//       // Add more evening zikr items
//     ];
//   }

//   int getTotalZikrCount() {
//     // Return the total count of completed zikrs
//     return 211; // This would be calculated based on completed zikrs in a real app
//   }

//   void updateZikrItemStatus(ZikrItem item, bool completed) {
//     item.isCompleted = completed;
//     // In a real app, sync with backend or local storage
//   }
// }
