import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        foregroundColor: Colors.white,
        title: const Text(
          'Dodaj swój przepis :)',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const TextInputWidget(
                hint: 'Wpisz nazwę dania',
              ),
              const SizedBox(
                height: 10,
              ),
              const DropDownWidget(
                hint: 'Podaj kategorię dania',
              ),
              const SizedBox(
                height: 10,
              ),
              const DropDownWidget(
                hint: 'Podaj koszt dania',
              ),
              const SizedBox(
                height: 10,
              ),
              const DropDownWidget(
                hint: 'Podaj trudność przygotowania dania',
              ),
              const SizedBox(
                height: 10,
              ),
              ImagePickerWidget(),
              const SizedBox(height: 10),
              const TextInputWidget(
                hint: 'Podaj czas przygotowania dania',
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Zapisz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38)),
      style: const TextStyle(color: Colors.white),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key, required this.hint});
  final String hint;
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

String? _selectedOption1;
String? _selectedOption2;

final List<String> _options1 = ['Option 1', 'Option 2', 'Option 3'];
final List<String> _options2 = ['Choice A', 'Choice B', 'Choice C'];

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedOption1,
      items: _options1.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedOption1 = newValue;
        });
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.white38)),
      validator: (value) {
        if (value == null) {
          return 'Wybierz jakąś opcję';
        }
        return null;
      },
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({
    super.key,
  });

  set image(File image) {}

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final picker = ImagePicker();
  late File image;
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        widget.image = File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: showOptions,
      child: const Text('Dodaj zdjęcie'),
    );
  }
}
