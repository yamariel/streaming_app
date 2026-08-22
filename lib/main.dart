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
        actions: [Icon(Icons.list)],
        title: Text(
          "Vos émissions en streaming",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: PartieGrilleImage(),
    );
  }
}

class PartieGrilleImage  extends StatelessWidget{
  const PartieGrilleImage ({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
       desiredItemWidth: 100.0,
       minSpacing: 5,
       children: [
        IdentificationStreaming(
            tagStream: "Streaming News", 
            imageStream: "assets/images/news.jpg", 
            nomStream: "Que des news", 
            chaineRadio: "Radio 1"
          ),
    
        IdentificationStreaming(
            tagStream: "Streaming News", 
            imageStream: "assets/images/news.jpg", 
            nomStream: "Que des news 2", 
            chaineRadio: "Radio 2"
          ),
        IdentificationStreaming(
            tagStream: "Streaming News", 
            imageStream: "assets/images/news.jpg", 
            nomStream: "Que des news 3", 
            chaineRadio: "Radio 3"
          ),
    
        IdentificationStreaming(
            tagStream: "Streaming News", 
            imageStream: "assets/images/news.jpg", 
            nomStream: "Que des news 4", 
            chaineRadio: "Radio 4"
          ),
    
        IdentificationStreaming(
            tagStream: "Streaming News", 
            imageStream: "assets/images/news.jpg", 
            nomStream: "Que des news 5", 
            chaineRadio: "Radio 5"
          ),
    
        IdentificationStreaming(
            tagStream: "Streaming News", 
            imageStream: "assets/images/news.jpg", 
            nomStream: "Que des news 6", 
            chaineRadio: "Radio 6"
          ),
       ],
    );
  }
}

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}

//Model
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
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlbumStreaming(chaineRadio: chaineRadio, nomStream: nomStream, imageStream: imageStream)),
            );
          },
          child: Column(
            children: [
              Hero(tag: tagStream, 
              child: Image.network(
                  imageStream,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                )
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(nomStream),
                    const SizedBox(height: 5,),
                    Text(chaineRadio)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlbumStreaming extends StatelessWidget {
  final String imageStream;
  final String nomStream;
  final String chaineRadio;

  const AlbumStreaming({super.key, required this.chaineRadio, required this.nomStream, required this.imageStream});
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
