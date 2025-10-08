import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  var bgColor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,    
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text("Enter Your Weight",),
                      prefixIcon: Icon(
                        Icons.line_weight,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
            SizedBox(
            height: 21,
            ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text("Enter Your Height in ft"),
                      prefixIcon: Icon(
                        Icons.height,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
            SizedBox(
            height: 11,
            ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text("Enter Your Height in inch"),
                      prefixIcon: Icon(
                        Icons.height,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                   SizedBox(
            height: 16,
            ),
            ElevatedButton(
              onPressed: (){
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();
        
                if (wt!="" && ft!="" && inch!="") {
                  // here bmi calculation will come
                  var iWt = int.parse(wt);
                  var iFt = int.parse(ft);
                  var iInch = int.parse(inch);
        
                  var tInch = (iFt * 12) + iInch;
        
                  var tCm = tInch * 2.54;
        
                  var tMtr = tCm / 100;
        
                  var bmi = (iWt / (tMtr * tMtr));

                  var msg = "";

                  if (bmi > 25) {
                    msg = "You are OverWeigtht..";
                    bgColor = Colors.orange.shade200;
                    
                  } else if (bmi < 18){
                    msg = "You are UnderWeigtht..";
                    bgColor = Colors.red.shade200;
                  } else {
                    msg = "You are Healthy";
                    bgColor = Colors.green.shade200;
                  }
        
                  setState(() {
                    result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                  });
                  
                } else{
                  setState(() {
                    result = 'Please fill out all fields';
                  });
        
                }
              },
              child: Text("Calculator"),
              ),
              SizedBox(height: 11,),
              Text(result, style: TextStyle(fontSize: 20),
              ),
              ],
            ),
          ),
        ),
      ),
     
    );
  }
}
