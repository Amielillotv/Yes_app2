import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provide.dart';
import 'package:yes_no_app/presentation/widgets/chat/he_menssage_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_menssage_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

///Scaffold widget para una bara, inicio de todo///
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            ///Se empezo con una imagen de internet///
            backgroundImage: NetworkImage(
                'https://www.stylist.co.uk/images/app/uploads/2022/08/02114405/sydney-sweeney-crop-1659437081-1120x1120.jpg?auto=format%2Ccompress&fit=max&fm=webp&monochrome=29000000&q=75&w=1400'),
          ),
        ),
        title: const Text('Mi princesa ♥️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ///builder una forma de contrucción de ejecución
            //////
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                ///// se puso la longitud de la lista que se encuentra
                ///en chat provaider
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  //instancia del obj. message que sabra de quien es el mensaje
                  final message = chatProvider.messageList[index];
                  //Asigna MessageBubble a
                  return (message.fromWho == FromWho.him)
                      ? HeMenssageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),

            //caja de texto
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
