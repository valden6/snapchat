import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  
  String _quickContactInteractiveName = "";
  String _trendingInteractiveName = "";
  int _quickContactPerLoad = 4;
  int _trendingPerLoad = 10;

  @override
  void initState() {
    super.initState();
    setState(() {
      _quickContactInteractiveName = "View More";
      _trendingInteractiveName = "View More";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: Row(
          children: [
            Expanded(
              flex: 8,
              child: Container(
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
                      padding: const EdgeInsets.only(left:10, right: 10),
                      child: FaIcon(FontAwesomeIcons.magnifyingGlass, color: Colors.black, size: 20),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold),
                  )
                )
              )
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black))
                ),
              )
            )
          ]
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Games & Minis",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                  itemCount: 5,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {

                    String userName = (index % 3 == 0) ? "Ready Chef Go!" : "Aquapark";
                    String userImg = (index % 3 == 0) ? "assets/search-game-2.png" : "assets/search-game-1.png";
              
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        width: 100,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.symmetric(vertical:5)),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(userImg)
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical:10)),
                            Text(userName, style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            Padding(padding: EdgeInsets.symmetric(vertical:5)),
                            Text("Game", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.grey)),
                          ]
                        )
                      )
                    );
                  }
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Quick Add",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              Container(
                padding: EdgeInsets.only(right: 15),
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
                    itemCount: _quickContactPerLoad,
                    itemBuilder: (BuildContext context, int index) {

                      String userName = (index % 3 == 0) ? "Britney" : "Rico";
                      String userNameAccount = (index % 3 == 0) ? "Britney356" : "RicoSa39";
                      String userDate = (index % 3 == 0) ? "RECENTLY JOINED" : "IN MY CONTACTS";
                      String userImg = (index % 3 == 0) ? "assets/friend-2.jpg" : "assets/friend-1.png";
                      
                      if(index == _quickContactPerLoad - 1){
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if(_quickContactInteractiveName == "View More") {
                                _quickContactInteractiveName = "View Less";
                                _quickContactPerLoad = 20;       
                              } else {
                                _quickContactInteractiveName = "View More";
                                _quickContactPerLoad = 4;
                              }
                            });
                          },
                          child: ListTile(
                            title: Text(_quickContactInteractiveName,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))
                          ),
                        );
                      } else {
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
                    }
                  )
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Trending",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              Container(
                padding: EdgeInsets.only(right: 15),
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
                    itemCount: _trendingPerLoad,
                    itemBuilder: (BuildContext context, int index) {

                      String userName = (index % 3 == 0) ? "Kevin Ged" : "Weshdene";
                      String userNameAccount = (index % 3 == 0) ? "kevs2309" : "wejdene.bk";
                      String userImg = (index % 3 == 0) ? "assets/search-trend-img-account-1.jpg" : "assets/search-trend-img-account-2.jpg";
                      
                      if(index == _trendingPerLoad - 1){
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if(_trendingInteractiveName == "View More") {
                                _trendingInteractiveName = "View Less";
                                _trendingPerLoad = 20;       
                              } else {
                                _trendingInteractiveName = "View More";
                                _trendingPerLoad = 10;
                              }
                            });
                          },
                          child: ListTile(
                            title: Text(_trendingInteractiveName,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))
                          ),
                        );
                      } else {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(userImg),
                          ),
                          title: Row(
                            children: [
                              Text(userName),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.yellow,
                                child: Center(child: FaIcon(FontAwesomeIcons.solidStar,size: 7,color: Colors.black)),
                              )
                            ]
                          ),
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
                                        child:Text("Snap Star",style: TextStyle(color: Colors.black,fontSize:11))
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child:Text(userNameAccount,style: TextStyle(color: Colors.grey,fontSize:11))
                                      )
                                    ]
                                  )
                                )
                              ),
                              Expanded(
                                flex: 5,
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
                                        FaIcon(FontAwesomeIcons.bookmark,size: 13),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                                        Text("Subscribe",style: TextStyle(color: Colors.black,fontSize:13,fontWeight: FontWeight.bold))
                                      ]
                                    )
                                  )
                                )
                              )
                            ]
                          )
                        );
                      } 
                    }
                  )
                )
              )
            ]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        backgroundColor: Colors.black,
        child: FaIcon(FontAwesomeIcons.magnifyingGlass,size: 20),
      ),
    );
  }
}