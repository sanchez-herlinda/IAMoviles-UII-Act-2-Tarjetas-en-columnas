import 'package:flutter/material.dart';

void main() {
  runApp(const RestauranteApp());
}

// 1. Clase Platillo (Modelo de datos)
class Platillo {
  final String titulo;
  final String subtitulo;
  final String imgUrl;

  Platillo({
    required this.titulo,
    required this.subtitulo,
    required this.imgUrl,
  });
}

class RestauranteApp extends StatelessWidget {
  const RestauranteApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Lista de diccionarios (datos de ejemplo con links actualizados)
    final List<Map<String, String>> datosPlatillos = [
      {
        'titulo': 'Lasagna Tradizionale',
        'subtitulo': 'Pasta artesanal con ragú de carne y bechamel.',
        'img_url':
            'https://images.unsplash.com/photo-1551183053-bf91a1d81141?q=80&w=200&h=200&fit=crop',
      },
      {
        'titulo': 'Pizza Margherita',
        'subtitulo': 'Tomate San Marzano, mozzarella y albahaca fresca.',
        'img_url':
            'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?q=80&w=200&h=200&fit=crop',
      },
      {
        'titulo': 'Tiramisú Clásico',
        'subtitulo': 'Bizcocho savoiardi, café espresso y mascarpone.',
        'img_url':
            'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?q=80&w=200&h=200&fit=crop',
      },
    ];

    // Convertir la lista
    final List<Platillo> listaPlatillos = datosPlatillos.map((item) {
      return Platillo(
        titulo: item['titulo']!,
        subtitulo: item['subtitulo']!,
        imgUrl: item['img_url']!,
      );
    }).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFF9F2),
        appBar: AppBar(
          title: const Text(
            'Il Sapore Italiano',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFFD35400),
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: listaPlatillos.map((platillo) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                // Imagen con manejo de errores (SOLUCIÓN AQUÍ)
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    platillo.imgUrl,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    // Si la imagen falla (404), mostramos este ícono en lugar de romper la app
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 100,
                                        height: 100,
                                        color: Colors.grey[200],
                                        child: const Icon(
                                          Icons.broken_image,
                                          color: Colors.grey,
                                          size: 40,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // Textos
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          platillo.titulo,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF8E2714),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          platillo.subtitulo,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
