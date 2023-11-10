import 'package:android_intent_plus/android_intent.dart';

void Function() makeIntentCall(String phoneNumber, int dtmfTone) {
  return () async {
    final intent = AndroidIntent(
      action: 'android.intent.action.CALL',
      data: 'tel:$phoneNumber,$dtmfTone',
    );

    await intent.launch();
  };
}
