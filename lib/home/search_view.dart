
import 'package:flutter/material.dart';
import 'package:twitter_clone/model/trend_topic.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final double _padding = 20;
      late TrendTopic _topic;

@override
  void initState() {
    super.initState();
       _topic = TrendTopic(
         hashtag: "#Champions League",
         location: "Trending in Turkey",
          tweet: "16.8K Tweets");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
      _downIconWidget,
      _emptySpace,
      _trendTitleWidget,
      _listHashView
      ],
    );
  }

  Widget get _emptySpace => const SizedBox(height:10);

  Widget get _downIconWidget =>   Container(child: const Icon(
          Icons.arrow_downward, 
          color: Colors.grey,),  
    );

    Widget get _trendTitleWidget =>    Card(
          color: Theme.of(context).scaffoldBackgroundColor,

          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(color: Colors.grey, width: 0.5)
            ),

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: _padding),
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text("Trends For You", style: Theme.of(context).textTheme.headline5),
          ),
    );

    Widget get _divider => const Divider(
          height: 0,
          color: Colors.grey
        );

    Widget get _listHashView =>  ListView.separated(
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => _divider,
        shrinkWrap: true,
         itemBuilder: (context, index) => Card(
           margin: const EdgeInsets.only(bottom: 10),
           shape: const RoundedRectangleBorder(side: BorderSide(style: BorderStyle.none)),
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: _padding, vertical: 5),
             child: NewWidget(topic: _topic),
           ),
         ), 
        );
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required TrendTopic topic,
  }) : _topic = topic, super(key: key);

  final TrendTopic _topic;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Wrap(
        direction: Axis.vertical,
        spacing: 5,
        children: [
            Text(_topic.location,
            style: Theme.of(context)
            .textTheme.caption),

            Text(_topic.hashtag,
            style: Theme.of(context)
            .textTheme
            .headline5?.
            copyWith(fontSize: 15)),

             Text(_topic.tweet,
             style: Theme.of(context)
             .textTheme
             .button)
          ],
        )),
        const Icon(Icons.arrow_drop_down)
      ],
    );
  }
}


