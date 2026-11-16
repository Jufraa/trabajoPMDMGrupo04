import 'package:flutter/material.dart';

import '../data/productos_ejemplo.dart';
import '../models/producto.dart';
import '../widgets/confirmar_borrado.dart';
import '../widgets/menu_catalogo.dart';
import '../widgets/producto_tile.dart';
import 'detalle_screen.dart';
import 'nuevo_producto_screen.dart';

/// Pantalla principal: lista de productos con orden, borrado y alta.
class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Producto> _productos = List.of(productosEjemplo);

  void _ordenar(OrdenCatalogo orden) {
    setState(() {
      switch (orden) {
        case OrdenCatalogo.nombre:
          _productos.sort((a, b) =>
              a.nombre.toLowerCase().compareTo(b.nombre.toLowerCase()));
        case OrdenCatalogo.precio:
          _productos.sort((a, b) => a.precio.compareTo(b.precio));
      }
    });
  }

  Future<void> _borrar(Producto producto) async {
    final confirmado = await confirmarBorrado(context, producto);
    if (!confirmado || !mounted) return;
    setState(() => _productos.removeWhere((p) => p.id == producto.id));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('«${producto.nombre}» borrado')),
    );
  }

  Future<void> _nuevoProducto() async {
    final siguienteId =
        _productos.fold<int>(0, (max, p) => p.id > max ? p.id : max) + 1;
    final nuevo = await Navigator.push<Producto>(
      context,
      MaterialPageRoute(
        builder: (_) => NuevoProductoScreen(siguienteId: siguienteId),
      ),
    );
    if (nuevo == null || !mounted) return;
    setState(() => _productos.add(nuevo));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('«${nuevo.nombre}» añadido al catálogo')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
        actions: [MenuCatalogo(onOrdenar: _ordenar)],
      ),
      body: _productos.isEmpty
          ? const Center(child: Text('No hay productos en el catálogo'))
          : ListView.builder(
              itemCount: _productos.length,
              itemBuilder: (context, i) {
                final p = _productos[i];
                return ProductoTile(
                  producto: p,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetalleScreen(producto: p),
                    ),
                  ),
                  onLongPress: () => _borrar(p),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nuevoProducto,
        tooltip: 'Nuevo producto',
        child: const Icon(Icons.add),
      ),
    );
  }
}