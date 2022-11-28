class Question {
  late final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  late final String answerText;
  late final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  list.add(Question(
    "Which city is capital of Turkey",
    [
      Answer("İstanbul", false),
      Answer("Ankara", true),
      Answer("Muğla", false),
      Answer("Erzincan", false),
    ],
  ));

  list.add(Question(
    "Who is the owner of Flutter",
    [
      Answer("Nokia", false),
      Answer("Samsung", false),
      Answer("Google", true),
      Answer("Apple", false),
    ],
  ));

  list.add(Question(
    "What is the name of RTE",
    [
      Answer("İsmet İnönü", false),
      Answer("Rize Teyyar Erdo", true),
      Answer("Recep Turp Erdoğan", false),
      Answer("Recep Tayyip Erdoğan", false),
    ],
  ));
  return list;
}
