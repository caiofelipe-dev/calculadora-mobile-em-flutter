class Memory {
  static const operations = const ['%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  late String operation;
  String _value = '0';
  bool _wipeValue = false;

  void applyCommand(String command) {
    if(command != 'AC') {
      if(!operations.contains(command)) {
        _addDigit(command);
      } else { // Se o número digitado for um operador
        _setOperation(command);
      }
    } else { // Quando o usuário pressionar AC
      _allClear();
    }
  }

  _setOperation(String newOperation) {
    _wipeValue = true;
  }

  _addDigit(String digit) {
    final isDot = digit == ',';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue; //verifica se o valor veio depois de uma operação ou se é um número menor que 1

    if(isDot && _value.contains(',') && !wipeValue) {
      return; // não permite digitar vírgula mais de uma vez
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;
  }

  _allClear() {
    _value = '0';
  }

  String get value => _value;
}