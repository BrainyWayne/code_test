import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:code_test/module/encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'encrypt_state.dart';

class EncryptCubit extends Cubit<EncryptState> {
  EncryptCubit() : super(EncryptState(textData: ""));

  void textDataChanged(String textData) {
    emit(state.copyWith(textData: textData));
  }

  Future<void> encryptData() async {
    try {
      // final textData = state.textData;
      // final key = generateKey();
      // final iv = generateIV();
      // final encrypter = Encrypter(Salsa20(key));

      // final encryptedData = encrypter.encrypt(textData, iv: iv);

      final plainText = state.textData;
      final key = Key.fromSecureRandom(32);
      final iv = IV.fromSecureRandom(16);
      final encrypter = Encrypter(AES(key));

      final encryptedData = encrypter.encrypt(plainText, iv: iv);
      final decrypted = encrypter.decrypt(encryptedData, iv: iv);

      emit(state.copyWith(
          decryptedData: decrypted, encrypt: encryptedData, key: key, iv: iv));
    } catch (e) {
      print(e.toString());
    }
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }
}
