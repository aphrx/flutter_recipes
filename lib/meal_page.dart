import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal/meal_item.dart';
import 'package:google_fonts/google_fonts.dart';

class MealPage extends StatelessWidget{
  MealItem meal; 
  MealPage({this.meal});

  Widget ingredients(){
    List<Widget> ingredientsFormatted = [];
    List<String> ingredients = [
      meal.ingredients1, 
      meal.ingredients2, 
      meal.ingredients3, 
      meal.ingredients4, 
      meal.ingredients5, 
      meal.ingredients6, 
      meal.ingredients7, 
      meal.ingredients8, 
      meal.ingredients9, 
      meal.ingredients10, 
      meal.ingredients11,
      meal.ingredients12, 
      meal.ingredients13,
      meal.ingredients14, 
      meal.ingredients15, 
      meal.ingredients16, 
      meal.ingredients17,
      meal.ingredients18, 
      meal.ingredients19,
      meal.ingredients20
    ];
    print(ingredients);
    ingredients.forEach((ingredient) {
      if(ingredient != null && ingredient != ""){
        ingredientsFormatted.add(
          Text("- " + ingredient, 
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal
            ),
          ),
        );
      }
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredientsFormatted
    );

  }

  Widget body(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[Color.fromRGBO(58,175,169,1), Color.fromRGBO(58,175,169,1)]),
      ),
      child: ListView(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset:  Offset(0.0, 10)
                    )
                  ]
                ),
                child: Image.network(meal.image),
              )
            ],
          ),
          Text("Ingredients", 
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ingredients()
          ),
          Text("Instructions", 
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(meal.instructions.replaceAll('\r\n', '\r\n\n'), 
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),
            )
          ),
          
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[Color.fromRGBO(58,175,169,1), Color.fromRGBO(58,175,169,1)])
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(meal.name, style: GoogleFonts.montserrat(color: Color.fromRGBO(58,175,169,1), fontSize: 22, fontWeight: FontWeight.w600)),
          elevation: 0,
          leading: 
            IconButton(
              icon: Icon(
                Icons.chevron_left, 
                color: Color.fromRGBO(58,175,169,1),
                size: 30
              ), 
              onPressed: () => Navigator.of(context).pop()
            )
          ,
        ),
        backgroundColor: Colors.transparent,
        body: body()
      )
    );
  }
  
}