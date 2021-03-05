import 'package:Market/providers/product.dart';
import 'package:Market/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/Edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _categoryFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageURLController = TextEditingController();
  final _imageURLFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  String _selectedCategory;
  List<String> _categories = ['Shirts', 'Pants', 'Scarves', 'Kitchen'];
  var _editedProd = Product(
    id: null,
    categoryId: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );
  var _initValues = {
    'title': '',
    'categoryId': '',
    'description': '',
    'price': '',
    'imageURL': '',
  };
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final prodId = ModalRoute.of(context).settings.arguments as String;
      if (prodId != null) {
        _editedProd = Provider.of<Products>(context, listen: false)
            .productItems
            .firstWhere((element) => element.id == prodId);
        _initValues = {
          'title': _editedProd.title,
          'categoryId': _editedProd.categoryId,
          'description': _editedProd.description,
          'price': _editedProd.price.toString(),
          'imageURL': '',
        };
        _imageURLController.text = _editedProd.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_editedProd.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProd.id, _editedProd);
    } else {
      Provider.of<Products>(context, listen: false).addNewProduct(_editedProd);
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _imageURLFocusNode.addListener(_updateImageURL);
    super.initState();
  }

  void _updateImageURL() {
    if (!_imageURLFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _imageURLFocusNode.removeListener(_updateImageURL);
    _categoryFocusNode.dispose();
    _imageURLFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageURLController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                _saveForm();
              },
              child: Text(
                'Save',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_categoryFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please provide a title.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProd = Product(
                    id: _editedProd.id,
                    categoryId: _editedProd.categoryId,
                    title: value,
                    price: _editedProd.price,
                    description: _editedProd.description,
                    imageUrl: _editedProd.imageUrl,
                    isFavourite: _editedProd.isFavourite,
                  );
                },
              ),
              DropdownButtonFormField(
                hint: Text('Please choose a category'),
                value: _selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    child: new Text(category),
                    value: category,
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please choose a category!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProd = Product(
                    id: _editedProd.id,
                    categoryId: value,
                    title: _editedProd.title,
                    price: _editedProd.price,
                    description: _editedProd.description,
                    imageUrl: _editedProd.imageUrl,
                    isFavourite: _editedProd.isFavourite,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than Zero!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProd = Product(
                    id: _editedProd.id,
                    categoryId: _editedProd.categoryId,
                    title: _editedProd.title,
                    price: double.parse(value),
                    description: _editedProd.description,
                    imageUrl: _editedProd.imageUrl,
                    isFavourite: _editedProd.isFavourite,
                  );
                },
              ),
              TextFormField(
                  initialValue: _initValues['description'],
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.next,
                  focusNode: _descriptionFocusNode,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (value) {
                    _editedProd = Product(
                      id: _editedProd.id,
                      categoryId: _editedProd.categoryId,
                      title: _editedProd.title,
                      price: _editedProd.price,
                      description: value,
                      imageUrl: _editedProd.imageUrl,
                      isFavourite: _editedProd.isFavourite,
                    );
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a description.';
                    }
                    if (value.length < 10) {
                      return 'should be at least 10 characters!';
                    }
                    return null;
                  }),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageURLController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(_imageURLController.text),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image Url'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageURLController,
                        focusNode: _imageURLFocusNode,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        onSaved: (value) {
                          _editedProd = Product(
                            id: _editedProd.id,
                            categoryId: _editedProd.categoryId,
                            title: _editedProd.title,
                            price: _editedProd.price,
                            description: _editedProd.description,
                            imageUrl: value,
                            isFavourite: _editedProd.isFavourite,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide an image URL.';
                          }
                          return null;
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
