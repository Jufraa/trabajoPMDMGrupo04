import 'package:flutter/material.dart';

import '../models/producto.dart';

Future<bool> confirmarBorrado(BuildContext context, Producto producto) async {
  final resultado = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('borrar producto'),
      content: Text('¿Seguro que quieres borrar «${producto.nombre}»?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: const Text('cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: const Text('borrar'),
        ),
      ],
    ),
  );
  return resultado ?? false;
}