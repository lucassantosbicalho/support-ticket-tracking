class BoardListObject {
  String? title;
  List<BoardItemObject>? items;

  BoardListObject({this.title, this.items});
}

class BoardItemObject{
  String title;
  String? from;
  String owner;

  BoardItemObject({this.title="", this.from, this.owner=""});
}