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
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
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
  int _totalZikr = 3460; // Nombre total de Zikr

  static const List<Color> _iconColors = [
    Colors.green,
    Colors.indigo,
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
          child: Icon(Icons.person, color: Colors.green),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.green),
            onPressed: () {},
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
        ],
      ),
      body: Column(
        children: [
          // Partie supérieure avec le Zikr en arabe et le compteur total
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/zikr_img.jpeg'),
                  fit: BoxFit.cover,
                  // opacity: 0.08,
                 
                ),
              ),
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container semi-transparent pour améliorer la lisibilité du texte arabe
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0.5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Amiri',
                        color: Colors.green,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 1.0,
                            color: Color.fromARGB(70, 0, 0, 0),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Texte de translittération avec un fond subtil
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Soubhan Allah wa bihamdihi',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.green,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Compteur total amélioré
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.withOpacity(0.7),
                          Colors.green.withOpacity(0.5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                        const SizedBox(width: 8),
                        Text(
                          '$_totalZikr',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 1),
                                blurRadius: 2.0,
                                color: Color.fromARGB(100, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Partie inférieure avec la liste de personnes centrée
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: personnesList.length,
                itemBuilder: (context, index) {
                  final person = personnesList[index];
                  final String name = person['nom'] ?? 'Unknown';
                  final String role = person['role'] ?? 'Unknown';
                  final int zikrCount = int.parse(person['zikrCount'] ?? '0');
                  final Color avatarColor = _getAvatarColor(name);

                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Position numéro
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color:
                                  index < 3
                                      ? Colors.amber
                                      : Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    index < 3 ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Avatar et informations de la personne
                          CircleAvatar(
                            backgroundColor: avatarColor,
                            child: Text(
                              name[0],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  role,
                                  style: TextStyle(
                                    color:
                                        Theme.of(
                                          context,
                                        ).textTheme.bodySmall?.color,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Compteur de Zikr
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              '$zikrCount',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? _iconColors[0] : Colors.grey,
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: _selectedIndex == 1 ? _iconColors[1] : Colors.grey,
            ),
            label: 'Coran',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: _selectedIndex == 2 ? _iconColors[2] : Colors.grey,
            ),
            label: 'Discussion',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 3 ? _iconColors[3] : Colors.grey,
            ),
            label: 'Profil',
          ),
        ],
      ),
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

    // Utiliser le code du premier caractère pour déterminer la couleur
    final int index = name.codeUnitAt(0) % colors.length;
    return colors[index];
  }
}

// Liste de personnes avec leur compteur de Zikr
final List<Map<String, String>> personnesList = [
  {'nom': 'Ahmed', 'role': 'Administrateur', 'zikrCount': '587'},
  {'nom': 'Fatima', 'role': 'Modérateur', 'zikrCount': '429'},
  {'nom': 'Omar', 'role': 'Utilisateur', 'zikrCount': '321'},
  {'nom': 'Aisha', 'role': 'Utilisateur', 'zikrCount': '289'},
  {'nom': 'Mohammed', 'role': 'Modérateur', 'zikrCount': '246'},
  {'nom': 'Khadija', 'role': 'Utilisateur', 'zikrCount': '205'},
  {'nom': 'Ibrahim', 'role': 'Utilisateur', 'zikrCount': '183'},
  {'nom': 'Zaynab', 'role': 'Administrateur', 'zikrCount': '142'},
];
