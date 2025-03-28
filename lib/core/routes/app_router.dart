// import 'package:flutter/material.dart';
// import '../../screens/home/home_screen.dart';
// import '../../screens/zikr_details/zikr_details_screen.dart';
// import '../../screens/leaderboard/leaderboard_screen.dart';
// import '../../screens/profile/profile_screen.dart';
// import '../../screens/settings/settings_screen.dart';
// import '../../models/zikr_category.dart';

// class AppRouter {
//   static const String home = '/';
//   static const String zikrDetails = '/zikr-details';
//   static const String leaderboard = '/leaderboard';
//   static const String profile = '/profile';
//   static const String settings = '/settings';

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case home:
//         return MaterialPageRoute(builder: (_) => HomeScreen());

//       case zikrDetails:
//         final ZikrCategory category = settings.arguments as ZikrCategory;
//         return MaterialPageRoute(
//           builder: (_) => ZikrDetailsScreen(category: category),
//         );

//       case leaderboard:
//         return MaterialPageRoute(builder: (_) => LeaderboardScreen());

//       case profile:
//         return MaterialPageRoute(builder: (_) => ProfileScreen());

//       case settings:
//         return MaterialPageRoute(builder: (_) => SettingsScreen());

//       default:
//         return MaterialPageRoute(
//           builder:
//               (_) => Scaffold(
//                 body: Center(
//                   child: Text('No route defined for ${settings.name}'),
//                 ),
//               ),
//         );
//     }
//   }
// }
