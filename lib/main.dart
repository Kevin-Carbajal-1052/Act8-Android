import 'package:flutter/material.dart';

void main() => runApp(BankApp());

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {'type': 'Compra', 'amount': '-1000', 'isIncome': false},
    {'type': 'Salario', 'amount': '+1000', 'isIncome': true},
    {'type': 'Recibido', 'amount': '+200', 'isIncome': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffc28f),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Demon's",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.add),
                ],
              ),
              SizedBox(height: 20),

              // Credit Card
              Padding(
                padding: EdgeInsets.all(4), // Espacio externo de la tarjeta
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      // Círculos decorativos superpuestos
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Icon(Icons.circle,
                            color: Color(0xa7ff5252), size: 50),
                      ),
                      Positioned(
                        left: 40,
                        top: 20,
                        child: Icon(Icons.circle,
                            color: Color(0xa7ff9900), size: 50),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Balance
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  '690 MX',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ],
                            ),
                            SizedBox(height: 60),
                            Text(
                              'MasterCard',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '1234 •••• •••• 4321',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Last Transactions
              Text(
                'Ultimas transacciones',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Transaction List
              ...transactions.map((tx) => TransactionItem(tx)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Map<String, dynamic> tx;
  TransactionItem(this.tx);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 9,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            tx['isIncome'] ? Icons.arrow_downward : Icons.arrow_upward,
            color: tx['isIncome'] ? Colors.green : Colors.red,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              tx['type'],
              style: TextStyle(fontSize: 16),
            ),
          ),
          Text(
            '${tx['amount']} MX',
            style: TextStyle(
              color: tx['isIncome'] ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
