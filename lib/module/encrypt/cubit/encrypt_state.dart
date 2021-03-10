part of 'encrypt_cubit.dart';

@immutable
class EncryptState {
  final String textData;
  final Encrypted encrypt;
  final Key key;
  final IV iv;
  final String decryptedData;

  EncryptState({
    this.key,
    this.iv,
    @required this.textData,
    this.encrypt,
    this.decryptedData,
  });

  EncryptState copyWith({
    String textData,
    Encrypted encrypt,
    Key key,
    IV iv,
    String decryptedData,
  }) {
    return EncryptState(
      encrypt: encrypt ?? this.encrypt,
      key: key ?? this.key,
      iv: iv ?? this.iv,
      decryptedData: decryptedData ?? this.decryptedData,
      textData: textData ?? this.textData,
    );
  }

  @override
  String toString() {
    return 'EncryptState(textData: $textData, encrypt: $encrypt, key: $key, iv: $iv, decryptedData: $decryptedData)';
  }
}
