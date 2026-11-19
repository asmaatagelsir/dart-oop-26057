class Phone {
  String _brand = ''; // Bug 1 fix: fields need a starting value
  int _battery = 0; // Bug 1 fix: fields need a starting value

  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  int get battery {
    return _battery;
  }

  // Bug 4 fix: setter that only accepts 0 to 100
  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    } else {
      print('Error: battery must be 0 to 100');
    }
  }
}

class SmartPhone extends Phone {
  String _system = '';

  // Bug 2 fix: build the parent Phone first with super
  SmartPhone(String brand, int battery, String system) : super(brand, battery) {
    _system = system;
  }

  // Bug 3 fix: removed @override, because Phone has no restart method
  void restart() {
    print('Restarting $_system');
  }
}

void main() {
  Phone p = new Phone('Tecno', 50); // not a bug: "new" is optional but allowed
  p.battery = 100;
  print(p.battery); // Bug 5 fix: battery is a getter, so no ()
}
