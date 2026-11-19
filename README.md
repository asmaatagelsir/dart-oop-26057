# Dart OOP Assignment: Kigali Bus Card

**Name:** Asmaa Tagelsir
**Student ID:** 26057

## My numbers

- D = 57, L = 7
- Starting balance = 1000 + (57 x 10) = 1570 RWF
- Bus fare = 200 + 57 = 257 RWF
- Student discount = 10 + 7 = 17%

## How to run

```
dart run main.dart
dart run bug_hunt.dart
```

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

How the numbers work out:

- The name `Al` is refused because it is shorter than 3 characters, so the owner stays `Asmaa`.
- The top-up of 100 RWF is refused, and the top-up of 2000 RWF is accepted: 1570 + 2000 = 3570 RWF.
- Two bus fares of 257 RWF leave 3570 - 514 = 3056 RWF.
- The student card gets 17% off: 257 x 17 ~/ 100 = 43 RWF, so it pays 257 - 43 = 214 RWF and keeps 1570 - 214 = 1356 RWF.

## Part 1: Why no setter for balance?

A setter would let any code write `card.balance = 1000000` and skip every rule. Without one, the balance can only change through `topUp`, which accepts 500 to 50000 RWF, and `pay`, which declines the payment when the fare is more than the balance. This keeps the money on the card safe and correct.

## Part 2: What does ~/ do?

`~/` is integer division. It divides and throws away everything after the decimal point.

- `print(237 * 17 / 100);` prints `40.29`, because `/` always gives a double.
- `print(237 * 17 ~/ 100);` prints `40`, because `~/` cuts off the `.29`.

This is why the student discount is always a whole number of RWF.

## Part 4: Bug table

The line numbers refer to the original `bug_hunt.dart`, before any fixes.

| Bug | The line | Why it is wrong (your words) | Your fix |
|---|---|---|---|
| 1 | 2 and 3 | Dart does not allow a field that cannot be null to be left without a value. `_brand` and `_battery` are declared with nothing assigned, so the code does not compile. | Gave each field a default value: `String _brand = '';` and `int _battery = 0;` |
| 2 | 18 | A child class has to build its parent first. The `SmartPhone` constructor skips this, so the brand and battery never reach the `Phone` constructor. | Passed them up to the parent with `: super(brand, battery)` |
| 3 | 22 | `@override` says a method replaces one from the parent class. `Phone` has no `restart` method, so there is nothing to replace. | Deleted `@override`, so `restart` is a normal method of `SmartPhone` |
| 4 | 30 | Assigning a value to `p.battery` needs a setter, but `Phone` only has a getter. | Wrote `set battery(int value)`, which stores the value only when it is between 0 and 100 |
| 5 | 31 | `battery` is a getter, so it is read like a field. Adding `()` treats the number as a function that can be called. | Removed the brackets: `print(p.battery);` |
| Not a bug | 29 | `new` was required in older versions of Dart. It is now optional but still accepted, so this line compiles and works. | Nothing to change |

The fixed program prints `100`.

## Part 5

**My prediction:**

It prints `1` and then `5`.

- For `a`: `add()` makes `_items` 1. Then `a.items = -5` goes through the setter, but -5 is not `>= 0`, so it is refused and `_items` stays 1. It prints `1`.
- For `b` (a BigBag): its `add()` calls `super.add()` twice, so each `add()` adds 2. Two calls make 4. Then `b.items = b.items + 1` sets 5, which is allowed. It prints `5`.

**Real output:**

```
1
5
```

**Was I right?** Yes, both lines matched my prediction.
