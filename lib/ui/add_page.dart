import 'package:crypto_wallet/firebase/flutterfire.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}


class _AddPageState extends State<AddPage> {

  List<String> coins = [
  "bitcoin",
  "tether",
  "ethereum"
  ];
  String dropdownValue = "bitcoin";
  TextEditingController _amountController = TextEditingController();
  @override

  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: DropdownButton(
                      value: dropdownValue,
                      onChanged: (String? value){
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: coins.map<DropdownMenuItem<String>>((String? value){
                        return DropdownMenuItem(
                            value: value,
                            child: Text(value!)
                        );
                      }
                      ).toList(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: TextFormField(
                      controller: _amountController,
                      decoration: InputDecoration(
                        labelText: "Coin Amount",

                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
                child: TextButton(onPressed: () async{
                  await addCoin(dropdownValue, _amountController.text);
                  Navigator.of(context).pop();

                }, child: Text("Add", style: TextStyle(color: Colors.white),),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
