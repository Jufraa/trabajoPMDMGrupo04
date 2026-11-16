import 'package:flutter/material.dart';

/// Órdenes posibles de la lista.
enum OrdenCatalogo { nombre, precio }

/// Menú de tres puntos del catálogo: dos órdenes y «Acerca de».
class MenuCatalogo extends StatelessWidget {
  final ValueChanged<OrdenCatalogo> onOrdenar;

  const MenuCatalogo({super.key, required this.onOrdenar});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (valor) {
        switch (valor) {
          case 'nombre':
            onOrdenar(OrdenCatalogo.nombre);
          case 'precio':
            onOrdenar(OrdenCatalogo.precio);
          case 'acerca':
            showAboutDialog(
              context: context,
              applicationName: 'Frutería Huerta de Murcia',
              applicationVersion: '1.0.0',
              children: const [
                Text('App de servicios para un comercio local.'),
                SizedBox(height: 8),
                Text('PMDM · 2.º DAM · Grupo 04'),
                Text('Autores: (vuestros tres nombres)'),
              ],
            );
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'nombre', child: Text('Ordenar por nombre')),
        PopupMenuItem(value: 'precio', child: Text('Ordenar por precio')),
        PopupMenuItem(value: 'acerca', child: Text('Acerca de')),
      ],
    );
  }
}