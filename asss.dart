abstract class Account {
  void deposit(double amount);
  void withdraw(double amount);
  double checkBalance();
}

class Customer {
  String name;
  Account account;

  Customer(this.name, this.account);

  void displayInfo() {
    print("Customer Name: $name");
    print("Account Balance: \$${account.checkBalance()}");
  }
}

class SavingsAccount implements Account {
  double balance;

  SavingsAccount(this.balance);

  @override
  void deposit(double amount) {
    balance = balance + amount;
  }
  
  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance = balance - amount;
    } else {
      print("Insufficient balance!");
    }
  }

  @override
  double checkBalance() {
    return balance;
  }
}

void main() {
  var savingsAccount = SavingsAccount(1000.00);
  var customer = Customer("Gathimba", savingsAccount);

  customer.account.deposit(500.00);
  customer.account.withdraw(400.00);

  customer.displayInfo();
}
