import '../models/producto.dart';

/// Datos de ejemplo hasta que haya base de datos y API (UT5).
/// TODO (equipo): sustituid estos productos por los 8 (o más) de vuestro comercio.
const productosEjemplo = [
  Producto(id: 1, nombre: 'Pan de pueblo', descripcion: 'Hogaza de 1 kg, horno de leña.', precio: 3.20, categoria: 'Panadería'),
  Producto(id: 2, nombre: 'Croissant', descripcion: 'De mantequilla.', precio: 1.40, categoria: 'Bollería'),
  Producto(id: 3, nombre: 'Tarta de queso', descripcion: 'Para 8 personas. Encargo con 24 h.', precio: 18.00, categoria: 'Repostería'),
];
