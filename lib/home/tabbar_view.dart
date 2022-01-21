import 'package:flutter/material.dart';
import 'package:twitter_clone/home/search_view.dart';
import '../home_view.dart';
class TwitterTabbarView extends StatefulWidget {
  const TwitterTabbarView({Key? key}) : super(key: key);

  @override
  _TwitterTabbarViewState createState() => _TwitterTabbarViewState();
  
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {

   bool _isHeaderClose = false;
   final String _githubPhotoUrl = "https://picsum.photos/200/300";
   late ScrollController scrollController;
   double _lastOffset = 0;
  
   @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        _isHeaderClose = false;
      }

      else if (scrollController.offset >= scrollController.position.maxScrollExtent) {
        _isHeaderClose = true;
      }

      else {
        _isHeaderClose = scrollController.offset > _lastOffset ? true : false;
      }

      

      setState(() {
        _lastOffset = scrollController.offset;
      });

    @override
    void dispose() {
      super.dispose();
      scrollController.dispose();
    }
      
    });
    


  }
 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: _fabButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _bottomAppbar,
        body: Column(
          children:  <Widget>[
            _containerAppbar,
            Expanded(
             child: TabBarView(
               children: [
               HomeView(scrollController),
               const SearchView(),
               const Text("data"),
               const Text("data"),
             ]),
           ),
          ],
        ),
      ),
    );
  }

  Widget get _bottomAppbar =>  BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: _tabbarItems,

  );

    Widget get _fabButton => FloatingActionButton(
   onPressed: () {},
   child: const Icon(Icons.ac_unit),
   ); 

     Widget get _containerAppbar => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: _isHeaderClose ? 0 : MediaQuery.of(context).size.height * .12,
        child: _appBar,
      );

   Widget get _appBar => AppBar(
     elevation: 0,
     centerTitle: false,
     title: _appBarItems,
   );
   Widget get _appBarItems => Wrap(
     crossAxisAlignment: WrapCrossAlignment.center,
     spacing: 10,
     children: <Widget>[
     CircleAvatar(backgroundImage: NetworkImage(_githubPhotoUrl)),
      Text("Home",
    style: titleTextStyle,)
   ]);

     Widget get _tabbarItems => const TabBar(
       tabs: <Widget>[
      Tab(icon: Icon(Icons.dashboard)),
      Tab(icon: Icon(Icons.cabin_outlined)),
      Tab(icon: Icon(Icons.sanitizer_rounded)),
      Tab(icon: Icon(Icons.terrain_outlined)),
      ],
     );

     

}

const titleTextStyle = TextStyle(
  letterSpacing: 1,
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);