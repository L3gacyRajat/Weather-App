import 'package:flutter/material.dart';
import 'package:weather_app/models/loading.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  String cityvalue = 'Delhi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/searcha.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black38),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Any Location',
                        hintStyle: TextStyle(
                          color: Colors.yellowAccent
                        ),
                        labelText: "Search",
                        labelStyle: TextStyle(
                            color: Colors.greenAccent,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(onPressed: (){
    if (_formKey.currentState!.validate()) {
      cityvalue = namecontroller.text;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Loading(
                  cityname: cityvalue,
                ),
          ));
      print(namecontroller.text);
    }
                        }, icon: Icon(Icons.search,
                        color: Colors.white,),)
                      ),
                      controller: namecontroller,
                      maxLength: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cityvalue = namecontroller.text;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Loading(
                                    cityname: cityvalue,
                                  ),
                                ));
                            print(namecontroller.text);
                            namecontroller.clear();
                            //   Navigator.pop(context);
                            /*   ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data'),
                     backgroundColor: Colors.red.withOpacity(0.8),
                     ),
                    ); */
                          }
                        },
                        child: Text("Search")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
