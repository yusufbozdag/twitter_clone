import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/home/tabbar_view.dart';

class HomeView extends StatefulWidget {
   const HomeView(this.controller,{Key? key,}) : super(key: key);

  final ScrollController controller;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 
    final String _tweetText = "Lorem Ipsum, masaüstü yayıncılık ve basın yayın sektöründe kullanılan taklit yazı bloğu olarak tanımlanır. Lipsum, oluşturulacak şablon ve taslaklarda içerik yerine geçerek yazı bloğunu doldurmak için kullanılır. Vikipedi";
    final _randomImage = "https://picsum.photos/200/300";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  floatingActionButton: _fabButton,
      body: _listView
    );
  }



  

Widget get _listView => ListView.builder(
  itemCount: 10,
  // controller: widget.controller,

  itemBuilder: (context,index) {
  return _listViewCard; },
  
);

  Widget get _listViewCard => Card(
    child: ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(_randomImage),),
      title: Wrap(
        runSpacing: 10,
        children: [
          _listCardTitle("Hello"),
          Text(_tweetText),
          _placeHolderField,
          _footerButtonRow
        ],
      ),
    ),
  );




  Widget _listCardTitle(String text) =>
   Text(text, 
   style: titleTextStyle);

   Widget get _placeHolderField => Container(
     height: 100,
     child: const Placeholder(),
   );

  Widget get _footerButtonRow => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _iconLabelButton,
              _iconLabelButton,
              _iconLabelButton,
              _iconLabelButton,
            ],
          );


   Widget _iconLabel(String text) => Wrap(
      spacing: 5,
     children: [
       const Icon(Icons.comment,color:
        CupertinoColors.inactiveGray,
         size: 25,),
       
       Text(text)
     ],
   );

   Widget get _iconLabelButton => InkWell(
     child: _iconLabel("1"),
     onTap: () {},
   );
}