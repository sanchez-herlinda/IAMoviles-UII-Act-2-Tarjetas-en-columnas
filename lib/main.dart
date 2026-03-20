import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurante Roma',
      home: PaginaRecomendaciones(),
    );
  }
}

class PaginaRecomendaciones extends StatelessWidget {
  const PaginaRecomendaciones({super.key});

  // Colores definidos estáticamente
  final Color backgroundColor = const Color(0xFFF9F9F9); // Blanco hueso
  final Color detailColor = const Color(0xFF8B0000); // Rojo elegante
  final Color textColor = const Color(0xFF1A1A1A); // Gris muy oscuro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: detailColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'La',
              style: GoogleFonts.playfairDisplay(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 2),
            Text(
              'ROMA',
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 0.9,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Recomendaciones',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Contenedor de la imagen con flechas superpuestas
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000',
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Flecha izquierda centrada verticalmente
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                // Lógica para navegar hacia atrás
                              },
                            ),
                          ),
                        ),
                      ),
                      // Flecha derecha centrada verticalmente
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                // Lógica para navegar hacia adelante
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Estrella centrada
                  Center(child: Icon(Icons.star, color: detailColor, size: 30)),
                  const SizedBox(height: 10),
                  Text(
                    'Ensalada de Verano Roma',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Una mezcla fresca de ingredientes locales, aceite de oliva extra virgen y el toque secreto de la casa. Perfecta para comenzar tu experiencia italiana.',
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor.withAlpha(204), // 80% de opacidad
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: textColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Añadir a carrito',
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Footer estático
      bottomNavigationBar: SafeArea(
        child: Container(
          color:
              backgroundColor, // Fondo del footer del mismo color que el background
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Línea superior del mismo color que el encabezado (detailColor)
              Divider(height: 1, color: detailColor),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Text(
                    '© 2024 Restaurante La ROMA',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
