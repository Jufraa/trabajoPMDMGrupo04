import 'package:flutter/material.dart';

import '../models/producto.dart';

/// Fila de la lista del catálogo.
class ProductoTile extends StatelessWidget {
  final Producto producto;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const ProductoTile({
    super.key,
    required this.producto,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(producto.nombre, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(producto.categoria, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text(
        producto.precioTexto,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}