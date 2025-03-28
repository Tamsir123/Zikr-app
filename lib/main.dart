// Project Structure:
// lib/
//   ├── main.dart
//   ├── core/
//   │   ├── constants/
//   │   │   ├── app_colors.dart
//   │   │   ├── app_styles.dart
//   │   │   └── app_constants.dart
//   │   └── theme/
//   │       └── app_theme.dart
//   ├── models/
//   │   ├── zikr_category.dart
//   │   ├── leaderboard_user.dart
//   │   └── zikr_item.dart
//   ├── screens/
//   │   ├── home_screen.dart
//   │   ├── zikr_detail_screen.dart
//   │   ├── leaderboard_screen.dart
//   │   ├── profile_screen.dart
//   │   └── settings_screen.dart
//   ├── widgets/
//   │   ├── custom_app_bar.dart
//   │   ├── zikr_category_card.dart
//   │   ├── quote_card.dart
//   │   ├── total_zikr_card.dart
//   │   └── leaderboard_user_card.dart
//   └── services/
//       ├── zikr_service.dart
//       └── user_service.dart

// lib/core/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF2ECC71);
  static const Color secondaryGreen = Color(0xFF27AE60);
  static const Color backgroundColor = Color(0xFFF4F6F7);
  static const Color textColor = Color(0xFF2C3E50);
  static const Color cardBackground = Colors.white;
  static const Color shadowColor = Colors.black12;
}

// lib/core/constants/app_styles.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static final TextStyle arabicTextStyle = TextStyle(
    fontFamily: 'Amiri',
    fontSize: 32,
    color: AppColors.primaryGreen,
    shadows: [
      Shadow(
        offset: const Offset(0, 1),
        blurRadius: 1.0,
        color: Colors.black.withOpacity(0.3),
      ),
    ],
  );

  static final TextStyle headerStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static final TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: AppColors.textColor.withOpacity(0.7),
  );
}

// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryGreen,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Poppins',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryGreen),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// lib/models/zikr_category.dart
import 'package:flutter/material.dart';

class ZikrCategory {
  final String id;
  final String name;
  final String arabicName;
  final int completedCount;
  final int totalCount;
  final IconData icon;
  final List<ZikrItem> items;

  ZikrCategory({
    required this.id,
    required this.name,
    required this.arabicName,
    required this.completedCount,
    required this.totalCount,
    required this.icon,
    required this.items,
  });
}

// lib/models/zikr_item.dart
class ZikrItem {
  final String id;
  final String arabicText;
  final String translation;
  final String description;
  bool isCompleted;

  ZikrItem({
    required this.id,
    required this.arabicText,
    required this.translation,
    required this.description,
    this.isCompleted = false,
  });
}

// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/total_zikr_card.dart';
import '../widgets/quote_card.dart';
import '../widgets/zikr_category_card.dart';
import 'zikr_detail_screen.dart';
import '../models/zikr_category.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ZikrCategory> _zikrCategories;

  @override
  void initState() {
    super.initState();
    _zikrCategories = _generateZikrCategories();
  }

  List<ZikrCategory> _generateZikrCategories() {
    return [
      ZikrCategory(
        id: '1',
        name: 'Morning Adhkar',
        arabicName: 'أذكار الصباح',
        completedCount: 124,
        totalCount: 200,
        icon: Icons.wb_sunny,
        items: [], // Add actual zikr items
      ),
      // Similar entries for other categories
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TotalZikrCard(totalZikrCount: 3460),
            QuoteCard(),
            _buildZikrCategoriesSection(),
            _buildCommunityLeaderboardSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildZikrCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Zikr Categories',
            style: AppStyles.headerStyle,
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _zikrCategories.length,
            itemBuilder: (context, index) {
              final category = _zikrCategories[index];
              return ZikrCategoryCard(
                category: category,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZikrDetailScreen(category: category),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Rest of the code remains similar to the original implementation
}

// lib/screens/zikr_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/zikr_category.dart';
import '../models/zikr_item.dart';

class ZikrDetailScreen extends StatefulWidget {
  final ZikrCategory category;

  const ZikrDetailScreen({Key? key, required this.category}) : super(key: key);

  @override
  _ZikrDetailScreenState createState() => _ZikrDetailScreenState();
}

class _ZikrDetailScreenState extends State<ZikrDetailScreen> {
  late List<ZikrItem> _zikrItems;

  @override
  void initState() {
    super.initState();
    // Fetch or generate zikr items for the specific category
    _zikrItems = _generateZikrItems();
  }

  List<ZikrItem> _generateZikrItems() {
    return [
      ZikrItem(
        id: '1',
        arabicText: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
        translation: 'Glory be to Allah and Praise be to Him',
        description: 'A zikr of morning to remember Allah',
      ),
      // Add more zikr items
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: ListView.builder(
        itemCount: _zikrItems.length,
        itemBuilder: (context, index) {
          final zikrItem = _zikrItems[index];
          return _buildZikrItemCard(zikrItem);
        },
      ),
    );
  }

  Widget _buildZikrItemCard(ZikrItem zikrItem) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          zikrItem.arabicText,
          style: TextStyle(fontFamily: 'Amiri'),
        ),
        subtitle: Text(zikrItem.translation),
        trailing: Checkbox(
          value: zikrItem.isCompleted,
          onChanged: (bool? value) {
            setState(() {
              zikrItem.isCompleted = value ?? false;
            });
          },
        ),
      ),
    );
  }
}

// Additional screens and widgets to be implemented similarly
// (Leaderboard, Profile, Settings, etc.)