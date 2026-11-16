import 'package:flutter/material.dart';

import '../models/producto.dart';

/// Formulario de alta. Al guardar devuelve el Producto con Navigator.pop.
class NuevoProductoScreen extends StatefulWidget {
  final int siguienteId;

  const NuevoProductoScreen({super.key, required this.siguienteId});

  @override
  State<NuevoProductoScreen> createState() => _NuevoProductoScreenState();
}

class _NuevoProductoScreenState extends State<NuevoProductoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _descripcion = TextEditingController();
  final _precio = TextEditingController();
  final _categoria = TextEditingController();

  @override
  void dispose() {
    _nombre.dispose();
    _descripcion.dispose();
    _precio.dispose();
    _categoria.dispose();
    super.dispose();
  }

  String? _obligatorio(String? v, String campo) =>
      (v == null || v.trim().isEmpty) ? 'Escribe $campo' : null;

  String? _validarPrecio(String? v) {
    if (v == null || v.trim().isEmpty) return 'Escribe el precio';
    final numero = double.tryParse(v.trim().replaceAll(',', '.'));
    if (numero == null) return 'Escribe un número válido';
    if (numero <= 0) return 'El precio debe ser mayor que 0';
    return null;
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;
    final producto = Producto(
      id: widget.siguienteId,
      nombre: _nombre.text.trim(),
      descripcion: _descripcion.text.trim(),
      precio: double.parse(_precio.text.trim().replaceAll(',', '.')),
      categoria: _categoria.text.trim(),
    );
    Navigator.pop(context, producto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo producto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombre,
                decoration: const InputDecoration(labelText: 'Nombre'),
                textInputAction: TextInputAction.next,
                validator: (v) => _obligatorio(v, 'el nombre'),
              ),
              TextFormField(
                controller: _descripcion,
                decoration: const InputDecoration(labelText: 'Descripción'),
                textInputAction: TextInputAction.next,
                validator: (v) => _obligatorio(v, 'la descripción'),
              ),
              TextFormField(
                controller: _precio,
                decoration: const InputDecoration(
                  labelText: 'Precio (€)',
                  hintText: 'Por ejemplo 3,20',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                validator: _validarPrecio,
              ),
              TextFormField(
                controller: _categoria,
                decoration: const InputDecoration(labelText: 'Categoría'),
                textInputAction: TextInputAction.done,
                validator: (v) => _obligatorio(v, 'la categoría'),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _guardar,
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
