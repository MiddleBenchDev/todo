class Todo{
  //parameters need for the application
  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  //constructor
  Todo(
    {
      this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked
    }
  );

  //creating map
  Map<String, dynamic> toMap() {
    return{
      'id' : id,
      'title' : title,
      'creationDate' : creationDate.toString(), //sqflite databse does not support date format
      'isChecked' : isChecked ? 1 : 0,
    };
  }

  //evaluation purpose
  @override
  String toString(){
    return 'Todo(id: $id, title: $title, creationDate: $creationDate, isChecked: $isChecked)';
  }
}