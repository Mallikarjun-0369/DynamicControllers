import 'package:flutter/material.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DynamicControllers(),
    );
  }
}

class DynamicControllers extends StatefulWidget {

  @override
  _DynamicControllersState createState() => _DynamicControllersState();
}

class _DynamicControllersState extends State<DynamicControllers> {

  List<TextEditingController> _highlightControllers;
  TextEditingController _highlightController;
  List<int> highlights;
  int highlightCount = 1;

  @override
  void initState() {
    super.initState();
    highlights = new List<int>();
    highlights.add(highlightCount);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dynamic Controllers'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return new SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: new Text('Creating dynamic controllers on click on "Add" button and fetching controller data on submitting', style: new TextStyle(color: Colors.black, fontSize: 16.0),),
            ),

            new ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: highlights.length,
                itemBuilder: (context, index) {
                  return _getHighlightItem(index);
                }),

            new Container(
              child: new RaisedButton(
                onPressed: () {
                  setState(() {
                    highlightCount++;
                    highlights.add(highlightCount);
                  });
                },
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(Icons.add, color: Colors.black, size: 24.0,),
                    new SizedBox(width: 5.0,),
                    new Text('Add', style: new TextStyle(color: Colors.black, fontSize: 16.0),),
                  ],
                ),
              ),
            ),

            new Container(
              alignment: Alignment.center,
              child: new RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  // todo get each controller text and print
                },
                color: Colors.blue,
                child: new Text('Submit', style: new TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getHighlightItem(int index) {
    highlightCount = highlights.elementAt(index);

    return  new Stack(
      children: <Widget>[
        new Container(
          height: 40.0,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 15.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.black54, width: 1.0),
          ),
          child: new TextField(
            autofocus: false,
//            maxLines: 1,
//            controller: _highlightController,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.text,
            decoration: InputDecoration.collapsed(
              border: InputBorder.none,
              hintText: 'Enter Highlight',
            ),
          ),
        ),

        highlights.length > 1 ? new Positioned(
          top: 0.0,
          right: 0.0,
          bottom: 15.0,
          child: IconButton(icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                if(highlightCount > 0) {
                  highlightCount--;
                  highlights.removeAt(index);
                }
              });
            },
          ),
        ) : new Container(),
      ],
    );
  }
}
