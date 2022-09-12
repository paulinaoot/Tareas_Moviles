// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unnecessary_this, unused_label, dead_code, sort_child_properties_last

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  var inputController = TextEditingController();
  bool switchCurrentValue = false;
  double tip = 0.0;
  double total = 0.0;
  int? currentRadio;

  var radioButtonsOptions = {
    0: 'Amazing (20%)',
    1: 'Good (18%)',
    2: 'Okay (15%)'
  };


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Time'),
        centerTitle: false,
        backgroundColor: Colors.green[900],
      ),
      body: ListView(
        //SizedBox(height: 14),
        children: [
           SizedBox(height: 14),
            ListTile(
              leading: Icon(
                Icons.store,
                color: Colors.green[900],
              ),
              title: Padding(
                padding: EdgeInsets.only(right: 24),
                child: TextField(
                  controller: inputController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.green[900]),
                    label: Text("Cost of Service"),
                    filled: false, 
                  ),
                ),
              ),
            ),
            ListTile(
              leading:Icon(
                        Icons.room_service,
                        color: Colors.green[900],
                      ),
              title: Text("How was the service?"),
            ),
            Column(
                children: radioButtonsOptions.entries
                .map((element) => ListTile(
                      leading: Radio(
                        value: element.key,
                        groupValue: currentRadio,
                        onChanged:(val) {
                          currentRadio = val;
                          setState(() {});
                        },
                      ),
                      title: Text(element.value),
                    ))
                .toList(),
            ),
            ListTile(
              leading: Icon(
                Icons.credit_card,
                color: Colors.green[900]
              ),
              title: Text("Round up tip?"),
              trailing: Switch(
                value: switchCurrentValue,
                onChanged: (val) {
                  setState(() {
                    switchCurrentValue = val;
                  });
                },
              ),
            ),
            Row(
              children:[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: MaterialButton(
                      child: Text("CALCULATE", style: TextStyle(color: Colors.white)),
                      color: Colors.green[900],
                      onPressed: (){
                        tipCalculation();
                      },
                    ),
                  )
                ) 
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tip amount: \$${tip.toStringAsFixed(2)}",
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
    );
  }

  tipCalculation() {
    total = double.parse(inputController.text);
    if (currentRadio == 0) {
      tip = total * 0.20;
    } else if (currentRadio == 1) {
      tip = total * 0.18;
    } else if (currentRadio == 2) {
      tip = total * 0.15;
    }
    if (switchCurrentValue) {
      tip = tip.ceilToDouble();
    }
    setState(() {});
  }
}