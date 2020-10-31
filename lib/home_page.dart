import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal/logo.dart';
import 'package:flutter_meal/meal_item.dart';
import 'package:flutter_meal/meal_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  String _search = "";
  List<MealItem> _meals = [];
  List<Widget> get activeWidgets => _meals.map((item) => formatResults(item)).toList();


  Widget searchField(){
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(58,195,169,1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset:  Offset(0.0, 10)
          )
        ]
      ),
      child:TextField(
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 18
        ),
        decoration: InputDecoration(
          icon: Icon(Icons.search,
            size: 25, color: Colors.white
          ),
          border: InputBorder.none,
          hintText: "Search for a meal",
          hintStyle: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.normal
          ),
        ),
        onChanged: (text) {
          setState(() {
            _search = text;
          });
          //print(text);
        }
      )
    );
  }
  Widget formatResults(MealItem meal){
    return FlatButton(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset:  Offset(0.0, 10)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
              meal.name,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                color: Color.fromRGBO(105, 105, 108, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(meal.category, style: GoogleFonts.montserrat(
              color: Color.fromRGBO(105, 105, 108, 1),
              fontWeight: FontWeight.normal
            ))
          ]
        ),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MealPage(meal: meal))),
    );
  }

  Future<List<Widget>> fetchMeal(http.Client client) async {
    final response =
        await client.get('https://www.themealdb.com/api/json/v1/1/search.php?s=' + _search.toString());
    
    List<Widget> widgets = parseMeal(response.body).map((item) => formatResults(item)).toList();
    return widgets;
  }

  List<MealItem> parseMeal(String responseBody) {
  
    List<MealItem> list = [];

    if(responseBody.isNotEmpty) {        
      var data = jsonDecode(responseBody);
        //print(data['meals']);
        if(data['meals'] == null){
          return list;
        }
        for (var i = 0; i < data['meals'].length; i++) {
          MealItem s = MealItem(
            id: int.parse(data['meals'][i]['idMeal']),
            name: data['meals'][i]['strMeal'],
            category: data['meals'][i]['strCategory'],
            area: data['meals'][i]['strArea'],
            image: data['meals'][i]['strMealThumb'],
            instructions: data['meals'][i]['strInstructions'],
            ingredients1: data['meals'][i]['strIngredient1'],
            ingredients2: data['meals'][i]['strIngredient2'],
            ingredients3: data['meals'][i]['strIngredient3'],
            ingredients4: data['meals'][i]['strIngredient4'],
            ingredients5: data['meals'][i]['strIngredient5'],
            ingredients6: data['meals'][i]['strIngredient6'],
            ingredients7: data['meals'][i]['strIngredient7'],
            ingredients8: data['meals'][i]['strIngredient8'],
            ingredients9: data['meals'][i]['strIngredient9'],
            ingredients10: data['meals'][i]['strIngredient10'],
            ingredients11: data['meals'][i]['strIngredient11'],
            ingredients12: data['meals'][i]['strIngredient12'],
            ingredients13: data['meals'][i]['strIngredient13'],
            ingredients14: data['meals'][i]['strIngredient14'],
            ingredients15: data['meals'][i]['strIngredient15'],
            ingredients16: data['meals'][i]['strIngredient16'],
            ingredients17: data['meals'][i]['strIngredient17'],
            ingredients18: data['meals'][i]['strIngredient18'],
            ingredients19: data['meals'][i]['strIngredient19'],
            ingredients20: data['meals'][i]['strIngredient20'],

          );
          list.add(s);
        }
    }
    return list;
  }

  Widget results() {
    return FutureBuilder<List>(
      initialData: [Text("HELLER")],
      future: fetchMeal(http.Client()),
      builder: (context, snapshot){
        if(snapshot.hasError ) print(snapshot.error);
        if(_search == null || _search.length == 0){
          return Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Text("Suggestions", style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  )),
                )
              ]
            )
          );
        }
        else{
          return Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: ListView(
              children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text("Results", style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      )),
                    ),
                    Column(children: snapshot.data)
                  ]
                )
              ]
            )
          );
        }
      },
    );
  }

  Widget body(){
    return 
      Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Color.fromRGBO(58,175,169,1), Color.fromRGBO(58,175,169,1)]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
            ) 
          ),
          searchField(),
          results()
        ],
      
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Logo(),
        elevation: 0,
      ),
      body: body()
    );
  }
  
}