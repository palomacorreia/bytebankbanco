import 'package:bytebankbanco/screens/transactions_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contacts_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(
        minHeight: constraints.maxHeight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                featureItem(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: () {
                    _show_contacts(context);
                  },
                ),
                featureItem(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: () => _show_contacts(context),
                ),
                featureItem(
                  'Transaction Feed',
                  Icons.description,
                  onClick: () => _showTransactions(context),
                ),
              ],
            ),
          ),
        ],
      ),
        ),
        ),
      ),
    );
  }

  void _show_contacts(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Contacts(),
      ),
    );
  }
}

_showTransactions(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => TransactionsList(),
    ),
  );
}

class featureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  featureItem(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme
            .of(context)
            .primaryColor,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


