# flutter_quiz_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Cambios realizados en el código 
#1 Se mejoró AnswerButton para móviles usando double.infinity, más padding y estilo personalizable. También se sugirió agregar accesibilidad con Semantics.

#2 En OutlinedButtonExample, se rediseñó el botón con bordes redondeados, padding amplio y la opción de mover el ícono a la izquierda o derecha usando un enum.

#3 En questions_screen.dart, se agregó protección contra errores de índice, scroll adaptable con SingleChildScrollView, y espaciado entre botones para mejor usabilidad.

#4 En questions_summary.dart, se eliminó la altura fija y se usó scroll flexible. Se añadieron etiquetas como "Tu respuesta", mejores márgenes y diseño visual para cada bloque.

#5 En quiz.dart, se reemplazaron strings por un enum para controlar las pantallas, se mejoró la gestión del estado con setState, se limpió el código innecesario, se agregaron nombres de funciones más claros, y se incluyó una transición visual con AnimatedSwitcher.