class Memory {

  String _value = '';

  void applyCommand(String command) {
    if(command != 'AC') {
      _value += command;
    } else { // Quando o usuário pressionar AC
      _allClear();
    }
  }

  _allClear() {
    _value = '';
  }

  String get value => (_value.isEmpty) ? "0" : _value;
}