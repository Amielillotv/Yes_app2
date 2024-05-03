import 'package:flutter/widgets.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  /// Contralador para manejar la posición scroll
  final ScrollController chatScrollController = ScrollController();
  //instancia de la clase GetyesNoAnswer
  final getyesNoAnswer = GetyesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Kevin,se va ir a repe?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    // verificar si el mensaje esta vacio
    if (text.trim().isEmpty) {
      print('Error: Mensaje vacio');
      return;
    }

    /// el mensaje siempre va ser mio porque
    /// yo, el usuario, siempre va ser mio el mensaje
    final newMessage = Message(text: text, fromWho: FromWho.me);

    ///agregar un mensaje a la lista
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      himReply();
    }
    //Imprimir la cantidad de elementos de la lista
    print('Cantidad de mensajes: ${messageList.length}');

    /// Notificar si algo de provaider cambio para que
    /// se guarde en el estado
    notifyListeners();

    ///
    moveScrollToBottom();

    ///
  }

  Future<void> himReply() async {
    //obtener pestición y almacenarlo en una variable
    final himMessage = await getyesNoAnswer.getAnswer();

    messageList.add(himMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        //maxScrollExtent determina lo maximo que el  scroll puede estar
        chatScrollController.position.maxScrollExtent
        //offset :posición de la animación
        ,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
