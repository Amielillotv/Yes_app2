///1. ¿que hace un constructor?
///R1= Inicializa un widget
///2.¿Porque ese me him?
///Son las respuestas que llegan de ella y
///mis respuestas
/// ¿que es final?
/// para que nose pueda cambiar el valor de la
/// variablr
///build context identificador
/////
///En que archivo gestiono mis carpetas
///ChangeNotifier
///GetX es como manejar un coche automatico
///
import 'package:intl/intl.dart'; // Importa este paquete para formatear la fecha y hora

DateTime now = DateTime.now(); // Obtiene la fecha y hora actuales
String formattedTime =
    DateFormat('HH:mm').format(now); // Formatea la hora como 'HH:mm'

//print(formattedTime); // Muestra la hora formateada en la consola

enum FromWho { me, him } //como si fuera una lista de valores predeterminados

class Message {
  final String text;
  //? puede ser nulo o puede tener algo
  final String? imageUrl;
  final FromWho fromWho;
  final String time; // Nuevo atributo para almacenar la hora del mensaje
  ///
  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    String? time, // Agregar el parámetro para la hora del mensaje
  }) : time = time ??
            DateFormat('HH:mm').format(
                DateTime.now()); // Si no se proporciona, usa la hora actual
//Constructor
}
