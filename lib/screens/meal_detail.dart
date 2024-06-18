import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ksiazkakucharska/models/meal.dart';
import 'package:ksiazkakucharska/screens/add_meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        foregroundColor: Colors.white,
        title: Text(
          meal.title,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AddMealScreen(
                      meal: meal,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (meal.imageUrl != '')
              Hero(
                tag: '${meal.imageUrl}',
                child: Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            if (meal.imageUrl == '')
              Container(
                height: 300,
                color: Colors.white,
                child: const Center(
                  child: Text('Brak zdjęcia'),
                ),
              ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Składniki',
              style: GoogleFonts.poppins(
                  color: Colors.amberAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Przygotowanie',
              style: GoogleFonts.poppins(
                  color: Colors.amberAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
