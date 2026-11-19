# Dart OOP Assignment: Kigali Bus Card

**Name:** Asmaa Tagelsir

**Student ID:** 26057

## My numbers

- D = 57, L = 7
- Starting balance = 1000 + (57 x 10) = 1570 RWF
- Bus fare = 200 + 57 = 257 RWF
- Student discount = 10 + 7 = 17%

## Output of main.dart

```
Error: name too short
Owner: Asmaa | Balance: 1570 RWF
Owner: Asmaa Tagelsir | Balance: 1570 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 257 RWF
Paid 257 RWF
Owner: Asmaa Tagelsir | Balance: 3056 RWF
Student discount: 43 RWF
Paid 214 RWF
Owner: Asmaa Tagelsir | Balance: 1356 RWF
Student card: 17% off
```

## Part 1: Why no setter for balance?

A setter would let any code write `card.balance = 1000000` and skip all the rules. With no setter, the balance can only change through `topUp`, which accepts 500 to 50000 RWF, and `pay`, which declines when the fare is more than the balance. So the balance can never be changed in a way the bus card does not allow.

## Part 2: What does ~/ do?

`~/` is integer division: it divides and throws away the decimal part. `print(237 * 17 / 100);` prints `40.29`, because `/` always gives a double. `print(237 * 17 ~/ 100);` prints `40`, because `~/` cuts off the .29. That is why the student discount is a whole number of RWF.

## Part 4: Bug table

| Bug | The line | Why it is wrong (your words) | Your fix |
|-----|----------|------------------------------|----------|
| 1 | `String _brand;` and `int _battery;` | Fields that cannot be null must have a starting value, otherwise Dart gives an error. | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The constructor does not call the parent constructor, so Phone cannot be built. | Added `: super(brand, battery)` |
| 3 | `@override` above `void restart()` | `@override` only works when the parent has that method, and Phone has no `restart`. | Removed `@override` |
| 4 | `p.battery = 100;` | There is a getter for battery but no setter, so it cannot be assigned. | Added `set battery(int value)` that accepts only 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter, not a method, so it must not be called with `()`. | Changed to `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | The `new` keyword is optional in Dart but still allowed, so this line is fine. | (none) |

The fixed program prints `100`.

## Part 5

My prediction:

It prints `1` and then `5`.

- For `a`: `add()` makes `_items` 1. Then `a.items = -5` goes through the setter, but -5 is not `>= 0`, so it is refused and `_items` stays 1. It prints `1`.
- For `b` (a BigBag): its `add()` calls `super.add()` twice, so each `add()` adds 2. Two calls make 4. Then `b.items = b.items + 1` sets 5, which is allowed. It prints `5`.

Real output:

```
1
5
```

Was I right? Yes, both lines matched my prediction.