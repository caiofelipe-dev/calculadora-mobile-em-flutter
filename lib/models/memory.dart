class Memory {
  /// Lista de operadores aceitos pela calculadora
  static const operations = const ['%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  late String operation;
  String _value = '0'; // Valor que está sendo digitado no campo
  bool _wipeValue = false; // indica se o campo está limpo

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
    _wipeValue = true; // indica que o campo está limpo pronto para receber um novo
  }

  /// Atribui o caractere digitado
  _addDigit(String digit) {
    final isDot = digit == ','; // indica se o dígito é uma vírgula ou não
    final wipeValue = (_value == '0' && !isDot) || _wipeValue; // indica se o campo está limpo ou não

    if(isDot && _value.contains(',') && !wipeValue) {
      return; // impede que o usuário digite mais de uma vírgula
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value; // campo atual (se estiver vazio usa empryValue)
    
    _value = currentValue + digit;
    _wipeValue = false; // indica que o campo não está limpo
    /// armazena o valor no buffer
    _buffer[_bufferIndex] = double.tryParse(_value.replaceAll('.', '').replaceAll(',', '.')) ?? 0;
  }

  _allClear() {
    _value = '0';
  }

  String get value => _value;
}