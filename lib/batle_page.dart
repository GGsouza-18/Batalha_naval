import 'package:flutter/material.dart';

class BatlePage extends StatefulWidget {
  List _aCampo = [];
  List _mCampo = [];

  BatlePage(this._aCampo, this._mCampo);

  @override
  _BatlePageState createState() => _BatlePageState();
}

class _BatlePageState extends State<BatlePage> {
  List _advCampo = [];
  List _meuCampo = [];
  bool _valid = true;

  @override
  void initState() {
    super.initState();

    _advCampo = widget._aCampo;
    _meuCampo = widget._mCampo;
  }


  Widget buildFieldMeuCampo(BuildContext context, int index) {
    return
      Container(
        width: 5,
        height: 5,
        color: _meuCampo[index]["status"] ? Colors.blueAccent : Colors.black26,
        child: null,
      );
  }

  Widget buildFieldAdvCampo(BuildContext context, int index) {
    return GestureDetector(
        onTap: _valid
            ? () {
          setState(() {
            _advCampo[index]["status"]
                ? _advCampo[index]["ataque"] = true : null;
          });
        }
            : null,
        child: Container(
          width: 10,
          height: 10,
          color: _advCampo[index]["ataque"] ? Colors.red : Colors.blueAccent,
          child: null,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Batle Page"),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Expanded(
          flex: 2,
          child: Padding(
            padding:EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
            child: GridView.builder(
                itemCount: _advCampo.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 50,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    crossAxisCount: 5
                ),
                itemBuilder: buildFieldAdvCampo),
          ),),
        Expanded(
          flex: 0,
          child: Container(
            color: Colors.red,),),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: GridView.builder(
                itemCount: _meuCampo.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 50,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    crossAxisCount: 5
                ),
                itemBuilder: buildFieldMeuCampo),
          ),)
      ],),
    );
  }


}
