// import 'package:flutter/material.dart';
// import '../../core/constants/app_colors.dart';
// import '../../screens/home/home_screen.dart';
// import '../../screens/leaderboard/leaderboard_screen.dart';
// import '../../screens/profile/profile_screen.dart';
// import '../../screens/settings/settings_screen.dart';

// class CustomBottomNavigation extends StatefulWidget {
//   final int currentIndex;

//   const CustomBottomNavigation({Key? key, this.currentIndex = 0})
//     : super(key: key);

//   @override
//   State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
// }

// class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
//   late int _currentIndex;

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.currentIndex;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       onTap: _onItemTapped,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: AppColors.primary,
//       unselectedItemColor: AppColors.grey,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.leaderboard),
//           label: 'Leaderboard',
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//       ],
//     );
//   }

//   void _onItemTapped(int index) {
//     if (index == _currentIndex) return;

//     setState(() {
//       _currentIndex = index;
//     });

//     // Navigate to the selected screen
//     Widget screen;
//     switch (index) {
//       case 0:
//         screen = HomeScreen();
//         break;
//       case 1:
//         screen = LeaderboardScreen();
//         break;
//       case 2:
//         screen = ProfileScreen();
//         break;
//       case 3:
//         screen = SettingsScreen();
//         break;
//       default:
//         screen = HomeScreen();
//     }

//     // Replace the current route to avoid stacking
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => screen),
//     );
//   }
// }
