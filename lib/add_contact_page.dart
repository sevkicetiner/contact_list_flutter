

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywords/Contact.dart';

class AddContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Contact"),
      ),
      body: Form(
        child: AddContactForm(),
      ),
    );
  }
}


class AddContactForm extends StatefulWidget {

  @override
  State createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    String name;
    String phone;


    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  onSaved: (value){name = value;},
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Contact Name"
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return "Name not required";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  onSaved: (value){phone=value;},
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone",
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return "Phone not required";
                    }
                  },
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Submit"),
                onPressed: (){
                    if (_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        Contact.contacts.add(Contact(name,phone));


                    var snackBar = Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("$name hes been saved..."),
                      duration: Duration(microseconds: 500),
                        ));

                    snackBar.closed.then((_){
                      Navigator.pop(context);
                    });

                    }
                },
              )
            ],
          )
      ),
    );
  }
}