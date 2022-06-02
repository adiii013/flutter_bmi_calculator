import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController height = TextEditingController();
TextEditingController weight = TextEditingController();
String? bmi;
String? answer;
bool show = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void calculate() {
      double wt = double.parse(weight.text);
      double ht = double.parse(height.text);
      ht = ht / 3.2808;
      double ans = wt / (ht * ht);
      setState(() {
        bmi = ans.toStringAsFixed(2);
        show = true;
        if (ans >= 18.5 && ans <= 24.9)
          answer = "Healthy";
        else if (ans < 18.5)
          answer = "Underweight";
        else
          answer = "Overweight";
      });
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        "BMI Calculator",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 40,
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
                GestureDetector(
                  child: AnimatedContainer(
                    width: (show)? 200 : 400,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    duration: Duration(seconds: 1),
                    color: (show)?Colors.purple:Colors.purple[300],
                    curve: Curves.fastOutSlowIn,
                    child: Center(
                        child: Text(
                      'Calculate',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  onTap: calculate,
                ),
                (show) ? Container(
                  
                  margin: const EdgeInsets.fromLTRB(60, 20, 60, 0),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Card(
                    elevation: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bmi.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(answer.toString(),style: TextStyle(fontSize: 21),),
                      ],
                    ),
                  ),
                ):Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
