import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Constants
class AppColors {
  static const Color primaryGreen = Color(0xFF2ECC71);
  static const Color secondaryGreen = Color(0xFF27AE60);
  static const Color backgroundColor = Color(0xFFF4F6F7);
  static const Color textColor = Color(0xFF2C3E50);
}

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
}

class ZikrApp extends StatelessWidget {
  const ZikrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primaryGreen,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: ZikrHomeScreen(),
    );
  }
}

class ZikrHomeScreen extends StatefulWidget {
  @override
  _ZikrHomeScreenState createState() => _ZikrHomeScreenState();
}

class _ZikrHomeScreenState extends State<ZikrHomeScreen> {
  int _totalZikrCount = 3460;
  List<ZikrCategory> _zikrCategories = [
    ZikrCategory(
      name: 'Morning Adhkar',
      arabicName: 'أذكار الصباح',
      completedCount: 124,
      totalCount: 200,
      icon: Icons.wb_sunny,
    ),
    ZikrCategory(
      name: 'Evening Adhkar',
      arabicName: 'أذكار المساء',
      completedCount: 87,
      totalCount: 150,
      icon: Icons.nights_stay,
    ),
    ZikrCategory(
      name: 'After Salah',
      arabicName: 'أذكار بعد الصلاة',
      completedCount: 56,
      totalCount: 100,
      icon: Icons.mosque,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTotalZikrHeader(),
            _buildZikrQuoteSection(),
            _buildZikrCategoriesSection(),
            _buildCommunityLeaderboardSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildCustomAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: AppColors.primaryGreen),
        onPressed: () {
          // Open drawer
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: AppColors.primaryGreen),
          onPressed: () {
            // Notifications
          },
        ),
        IconButton(
          icon: Icon(Icons.settings, color: AppColors.primaryGreen),
          onPressed: () {
            // Settings
          },
        ),
      ],
    );
  }

  Widget _buildTotalZikrHeader() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryGreen.withOpacity(0.8),
            AppColors.secondaryGreen.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Zikr Count',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '$_totalZikrCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/icons/zikr_counter.svg',
            width: 80,
            color: Colors.white.withOpacity(0.7),
          ),
        ],
      ),
    );
  }

  Widget _buildZikrQuoteSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '"ذِكْرُ اللَّهِ يُطْمَئِنُّ الْقُلُوبَ"',
            style: AppStyles.arabicTextStyle.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '"Remembrance of Allah brings tranquility to the hearts"',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: AppColors.textColor.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
              return _buildZikrCategoryCard(category);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildZikrCategoryCard(ZikrCategory category) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.icon,
                color: AppColors.primaryGreen,
                size: 30,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              category.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              category.arabicName,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: category.completedCount / category.totalCount,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryGreen),
            ),
            const SizedBox(height: 8),
            Text(
              '${category.completedCount}/${category.totalCount}',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityLeaderboardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Community Leaderboard',
                style: AppStyles.headerStyle,
              ),
              TextButton(
                onPressed: () {
                  // View full leaderboard
                },
                child: Text(
                  'View All',
                  style: TextStyle(color: AppColors.primaryGreen),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            final user = _leaderboardUsers[index];
            return _buildLeaderboardUserCard(user, index + 1);
          },
        ),
      ],
    );
  }

  Widget _buildLeaderboardUserCard(LeaderboardUser user, int rank) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getRankColor(rank),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$rank',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: _getAvatarColor(user.name),
            child: Text(
              user.name[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.role,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${user.zikrCount}',
            style: TextStyle(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Zikr',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  Color _getAvatarColor(String name) {
    final List<Color> colors = [
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.teal,
      Colors.indigo,
      Colors.red,
    ];

    final int index = name.codeUnitAt(0) % colors.length;
    return colors[index];
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.grey.shade400;
      case 3:
        return Colors.brown.shade300;
      default:
        return Colors.grey.shade300;
    }
  }
}

class ZikrCategory {
  final String name;
  final String arabicName;
  final int completedCount;
  final int totalCount;
  final IconData icon;

  ZikrCategory({
    required this.name,
    required this.arabicName,
    required this.completedCount,
    required this.totalCount,
    required this.icon,
  });
}

class LeaderboardUser {
  final String name;
  final String role;
  final int zikrCount;

  LeaderboardUser({
    required this.name,
    required this.role,
    required this.zikrCount,
  });
}

// Sample leaderboard users
final List<LeaderboardUser> _leaderboardUsers = [
  LeaderboardUser(name: 'Ahmed', role: 'Admin', zikrCount: 587),
  LeaderboardUser(name: 'Fatima', role: 'Moderator', zikrCount: 429),
  LeaderboardUser(name: 'Omar', role: 'User', zikrCount: 321),
];

void main() {
  runApp(const ZikrApp());
}