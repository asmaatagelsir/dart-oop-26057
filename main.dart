// ===== Part 1: BusCard =====
class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor (done for you)
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // EXAMPLE: getter for owner (done for you)
  String get owner {
    return _owner;
  }

  // TODO 1: getter for balance
  int get balance {
    return _balance;
  }

  // EXAMPLE: setter for owner, with a rule (done for you)
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // EXAMPLE: a method (done for you)
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: topUp, only accepts 500 to 50000 RWF
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: pay, declined if the fare is more than the balance
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

// ===== Part 2: StudentCard =====
class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor (done for you)
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // EXAMPLE: override showInfo (done for you)
  @override
  void showInfo() {
    super.showInfo(); // run the parent's showInfo first
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay with the student discount
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

// ===== Part 3: main =====
void main() {
  // My numbers: D = 57, L = 7
  // Starting balance = 1570 RWF, Bus fare = 257 RWF, Discount = 17%

  // EXAMPLE: create a card and test the setter
  BusCard card = BusCard('Asmaa', 1570);
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5: change the owner to my full name
  card.owner = 'Asmaa Tagelsir';
  card.showInfo();

  // TODO 6: top up 100 RWF (refused), then 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: pay the bus fare 2 times
  card.pay(257);
  card.pay(257);
  card.showInfo();

  // TODO 8: StudentCard with my name, starting balance and discount
  StudentCard student = StudentCard('Asmaa Tagelsir', 1570, 17);

  // TODO 9: pay the bus fare with the student card
  student.pay(257);
  student.showInfo();
}
