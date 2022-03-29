import 'package:flutter/material.dart';

class MyForm extends StatefulWidget
{
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State
{
  void _Calc()
  {
    if(_formKey.currentState!.validate())
    {
      setState(()
      {
        _S = _a * _b;
      }
      );
    }
  }

  final _formKey = GlobalKey<FormState>();
  double _a = 0;
  double _b = 0;
  double _S = 0;

  @override
  Widget build(BuildContext context)
  {
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>
            [
              Row(
                  children: <Widget>
                  [
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Ширина (мм):',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 18
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value)
                                {
                                  if (value!.isEmpty)
                                  {
                                    return 'Задайте ширину';
                                  }
                                  try
                                  {
                                    _a = double.parse(value);
                                  }
                                  catch(e)
                                  {
                                    _a = 0;
                                    //return e.toString();
                                    return 'Не число';
                                  }
                                }
                            )
                        )
                    ),
                  ]
              ),

              const SizedBox(height: 10),

              Row(
                  children: <Widget>
                  [
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Высота (мм):',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 18
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value)
                                {
                                  if (value!.isEmpty)
                                  {
                                    return 'Задайте высоту';
                                  }
                                  try
                                  {
                                    _b = double.parse(value);
                                  }
                                  catch(e)
                                  {
                                    _b = 0;
                                    //return e.toString();
                                    return 'Не число';
                                  }
                                }
                            )
                        )
                    ),
                  ]
              ),

              const SizedBox(height: 10.0),

              ElevatedButton(
                onPressed: (_Calc),


                child: const Text(
                  'Вычислить',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),

              const SizedBox(height: 50.0),

              Text(
                _S == 0 ? 'Задайте параметры' : 'S = $_a * $_b = $_S (мм2)',
                style: const TextStyle(
                    fontSize: 25
                ),
              )
            ]
        )
    );
  }
}

void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Калькулятор площади')
            ),
            body: const MyForm()
        )
    )
);