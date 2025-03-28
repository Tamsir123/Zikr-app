// import 'package:flutter/material.dart';
// import '../../models/zikr_category.dart';
// import '../../services/zikr_service.dart';

// class HomeScreenController extends ChangeNotifier {
//   final ZikrService zikrService;

//   late List<ZikrCategory> _zikrCategories;
//   int _totalZikrCount = 0;

//   HomeScreenController({required this.zikrService}) {
//     _loadData();
//   }

//   List<ZikrCategory> get zikrCategories => _zikrCategories;
//   int get totalZikrCount => _totalZikrCount;

//   void _loadData() {
//     _zikrCategories = zikrService.getZikrCategories();
//     _totalZikrCount = zikrService.getTotalZikrCount();
//     notifyListeners();
//   }

//   void refreshData() {
//     _loadData();
//   }
// }
