class Memory {
  /// Lista de operadores aceitos pela calculadora
  static const operations = const ['%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0; // qual elemento do buffer deverá ser alterado
  late String? _operation;
  String _value = '0'; // Valor que está sendo digitado no campo
  bool _wipeValue = false; // indica se o campo está limpo
  String? _lastCommand;

  void applyCommand(String command) {
    if(_isReplacingOperation(command)) {
      _operation = command; return;
    }

    if(command != 'AC') {
      if(!operations.contains(command)) {
        _addDigit(command);
      } else { // Se o número digitado for um operador
        _setOperation(command);
      }
    } else { // Quando o usuário pressionar AC
      _allClear();
    }

    _lastCommand = command;
  }

  bool _isReplacingOperation(String command) {
    if(_lastCommand == null){
      return false;
    }
    return (operations.contains(_lastCommand) && operations.contains(command)) && (_lastCommand != '=' && command != '=');
  }

  void _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';
    if(_bufferIndex != 0) { // se a operação estiver ocorrendo no segundo elemento do buffer
      _buffer[0] = _calculate(); // armazena o resultado da operação no primeiro elemento
      _buffer[1] = 0.0; // zera o segundo elemento
      _value = _buffer[0].toString();
      _value = (_value.endsWith('.0') ? _value.split('.')[0] : _value).replaceAll('.', ',');

      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
    } else if(!isEqualSign) {
      _operation = newOperation;
      _bufferIndex = 1; // altera para o segundo elemento do buffer
    }
    _wipeValue = true; // indica que o campo está limpo pronto para receber um novo
  }
  /// Concatena o caractere digitado
  void _addDigit(String digit) {
    final isDot = digit == ','; // indica se o dígito é uma vírgula ou não
    final wipeValue = (_value == '0' && !isDot) || _wipeValue; // indica se o campo está limpo ou não

    if(isDot && _value.contains(',') && !wipeValue) {
      return; // impede que o usuário digite mais de uma vírgula
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value; // campo atual (se estiver vazio usa empryValue)
    
    _value = currentValue + digit;
    _wipeValue = false; // indica que o campo não está limpo

    _buffer[_bufferIndex] = double.tryParse(_value.replaceAll('.', '').replaceAll(',', '.')) ?? 0; // armazena o valor no buffer
  }
  /// Limpa a memória da calculadora
  void _allClear() {
    _value = '0';
    _buffer.setAll(0, [0.0]);
    _operation = null;
    _bufferIndex = 0;
    _wipeValue = false;
  }
  /// Retorna o resultado da operação entre os elementos do buffer
  double _calculate() {
    switch(_operation) {
      case '%': return _buffer[0] % _buffer[1];
      case '/': return _buffer[0] / _buffer[1];
      case 'x': return _buffer[0] * _buffer[1];
      case '-': return _buffer[0] - _buffer[1];
      case '+': return _buffer[0] + _buffer[1];
      default: return _buffer[0];
    }
  }

  String get value => _value;
}