import 'package:firebase_messaging/firebase_messaging.dart';


class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

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


        
      },
      // onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("=======  onLaunch: $message");

        
      },
      // CLICK
      onResume: (Map<String, dynamic> message) async {
        print("============ onResume: $message");

        final noti = message['data']['Comida'];
        print(noti);
      },
    );
  }

  

}

// edgzFHgIWhc:APA91bEEvqQnO9_-QuJS8uMfkbG1mEYr_aLzpvHLCRUyagP90A0hnMS9X-JbhhTDjCLSCLAqPyj9vs_9KS-7swhX2aW24OWOlHbEvgAt2mCLO1LaLTzodxXYud1wYaoPZDI1_1wfwjUx

