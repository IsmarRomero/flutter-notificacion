import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';


class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // Mapa
  final _mensajesStreamControlle = StreamController<String>.broadcast();

  Stream<String> get mensajes => _mensajesStreamControlle.stream;

  iniNotifications() {
    // Solicitar permiso de motrar notificaciones
    _firebaseMessaging.requestNotificationPermissions();
    // Future, para obtener token
    _firebaseMessaging.getToken().then((token) {
      print('=== FCM Token ===');
      print(token);
    });

    _firebaseMessaging.configure(
      // Cuando esta en ejecucion la app
      onMessage: (Map<String, dynamic> message) async {
        print("============ onMessage: $message");
        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = message['data']['Comida'] ?? 'no-data';
        } else {
          argumento = message['Comida'] ?? 'no-data-ios';
        }
         _mensajesStreamControlle.sink.add(argumento);
        
      },
      // onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("=======  onLaunch: $message");

        
      },
      // CLICK
      onResume: (Map<String, dynamic> message) async {
        print("============ onResume: $message");
        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = message['data']['Comida'] ?? 'no-data';
        } else {
          argumento = message['Comida'] ?? 'no-data-ios';
        }
         _mensajesStreamControlle.sink.add(argumento);
     

       //  print(noti);
      },
    );
  }

  dispose() {
    _mensajesStreamControlle?.close();
  }

}

// edgzFHgIWhc:APA91bEEvqQnO9_-QuJS8uMfkbG1mEYr_aLzpvHLCRUyagP90A0hnMS9X-JbhhTDjCLSCLAqPyj9vs_9KS-7swhX2aW24OWOlHbEvgAt2mCLO1LaLTzodxXYud1wYaoPZDI1_1wfwjUx

