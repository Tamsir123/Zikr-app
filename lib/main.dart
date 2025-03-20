import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  static const List<Color> _iconColors = [
    Colors.indigo,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
        ],
      ),
      body: Column(
        children: [
          // Partie supérieure
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Hello, Flutter!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          // Partie inférieure avec la liste de personnes
          Expanded(
            flex: 2,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: personnesList.length,
              separatorBuilder: (context, index) => const Divider(height: 1, indent: 72),
              itemBuilder: (context, index) {
                final person = personnesList[index];
                final String name = person['nom'] ?? 'Unknown';
                final String role = person['role'] ?? 'Unknown';
                final Color avatarColor = _getAvatarColor(name);
                
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  leading: CircleAvatar(
                    backgroundColor: avatarColor,
                    child: Text(
                      name[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    role,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: _iconColors[_selectedIndex],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? _iconColors[0] : Colors.grey),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, color: _selectedIndex == 1 ? _iconColors[1] : Colors.grey),
            label: 'Coran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: _selectedIndex == 2 ? _iconColors[2] : Colors.grey),
            label: 'Discussion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _selectedIndex == 3 ? _iconColors[3] : Colors.grey),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
  
  void _showPersonDetails(BuildContext context, Map<String, String> person) {
    final String name = person['nom'] ?? 'Unknown';
    final String role = person['role'] ?? 'Unknown';
    
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: _getAvatarColor(name),
              child: Text(
                name[0],
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              role,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.message, Colors.blue, 'Message'),
                _buildActionButton(Icons.call, Colors.green, 'Appeler'),
                _buildActionButton(Icons.info, Colors.orange, 'Info'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildActionButton(IconData icon, Color color, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          radius: 25,
          child: Icon(
            icon,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
  
  Color _getAvatarColor(String name) {
    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.teal,
      Colors.indigo,
      Colors.red,
    ];
    
    // Utiliser le code du premier caractère pour déterminer la couleur
    final int index = name.codeUnitAt(0) % colors.length;
    return colors[index];
  }
}

// Liste de personnes à afficher
final List<Map<String, String>> personnesList = [
  {'nom': 'Ahmed', 'role': 'Administrateur'},
  {'nom': 'Fatima', 'role': 'Modérateur'},
  {'nom': 'Omar', 'role': 'Utilisateur'},
  {'nom': 'Aisha', 'role': 'Utilisateur'},
  {'nom': 'Mohammed', 'role': 'Modérateur'},
  {'nom': 'Khadija', 'role': 'Utilisateur'},
  {'nom': 'Ibrahim', 'role': 'Utilisateur'},
  {'nom': 'Zaynab', 'role': 'Administrateur'},
];