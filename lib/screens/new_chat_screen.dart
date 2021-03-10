import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewChatScreen extends StatefulWidget {
  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {

  bool _valid;

  @override
  void initState() {
    super.initState();
    setState(() {
      _valid = false;
    });
  }

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
                          child: Container(
                          )
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            child: Text("New Chat",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: FaIcon(FontAwesomeIcons.chevronDown,color: Colors.black,size: 20),
                            ),
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
                          border: InputBorder.none,
                          prefixText: "To: ",
                          prefixStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold),
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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Row(
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                              FaIcon(FontAwesomeIcons.users,color: Colors.black),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                              Text("New Group",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                            ]
                          )
                        )
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(child: Text("NEW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))
                          )
                        )
                      )
                    ]
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    child: Text("Recents",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
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

                      String userName = (index % 3 == 0) ? "GroupOKay" : "Rico";
                      String userNameAccount = (index % 3 == 0) ? "Britney, Rico, Bryan" : "";
                      String userImg = (index % 3 == 0) ? "assets/friend-2.jpg" : "assets/friend-1.png";
                    
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(userImg),
                        ),
                        title: Text(userName),
                        subtitle: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(userNameAccount,style: TextStyle(color: Colors.grey,fontSize:11))
                        ),
                        trailing: Container(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(_valid)
                                  _valid = false;
                                else
                                  _valid = true;
                              });
                            },
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: _valid == true? Colors.blue : Colors.grey,
                            )
                          )
                        )
                      );
                    } 
                  )
                )
              )
            ]
          )
        )
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton(
          onPressed: null,
          backgroundColor: _valid? Colors.blue : Colors.grey[400],
          child: Text("Chat",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
        ),
      )
    );
  }
}