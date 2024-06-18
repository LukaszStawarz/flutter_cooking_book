import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ksiazkakucharska/models/meal.dart';
import 'package:ksiazkakucharska/providers/category_provider.dart';
import 'package:ksiazkakucharska/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class AddMealScreen extends StatefulWidget {
  final Meal? meal;

  const AddMealScreen({
    this.meal,
    super.key,
  });

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dishNameController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController ingradientsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedCategory = '';
  Affordability? selectedAffordability;
  Complexity? selectedComplexity;
  String? imageUrl;
  File? pickedFile;

  final List<String> ingradientsList = [];
  final List<String> steps = [];

  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  final GlobalKey<_DropDownWidgetState> categoriesKey = GlobalKey();
  final GlobalKey<_DropDownWidgetState> costKey = GlobalKey();
  final GlobalKey<_DropDownWidgetState> levelKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    if (widget.meal != null) {
      final categories = context.read<CategoryProvider>().categories;
      final category = categories
          .where((element) => element.id == widget.meal!.categories.first)
          .firstOrNull;
      dishNameController.text = widget.meal!.title;
      timeController.text = widget.meal!.duration.toString();
      ingradientsList.addAll(widget.meal!.ingredients);
      steps.addAll(widget.meal!.steps);
      selectedAffordability = widget.meal!.affordability;
      selectedComplexity = widget.meal!.complexity;
      selectedCategory = category?.title ?? '';
      isGlutenFree = widget.meal!.isGlutenFree;
      isVegan = widget.meal!.isVegan;
      isVegetarian = widget.meal!.isVegetarian;
      isLactoseFree = widget.meal!.isLactoseFree;
      setState(() {});
    }
  }

  void clearData() {
    isGlutenFree = false;
    isVegan = false;
    isVegetarian = false;
    isLactoseFree = false;
    steps.clear();
    ingradientsList.clear();
    selectedComplexity = null;
    selectedAffordability = null;
    selectedCategory = '';
    descriptionController.clear();
    ingradientsController.clear();
    timeController.clear();
    dishNameController.clear();
    categoriesKey.currentState?.clearData();
    costKey.currentState?.clearData();
    levelKey.currentState?.clearData();
    setState(() {});
  }

  @override
  void dispose() {
    dishNameController.dispose();
    timeController.dispose();
    ingradientsController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catagoriesProvider = context.watch<CategoryProvider>();
    final mealProvider = context.watch<MealProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        foregroundColor: Colors.white,
        title: const Text(
          'Dodaj/edytuj przepis',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: mealProvider.isAdding
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextInputWidget(
                        title: 'Nazwa dania',
                        hint: 'Wpisz nazwę dania',
                        controller: dishNameController,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DropDownWidget(
                        key: categoriesKey,
                        title: 'Kategorie',
                        hint: 'Podaj kategorię dania',
                        options: catagoriesProvider.categories
                            .map((e) => e.title)
                            .toList(),
                        onChanged: (p0) {
                          selectedCategory = p0;
                        },
                        initialValue: selectedCategory ?? '',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DropDownWidget(
                        title: 'Koszt',
                        hint: 'Podaj koszt dania',
                        onChanged: (p0) {
                          selectedAffordability =
                              AffordabilityMapper.mapStringToAfforability(p0);
                        },
                        options:
                            Affordability.values.map((e) => e.name).toList(),
                        initialValue: selectedAffordability?.name ?? '',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DropDownWidget(
                        title: 'Trudność',
                        hint: 'Podaj trudność przygotowania dania',
                        onChanged: (p0) {
                          selectedComplexity =
                              ComplexityMapper.mapStringToComplexity(p0);
                        },
                        options: Complexity.values.map((e) => e.name).toList(),
                        initialValue: selectedComplexity?.name ?? '',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ImagePickerWidget(
                        onFileSelected: (p0) {
                          pickedFile = p0;
                          setState(() {});
                        },
                        imagePath: widget.meal?.imageUrl,
                      ),
                      const SizedBox(height: 15),
                      TextInputWidget(
                        title: 'Czas przygotowania',
                        hint: 'Podaj czas przygotowania dania',
                        controller: timeController,
                        formaters: [
                          IntegerResetFormatter(),
                        ],
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(height: 12),
                      TextInputWidgetWithButton(
                        title: 'Składniki',
                        hint: 'Podaj składniki',
                        onItemAddedFromTextField: (p0) {
                          ingradientsList.add(p0);
                        },
                        onItemRemoved: (p0) {
                          ingradientsList.removeAt(p0);
                        },
                        dataList: ingradientsList,
                        subtitle: 'Dodane składniki',
                      ),
                      const SizedBox(height: 12),
                      TextInputWidgetWithButton(
                        title: 'Przygotowanie',
                        hint: 'Podaj kroki potrzebne do przygotowania dania',
                        onItemAddedFromTextField: (p0) {
                          steps.add(p0);
                        },
                        onItemRemoved: (p0) {
                          steps.removeAt(p0);
                        },
                        dataList: steps,
                        subtitle: 'Podane kroki',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SwitchListTile(
                          title: const Text(
                            'Czy danie jest bez glutenu?',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: isGlutenFree,
                          onChanged: (value) {
                            isGlutenFree = value;
                            setState(() {});
                          }),
                      SwitchListTile(
                        title: const Text(
                          'Czy danie jest wegańskie?',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: isVegan,
                        onChanged: (value) {
                          isVegan = value;
                          setState(() {});
                        },
                      ),
                      SwitchListTile(
                        title: const Text(
                          'Czy danie jest wegetariańskie?',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: isVegetarian,
                        onChanged: (value) {
                          isVegetarian = value;
                          setState(() {});
                        },
                      ),
                      SwitchListTile(
                        title: const Text(
                          'Czy danie jest bez laktozy?',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: isLactoseFree,
                        onChanged: (value) {
                          isLactoseFree = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 32.0),
                      ElevatedButton(
                        onPressed: () async {
                          if (widget.meal == null) {
                            final selectedCategoryObj = context
                                .read<CategoryProvider>()
                                .categories
                                .where((element) =>
                                    element.title == selectedCategory)
                                .first;

                            String? url = '';
                            if (pickedFile != null) {
                              url = await context
                                  .read<MealProvider>()
                                  .addPhoto(pickedFile!);
                            }
                            final Meal meal = Meal(
                              id: '',
                              categories: [selectedCategoryObj.id ?? ''],
                              title: dishNameController.text,
                              imageUrl: url,
                              ingredients: ingradientsList,
                              steps: steps,
                              duration: int.tryParse(timeController.text) ?? 0,
                              complexity:
                                  selectedComplexity ?? Complexity.proste,
                              affordability:
                                  selectedAffordability ?? Affordability.tanie,
                              isGlutenFree: isGlutenFree,
                              isLactoseFree: isLactoseFree,
                              isVegan: isVegan,
                              isVegetarian: isVegetarian,
                            );

                            await context.read<MealProvider>().addMeal(meal);
                            ScaffoldMessenger.of(context)
                              ..showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.purple,
                                  content: Text('Pomyślnie dodałeś danie'),
                                ),
                              );
                            clearData();
                          } else {
                            final selectedCategoryObj = context
                                .read<CategoryProvider>()
                                .categories
                                .where((element) =>
                                    element.title == selectedCategory)
                                .first;

                            String? url = '';
                            print(pickedFile);
                            if (pickedFile != null) {
                              url = await context
                                  .read<MealProvider>()
                                  .addPhoto(pickedFile!);
                            }
                            final Meal meal = Meal(
                              id: widget.meal!.id,
                              categories: [selectedCategoryObj.id ?? ''],
                              title: dishNameController.text,
                              imageUrl: url,
                              ingredients: ingradientsList,
                              steps: steps,
                              duration: int.tryParse(timeController.text) ?? 0,
                              complexity:
                                  selectedComplexity ?? Complexity.proste,
                              affordability:
                                  selectedAffordability ?? Affordability.tanie,
                              isGlutenFree: isGlutenFree,
                              isLactoseFree: isLactoseFree,
                              isVegan: isVegan,
                              isVegetarian: isVegetarian,
                            );

                            await context.read<MealProvider>().updateMeal(meal);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.purple,
                                content: Text('Pomyślnie edytowałeś danie'),
                              ),
                            );
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Zapisz'),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final _glutenFreeFilterSet = false;
  final _lactoseFreeFilterSet = false;
  final _veganFilterSet = false;
  final _vegetarianFilterSet = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
            title: const Text(
              'Czy danie jest bez glutenu?',
              style: TextStyle(color: Colors.white),
            ),
            value: _glutenFreeFilterSet,
            onChanged: (_glutenFreeFilterSet) {
              _glutenFreeFilterSet = true;
            }),
        SwitchListTile(
          title: const Text(
            'Czy danie jest wegańskie?',
            style: TextStyle(color: Colors.white),
          ),
          value: _veganFilterSet,
          onChanged: (_veganFilterSet) {
            _veganFilterSet = true;
          },
        ),
        SwitchListTile(
          title: const Text(
            'Czy danie jest wegetariańskie?',
            style: TextStyle(color: Colors.white),
          ),
          value: _vegetarianFilterSet,
          onChanged: (_vegetarianFilterSet) {
            _vegetarianFilterSet = true;
          },
        ),
        SwitchListTile(
          title: const Text(
            'Czy danie jest bez laktozy?',
            style: TextStyle(color: Colors.white),
          ),
          value: _lactoseFreeFilterSet,
          onChanged: (_lactoseFreeFilterSet) {
            _lactoseFreeFilterSet = true;
          },
        ),
      ],
    );
  }
}

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    required this.hint,
    required this.title,
    required this.controller,
    this.formaters,
    this.textInputType,
  });

  final String hint;
  final String title;
  final TextEditingController controller;
  final List<TextInputFormatter>? formaters;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:
              TextStyle(color: Colors.purple[300], fontWeight: FontWeight.bold),
        ),
        TextField(
          keyboardType: textInputType,
          controller: controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white38)),
          style: const TextStyle(color: Colors.white),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          inputFormatters: formaters ?? [],
        ),
      ],
    );
  }
}

class TextInputWidgetWithButton extends StatefulWidget {
  const TextInputWidgetWithButton({
    super.key,
    required this.hint,
    required this.title,
    required this.subtitle,
    required this.onItemAddedFromTextField,
    required this.onItemRemoved,
    required this.dataList,
  });

  final String hint;
  final String title;
  final String subtitle;
  final List<String> dataList;
  final Function(String) onItemAddedFromTextField;
  final Function(int) onItemRemoved;

  @override
  State<TextInputWidgetWithButton> createState() =>
      _TextInputWidgetWithButtonState();
}

class _TextInputWidgetWithButtonState extends State<TextInputWidgetWithButton> {
  final List<String> addedIngradients = [];
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    addedIngradients.addAll(widget.dataList);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.purple[300], fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 3 / 4,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: widget.hint,
                    hintStyle: const TextStyle(color: Colors.white38)),
                style: const TextStyle(color: Colors.white),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
            IconButton(
              color: Colors.purple[300],
              onPressed: () {
                final ingradient = controller.text;
                widget.onItemAddedFromTextField(ingradient);

                addedIngradients.add(ingradient);
                controller.clear();

                setState(() {});
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        if (addedIngradients.isNotEmpty)
          Text(
            '${widget.subtitle}:',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        for (int i = 0; i < addedIngradients.length; i++)
          Row(
            children: [
              IconButton(
                onPressed: () {
                  addedIngradients.removeAt(i);
                  widget.onItemRemoved(i);
                  setState(() {});
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              Flexible(
                child: Text(
                  addedIngradients[i],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.hint,
    required this.title,
    required this.onChanged,
    required this.options,
    required this.initialValue,
  });
  final String hint;
  final String title;
  // final GlobalKey formKey;
  final String initialValue;

  final Function(String) onChanged;
  final List<String> options;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? _selectedOption1 = '';

  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != '') {
      _selectedOption1 = widget.initialValue;
    } else if (widget.options.isNotEmpty) {
      _selectedOption1 = widget.options.first;
    }
    print(widget.options);

    return Column(
      children: [
        Text(
          widget.title,
          style:
              TextStyle(color: Colors.purple[300], fontWeight: FontWeight.bold),
        ),
        DropdownButtonFormField<String>(
          dropdownColor: Colors.grey,
          value: _selectedOption1,
          items: widget.options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            widget.onChanged.call(newValue ?? '');
            setState(() {
              _selectedOption1 = newValue;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.white38),
          ),
          validator: (value) {
            if (value == null) {
              return 'Wybierz jakąś opcję';
            }
            return null;
          },
        ),
      ],
    );
  }

  void clearData() {
    _selectedOption1 = '';
    setState(() {});
  }
}

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
    required this.onFileSelected,
    required this.imagePath,
  });

  final Function(File) onFileSelected;
  final String? imagePath;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final picker = ImagePicker();
  File? image;
  Future getImageFromGallery() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (photo != null) {
        image = File(photo.path);
        widget.onFileSelected.call(File(photo.path));
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Take a picture'),
            onPressed: () async {
              await getImageFromGallery().then(
                (value) => Navigator.of(context).pop(),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (image != null ||
            (widget.imagePath != null && widget.imagePath != ''))
          Expanded(
            child: Container(
              height: 164.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
              ),
              child: (widget.imagePath != null && widget.imagePath != '')
                  ? Image.network(widget.imagePath!)
                  : Image.file(image!),
            ),
          ),
        Flexible(
          child: ElevatedButton(
            onPressed: showOptions,
            child: Text(
              'Dodaj zdjęcie',
              style: TextStyle(color: Colors.purple[300]),
            ),
          ),
        ),
      ],
    );
  }
}

class IntegerResetFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int? newInt = int.tryParse(newValue.text);
    if (newInt == null) {
      return oldValue;
    }

    return newValue;
  }
}
