import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNavigationBarPage(),
    );
  }
}

class MapremierePage extends StatefulWidget {
  const MapremierePage({super.key});

  @override
  State<MapremierePage> createState() => _MapremierePageState();
}

class _MapremierePageState extends State<MapremierePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.search),
        backgroundColor: Colors.amber,
        actions: const [Icon(Icons.list)],
        title: const Text(
          "Vos émissions en streaming",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const PartieGrilleImage(),
    );
  }
}
//vue
class PartieGrilleImage extends StatelessWidget {
  const PartieGrilleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ResponsiveGridList(
        desiredItemWidth: 150.0,
        minSpacing: 16,
        children: [
          IdentificationStreaming(
            tagStream: "Streaming News 1",
            imageStream: "https://picsum.photos/500/300?random=1",
            nomStream: "Que des news",
            chaineRadio: "Radio 1",
          ),
      
          IdentificationStreaming(
            tagStream: "Streaming News 2",
            imageStream: "https://picsum.photos/500/300?random=2",
            nomStream: "Que des news 2",
            chaineRadio: "Radio 2",
          ),
      
          IdentificationStreaming(
            tagStream: "Streaming News 3",
            imageStream: "https://picsum.photos/500/300?random=3",
            nomStream: "Que des news 3",
            chaineRadio: "Radio 3",
          ),
      
          IdentificationStreaming(
            tagStream: "Streaming News 4",
            imageStream: "https://picsum.photos/500/300?random=4",
            nomStream: "Que des news 4",
            chaineRadio: "Radio 4",
          ),
      
          IdentificationStreaming(
            tagStream: "Streaming News 5",
            imageStream: "https://picsum.photos/500/300?random=5",
            nomStream: "Que des news 5",
            chaineRadio: "Radio 5",
          ),
      
          IdentificationStreaming(
            tagStream: "Streaming News 6",
            imageStream: "https://picsum.photos/500/300?random=6",
            nomStream: "Que des news 6",
            chaineRadio: "Radio 6",
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MapremierePage(),
    const Center(child: Text("Recherche")),
    const Center(child: Text("Profil")),
  ];

  void _setWidget(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _setWidget,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}

// Model
class IdentificationStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String nomStream;
  final String chaineRadio;

  const IdentificationStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.nomStream,
    required this.chaineRadio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumStreaming(
                  chaineRadio: chaineRadio,
                  nomStream: nomStream,
                  imageStream: imageStream,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: imageStream,
                child: Image.network(
                  imageStream,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return const SizedBox(
                      height: 180,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 180,
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nomStream,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(Icons.radio, size: 18, color: Colors.amber),
                        const SizedBox(width: 6),
                        Text(
                          chaineRadio,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//model
class AlbumStreaming extends StatelessWidget {
  final String imageStream;
  final String nomStream;
  final String chaineRadio;

  const AlbumStreaming({
    super.key,
    required this.chaineRadio,
    required this.nomStream,
    required this.imageStream,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.favorite_border)
          )
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
          tag: imageStream, 
          child:           Image.network(
            imageStream,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress ==  null) {
                return child;
              }

              return const SizedBox(
                height: 180,
                child: Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                height: 180,
                child: Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
          ),

          Container(
            width: double.infinity,
            color: Colors.purple,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              nomStream,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.purple,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              chaineRadio,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
