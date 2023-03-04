import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:recipe/InsertRecipe.dart';


 
class FetchRecipe extends StatefulWidget {
  const FetchRecipe({Key? key}) : super(key: key);
 
  @override
  State<FetchRecipe> createState() => _FetchRecipeState();
}
 
class _FetchRecipeState extends State<FetchRecipe> {
  
  Query dbRef = FirebaseDatabase.instance.ref().child('recipe');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('recipe');
  
  Widget listItem({required Map Recipe}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(24),
      height: 115,
      
      decoration: BoxDecoration(
                          color: Color(0xff306f60),
                          borderRadius: BorderRadius.circular(20),
                             border: Border.all(color: Color(0xff6ED1BA), width: 2),
                        ),
      child: Row(
        children:[ 
          Container(
            width: 200,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text(
                Recipe['recipeid'],
                style: 
                TextStyle(
                 fontSize: 30,
                 fontWeight: FontWeight.bold,
                 color: Colors.white
                  ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                Recipe['recipename'],
                style: TextStyle(
                   fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                  ),
              ),

            ]
            ),
          ),
             
           
              Container(
                 alignment: Alignment.centerRight,
                   margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      // onTap: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (_) => editBacteriaRecord(BacteriaKey: Bacteria['key'])));
                      // },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_outlined,
                             color: Colors.white, 
                             size: 37
                          ),
                        ],
                          
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        reference.child(Recipe['key']).remove();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline, 
                            color: Color(0xffDFBAB1), 
                            size:40,
                          ),
                        ],
                      ),
                    
                    ),
                  ],
                ),
              
           
          ),
        ]
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: 
          Column(
            children:[ 
              
            Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage("assets/1.png"),
                  //   fit: BoxFit.cover,
                  // ),
                  color: Color(0x1f000000),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  border: Border.all(color: Color(0xff6ED1BA), width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: const Text(
                        "Recipe",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  
                  ],
                ),
              ),
              
              
              Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.topRight,
              
              child: IconButton(
                onPressed:() {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => InsertRecipe()));
                },
                icon: Icon(Icons.add,size: 50, color: Color(0xff003F36),)
                )
            ),
              
              Expanded(
                
                
                child: FirebaseAnimatedList(
                 query: dbRef,
                 itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                 
                   Map Recipe = snapshot.value as Map;
                  Recipe['key'] = snapshot.key;
                 
                return listItem(Recipe: Recipe);
                 
              },
            ),
                  ),
            ],
          ),
      
    );
  }
}
 