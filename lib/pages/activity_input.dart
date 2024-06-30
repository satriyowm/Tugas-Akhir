import 'package:flutter/material.dart';

class ActivityInputPage extends StatefulWidget {
  const ActivityInputPage({super.key});

  @override
  _ActivityInputPageState createState() => _ActivityInputPageState();
}

class _ActivityInputPageState extends State<ActivityInputPage> {
  final _formKey = GlobalKey<FormState>();
  String childName = '';
  String childAge = '';
  String childTemperature = '';
  String childCondition = '';
  String otherFeeling = '';
  String otherItemNeeded = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay bathroomTime = TimeOfDay.now();
  TimeOfDay dropOffTime = TimeOfDay.now(); 

  String toiletType = 'Potty';
  String toiletCondition = 'Wet';
  
  Map<String, Map<String, String>> meals = {
    'breakfast': {'food': '', 'quantity': 'none', 'comments': ''},
    'lunch': {'food': '', 'quantity': 'none', 'comments': ''},
    'dinner': {'food': '', 'quantity': 'none', 'comments': ''},
    'fluids': {'food': '', 'quantity': 'none', 'comments': ''},
    'other': {'food': '', 'quantity': 'none', 'comments': ''},
  };

  String showerTime = '';
  String activityDescription = '';
  String parentNote = '';

  Map<String, bool> feelings = {
    'Sad': false,
    'Happy': false,
    'Confident': false,
    'Naughty': false,
    'Shy': false,
    'Sociable': false,
    'Other': false,
  };

  Map<String, bool> itemsNeeded = {
    'Diapers': false,
    'Towel': false,
    'Hand Towel': false,
    'Soap': false,
    'Shampoo': false,
    'Cream': false,
    'Milk': false,
    'Clothes': false,
    'Tooth Paste': false,
    'Other': false,
  };

Widget buildOtherFeelingTextField() {
  return TextFormField(
    decoration: InputDecoration(
      hintText: 'Other feelings',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onChanged: (val) {
      setState(() {
        otherItemNeeded = val;
      });
    },
  );
}

Widget buildOtherItemNeededTextField() {
  return TextFormField(
    decoration: InputDecoration(
      hintText: 'Other Item Needed',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onChanged: (val) {
      setState(() {
        otherItemNeeded = val;
      });
    },
  );
}

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _selectTime(BuildContext context, TimeOfDay initialTime, Function(TimeOfDay) onTimeSelected) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null) {
      setState(() {
        onTimeSelected(picked);
      });
    }
  }

  _selectBathroomTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: bathroomTime,
    );
    if (picked != null) {
      setState(() {
        bathroomTime = picked;
      });
    }
  }

  void _updateMealQuantity(String mealType, String quantity) {
    setState(() {
      meals[mealType]!['quantity'] = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Input Activity'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 163, 186, 197),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg_activity_input.jpg'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Child Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Child Name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Input The Child\'s Name' : null,
                    onChanged: (val) {
                      setState(() => childName = val);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Age of Child',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter your child\'s age' : null,
                    onChanged: (val) {
                      setState(() => childAge = val);
                    },
                  ),

                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Body Temperature (°C)',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter your child\'s temperature' : null,
                    onChanged: (val) {
                      setState(() => childTemperature = val);
                    },
                  ),

                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Child Condition',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter your child\'s temperature' : null,
                    onChanged: (val) {
                      setState(() => childCondition = val);
                    },
                  ),

                  const SizedBox(height: 10),
                  ListTile(
                    onTap: () => _selectDate(context),
                  ),

                  ListTile(
                    title: Text("Drop-off Date : ${selectedDate}"),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selectDate(context),
                  ),

                                    ListTile(
                    title: Text("Arrival Time: ${dropOffTime.format(context)}"), // Display drop-off time
                    trailing: const Icon(Icons.access_time),
                    onTap: () => _selectTime(context, dropOffTime, (picked) => dropOffTime = picked), // Select drop-off time
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Meals',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...meals.keys.map((mealType) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mealType[0].toUpperCase() + mealType.substring(1),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Food',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              meals[mealType]!['food'] = val;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Quantity:'),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('None'),
                                    value: 'none',
                                    groupValue: meals[mealType]!['quantity'],
                                    onChanged: (val) {
                                      _updateMealQuantity(mealType, val!);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('Some'),
                                    value: 'some',
                                    groupValue: meals[mealType]!['quantity'],
                                    onChanged: (val) {
                                      _updateMealQuantity(mealType, val!);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('Lots'),
                                    value: 'lots',
                                    groupValue: meals[mealType]!['quantity'],
                                    onChanged: (val) {
                                      _updateMealQuantity(mealType, val!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField
(
                          decoration: InputDecoration(
                            hintText: 'Comments',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              meals[mealType]!['comments'] = val;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),

const SizedBox(height: 20),
                  const Text(
                    'Toilet Time',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: Text("Time: ${bathroomTime.format(context)}"), // Display toilet time
                    trailing: const Icon(Icons.access_time),
                    onTap: () => _selectBathroomTime(context), // Select toilet time
                  ),
                  const SizedBox(height: 10),
                  const Text('Type:', style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Potty'),
                          value: 'Potty',
                          groupValue: toiletType,
                          onChanged: (val) {
                            setState(() {
                              toiletType = val!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Diaper'),
                          value: 'Diaper',
                          groupValue: toiletType,
                          onChanged: (val) {
                            setState(() {
                              toiletType = val!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('Dry/Wet/BM:', style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Dry'),
                          value: 'Dry',
                          groupValue: toiletCondition,
                          onChanged: (val) {
                            setState(() {
                              toiletCondition = val!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Wet'),
                          value: 'Wet',
                          groupValue: toiletCondition,
                          onChanged: (val) {
                            setState(() {
                              toiletCondition = val!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('BM'),
                          value: 'BM',
                          groupValue: toiletCondition,
                          onChanged: (val) {
                            setState(() {
                              toiletCondition = val!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Activities',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Activities Description',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() => activityDescription = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Note to Parents',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Note',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() => parentNote = val);
                    },
                  ),

Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Children's Feelings",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ...feelings.keys.map((String key) {
                      if (key == 'Other') {
                        return CheckboxListTile(
                          title: Text(key),
                          value: feelings[key],
                          onChanged: (bool? value) {
                            setState(() {
                              feelings[key] = value!;
                              if (value == true) otherFeeling = '';
                            });
                          },
                        );
                      }
                      return CheckboxListTile(
                        title: Text(key),
                        value: feelings[key],
                        onChanged: (bool? value) {
                          setState(() {
                            feelings[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                    if (feelings['Other'] == true) buildOtherFeelingTextField(),
                  ],
                ),


Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Items the Child Needs',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ...itemsNeeded.keys.map((String key) {
                      if (key == 'Other') {
                        return CheckboxListTile(
                          title: Text(key),
                          value: itemsNeeded[key],
                          onChanged: (bool? value) {
                            setState(() {
                              itemsNeeded[key] = value!;
                              if (value == true) otherItemNeeded = '';
                            });
                          },
                        );
                      }
                      return CheckboxListTile(
                        title: Text(key),
                        value: itemsNeeded[key],
                        onChanged: (bool? value) {
                          setState(() {
                            itemsNeeded[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                    if (itemsNeeded['Other'] == true) buildOtherItemNeededTextField(),
                  ],
                ),


                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Children's activities have been saved")),
                          );
                        }
                      },
                      child: const Text('Save'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 163, 186, 197),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
