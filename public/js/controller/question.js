var QuestionController = function(options) {
  console.log(options.view);
  this.view = new options.view(options);
  console.log(this.view);
  this.model = new options.model();

};

QuestionController.prototype.initialize = function() {
    // this.view.render(this.model);

    this.attachEvents();
};

QuestionController.prototype.attachEvents = function() {
    var controller = this;

    console.log("attaching events");

    $("form").on('click', '#choice_add', function(e) {
      console.log(this.view);
      this.view.render(this.model.qNumber);
      this.model.qInc();
    });

    this.view.$container.on('submit', '#question_form', function(evt) {
        var usernameText = $(this).find('#user-name-input').val();

        console.log(usernameText);

        controller.model.name = usernameText;

        evt.preventDefault();

        $.ajax({
            url: '/users',
            type: 'POST',
            data: {
                username: usernameText
            },
            beforeSend: function() {
                $('#loading-indicator').css({
                    'display': 'block'
                });
            }
        }).done(function() {
            console.log('done');

            controller.view.render(controller.model);
        }).fail(function() {
            console.warn('NOPE');
        }).always(function() {
            $('#loading-indicator').css({
                'display': 'none'
            });
        });
    });
};
