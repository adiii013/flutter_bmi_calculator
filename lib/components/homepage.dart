import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController height = TextEditingController();
TextEditingController weight = TextEditingController();
String? bmi = "dfv";
bool show = false;



class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void calculate() {
      double wt = double.parse(weight.text);
      double ht = double.parse(height.text);
      ht = ht / 3.048;
      double ans = wt / (ht * ht);
      setState(() {
        bmi = ans.toStringAsFixed(2);
        show = true;
      });
      print(bmi);
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      "BMI Calculator",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 80,
                    ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        labelText: 'Weight', border: OutlineInputBorder()),
                    controller: weight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        labelText: 'Height', border: OutlineInputBorder()),
                    controller: height,
                  ),
                ),
                ElevatedButton(onPressed: calculate, child: Text('Calculate')),
                 Container(
                   margin:const EdgeInsets.fromLTRB(60, 20, 60, 0),
                   height:100,
                   width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Card(
                    elevation: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(bmi.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                        Text("Loosely")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
