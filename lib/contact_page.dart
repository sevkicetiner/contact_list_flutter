
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mywords/add_contact_page.dart';
import 'Contact.dart';

class ContactPage extends StatefulWidget {




  @override
  _ContactPageState createState() => _ContactPageState();

}


class _ContactPageState extends State<ContactPage>{

  List<Contact> contacts;

  @override
  void initState() {
    contacts = Contact.contacts;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: new AppBar(
        title: Text("ilk app "),
      ),
      body:Container(
        child: ListView.builder(
            itemCount: Contact.contacts.length,
            itemBuilder: (BuildContext context, int index){
              Contact contact = Contact.contacts[index];
              return Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(backgroundImage: NetworkImage("https://placekitten.com/200/200"),),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(contact.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),),
                          Text(contact.phoneNumber)
                        ],
                      ),
                    )
                    ,
                    Divider()

                  ],
                ),
              );

            })
        ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=> AddContactPage()
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}