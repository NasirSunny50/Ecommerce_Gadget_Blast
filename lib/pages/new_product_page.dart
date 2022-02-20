import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const catList = [
  'Desktop',
  'Laptop',
  'Component',
  'Monitor',
  'UPS',
  'Tablet',
  'Office Equipment',
  'Camera',
  'Security',
  'Networking',
  'Accessories',
  'Software',
  'TV',
  'Gadget',
  'Gaming'
];

class NewProductPage extends StatefulWidget {
  static const String routeName = '/new_product';

  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _purchasePriceController = TextEditingController();
  final _salePriceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _qtyController = TextEditingController();

  String? category;
  DateTime? purchaseDate;

  @override
  void dispose() {
    _nameController.dispose();
    _purchasePriceController.dispose();
    _salePriceController.dispose();
    _descriptionController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
              onPressed: _saveProduct,
              icon: Icon(Icons.done_outline_rounded))
        ],
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Product Name',
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),


            TextFormField(
              controller: _purchasePriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Purchase Price',
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),


            TextFormField(
              controller: _salePriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Sale Price',
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),


            TextFormField(
              controller: _descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Product Description',
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),


            TextFormField(
              controller: _qtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Product Quantity',
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),

            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: DropdownButtonFormField<String>(
                  hint: Text('Category'),
                  value: category,
                  onChanged: (value){
                    setState(() {
                      category = value;
                    });
                  },
                  items: catList.map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  )).toList(),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                )
              ),
            ),


            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: _showDatePickerDialog,
                        child: Text('Select Purchase Date', style: TextStyle(color: Colors.orange),),
                    ),
                    Text(purchaseDate == null ? 'No Date Chosen' : DateFormat('dd/MM/yyyy').format(purchaseDate!))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDatePickerDialog() async{
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 2),
        lastDate: DateTime.now());

    if(selectedDate != null){
      setState(() {
        purchaseDate = selectedDate;
      });
    }
  }

  void _saveProduct() {
  }
}
