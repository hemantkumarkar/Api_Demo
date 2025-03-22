import "package:api_demo/services/remote.dart";
import "package:flutter/material.dart";

import "../models/post.dart";

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
  
}
class _HomePageState extends State<HomePage>{
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // fetch data from API
    getData();
  }
  getData() async{
    posts= await RemoteService().getPosts();
    if(posts !=null){
      setState(() {
        isLoaded=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
          child: ListView.builder(
        itemCount: posts?.length,
          itemBuilder: (context,index){
            return Container(
              child: Text(posts![index].title),
            );
          }
      ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
    )
    );
  }
  
}