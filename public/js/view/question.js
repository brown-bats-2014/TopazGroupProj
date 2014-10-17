var QuestionView = function(options) {
    this.$container = $(options.container);
    this.$el = null;
};

QuestionView.prototype.render = function(number) {
    var input = "<input type='text' name='choice" + number + "' placeholder='Enter your questions choice' /><br />";
    console.log(input);
    this.$container.append(input);

};
