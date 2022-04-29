import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddFriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: AppBar(
            backgroundColor: Colors.grey[200],
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              child: FaIcon(FontAwesomeIcons.chevronDown,color: Colors.black,size: 20),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text("Add Friends",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: FaIcon(FontAwesomeIcons.ellipsis,color: Colors.black,size: 20),
                          )
                        )
                      ]
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black12
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.blue[900],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          prefixIconConstraints: BoxConstraints(minWidth: 30),
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left:10, right: 10),
                            child: FaIcon(FontAwesomeIcons.magnifyingGlass, color: Colors.black, size: 20),
                          ),
                          hintText: "Find Friends",
                          hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal:15, vertical: 5),
                            child: FaIcon(FontAwesomeIcons.qrcode, color: Colors.black, size: 20),
                          )
                        )
                      )
                    )
                  ]
                )
              )
            )
          )
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Added Me",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black26,
                    ),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {

                      String userName = (index % 3 == 0) ? "Britney" : "Rico";
                      String userNameAccount = (index % 3 == 0) ? "Britney356" : "RicoSa39";
                      String userDate = (index % 3 == 0) ? "BY PHONE #" : "IN MY CONTACTS";
                      String userImg = (index % 3 == 0) ? "assets/friend-2.jpg" : "assets/friend-1.png";
                      
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(userImg),
                        ),
                        title: Text(userName),
                        subtitle: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child:Text(userNameAccount,style: TextStyle(color: Colors.grey,fontSize:11))
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child:Text(userDate,style: TextStyle(color: Colors.black,fontSize:9))
                                    )
                                  ]
                                )
                              )
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.userPlus,size: 13),
                                      Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                                      Text("Accept",style: TextStyle(color: Colors.black,fontSize:15,fontWeight: FontWeight.bold))
                                    ]
                                  )
                                ),
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Center(child: FaIcon(FontAwesomeIcons.xmark,color: Colors.grey[300],size: 15)),
                              )
                            )
                          ]
                        )
                      );
                    } 
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Text("Quick Add",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                        )
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            children: [
                              Text("All Contacts",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: Colors.black54)),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                              FaIcon(FontAwesomeIcons.chevronRight,color: Colors.black54,size: 10)
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black26,
                    ),
                    shrinkWrap: true,
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {

                      String userName = (index % 3 == 0) ? "Britney" : "Rico";
                      String userNameAccount = (index % 3 == 0) ? "Britney356" : "RicoSa39";
                      String userDate = (index % 3 == 0) ? "RECENTLY JOINED" : "IN MY CONTACTS";
                      String userImg = (index % 3 == 0) ? "assets/friend-2.jpg" : "assets/friend-1.png";
                    
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(userImg),
                        ),
                        title: Text(userName),
                        subtitle: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child:Text(userNameAccount,style: TextStyle(color: Colors.grey,fontSize:11))
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child:Text(userDate,style: TextStyle(color: Colors.black,fontSize:9))
                                    )
                                  ]
                                )
                              )
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.userPlus,size: 13),
                                      Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                                      Text("Add",style: TextStyle(color: Colors.black,fontSize:15,fontWeight: FontWeight.bold))
                                    ]
                                  )
                                ),
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Center(child: FaIcon(FontAwesomeIcons.xmark,color: Colors.grey[300],size: 15)),
                              )
                            )
                          ]
                        )
                      );
                    } 
                  )
                )
              ),
            ]
          )
        )
      )
    );
  }
}