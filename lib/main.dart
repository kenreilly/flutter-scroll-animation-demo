import 'package:flutter/material.dart';
import 'demo-card.dart';
import 'items.dart';
import 'animated-bg.dart';

void main() => runApp(AnimationDemo());

class AnimationDemo extends StatelessWidget {

	@override
	Widget build(BuildContext context) {

		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(primarySwatch: Colors.deepPurple),
			home: MyHomePage(title: 'Flutter Animation Demo'),
		);
	}
}

class MyHomePage extends StatefulWidget {

	MyHomePage({Key key, this.title}) : super(key: key);
	final String title;

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	
	ScrollController _controller = new ScrollController();

	List<DemoCard> get _cards =>
		items.map((Item _item) => DemoCard(_item)).toList();

	@override
	Widget build(BuildContext context) {
	
		return Scaffold(

			backgroundColor: Colors.black,
			appBar: AppBar(title: Text(widget.title)),
      		body: Stack(

				alignment: AlignmentDirectional.topStart,
				children: <Widget>[

					AnimatedBackground(controller: _controller),
					Center(
						child: ListView(
							controller: _controller,
							children: _cards
						)
					)
				]
			)
		);
  	}
}
