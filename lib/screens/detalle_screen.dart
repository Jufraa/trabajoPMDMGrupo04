import 'package:flutter/material.dart';

import '../models/producto.dart';


class DetalleScreen extends StatelessWidget {
  final Producto producto;

  const DetalleScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(producto.nombre)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(producto.nombre, style: tema.headlineSmall),
            const SizedBox(height: 8),
            Chip(label: Text(producto.categoria)),
            const SizedBox(height: 16),
            Text('Descripción', style: tema.titleMedium),
            const SizedBox(height: 4),
            Text(producto.descripcion, style: tema.bodyLarge),
            const SizedBox(height: 24),
            Text(
              producto.precioTexto,
              style: tema.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}