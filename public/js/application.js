qcon = new QuestionController({model: Question, view: QuestionView, container: ".choices"});
qcon.attachEvents();

mcon = new ModalController({view: ModalView, button: '#new_survey', container: "#modal"});
mcon.attachEvents();
