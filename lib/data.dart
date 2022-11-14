class AllData {
  List<String> listImpUrg = [];
  List<String> listImp = [];
  List<String> listUrg = [];
  List<String> listNota = [];

  addData({required String tag, required String todo}) {
    if (tag == "Important and Urgent") {
      listImpUrg.add(todo);
    }
  }
}
