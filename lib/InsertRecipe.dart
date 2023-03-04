import 'dart:io';

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import './Component/roundButton.dart';
import './Component//Utils.dart';


class InsertRecipe extends StatefulWidget {
  const InsertRecipe({Key? key}) : super(key: key);
  

  @override
  State<InsertRecipe> createState() => _InsertRecipeState();
}

class _InsertRecipeState extends State<InsertRecipe> {
    // ignore: deprecated_member_use
    final _formKey = GlobalKey<FormState>();
    final databaseRef = FirebaseDatabase.instance.ref().child('Todos');
    bool loading = false ;
   final AnimaldescriptionController = TextEditingController();
   final animalidController = TextEditingController();
   final AnimalnameController = TextEditingController();






  

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,

    child: Scaffold(
    
      body: SingleChildScrollView(
        child :Column(
          children:[ 
            
            Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                 
                  color: Color(0x1f000000),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        "Add Soil Animals",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Divider(
                    //   color: Colors.white,
                    //   height: 16,
                    //   thickness: 5,
                    //   indent: 100,
                    //   endIndent: 100,
                    // ),
                  ],
                ),
              ),
            
            
            
            Padding(
            padding : const EdgeInsets.symmetric(vertical:10,horizontal: 20),
          //  child :Form(
          //        key: _formKey,
          child:Column(children: [
           
        
            SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                 controller: AnimalnameController,
                  maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                   ),
                decoration: InputDecoration(
                  filled: true,
                   fillColor: Color(0xff306f60),     
                   hintStyle: (
                        TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                  hintText: 'Insert Animal Name',
                 
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                ),
              ),
        
             SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                 controller: animalidController,
                  maxLines: 1,
                 style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                   ),
                 
                decoration: InputDecoration(
                  filled: true,
                   fillColor: Color(0xff306f60),     
                   hintStyle: (
                        TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                  hintText: 'Insert Animal ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                ),
              ),
        
        
               SizedBox(
                 height: 30,
                ),
            
               TextFormField(
                   keyboardType: TextInputType.text,
                   controller: AnimaldescriptionController,
                    maxLines: 4,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                   ),
                   decoration: InputDecoration(
                   filled: true,
                   fillColor: Color(0xff306f60),     
                   hintStyle: (
                        TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                   
                  hintText: 'Insert Animal Description',
                
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                   disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                ),
                
        
               
              ),
              SizedBox(
                height: 30,
              ),
               RoundButton(title: 'Submit', loading: loading,
                      
                      onTap: () async{
              
                      setState(() {
                        loading = true;
                      });
                  
                    int date = DateTime.now().millisecondsSinceEpoch;
                   
                   
                    await Future.value().then((value)async{
                     
                     
              
                   
                  
                    String id  = DateTime.now().millisecondsSinceEpoch.toString() ;
                    databaseRef.child(id)
                  
                        .set({
                           'animalid': animalidController.text.toString(),
                          'animalname':AnimalnameController.text.toString(),
                           'animaldesd':AnimaldescriptionController.text.toString(),
                       
                           'id' : id
                        });
                   
                   
        
        
                    }).then((value) {
                      
                      toastMessage ('Animal Added Successfully');
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InsertRecipe()));
                      setState(() {
                        loading = false;
                      });
                      
                      
                      
          
                    }).onError((error, stackTrace) {
                      toastMessage ('Animal Added Failed');
                           setState(() {
                            loading = false ;
                           });
        
                           print(error);
                }).onError((error, stackTrace){
                       Utils().toastMessage(error.toString());
                }); 
                      }
              ),
          ],),
              // ),
              ),
          ]
        ),
    ),
    )
    );
  }
}

                    

  void toastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
