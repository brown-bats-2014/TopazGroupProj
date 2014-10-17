var ModalController = function(options) {
  this.view = new options.view(options);
  this.$button = $(options.button);
};

ModalController.prototype.attachEvents = function(button) {
  var that = this;
  this.$button.on('click', function(e) {
    e.preventDefault();
    console.log(that);
    $.ajax({
            url: that.$button.attr('href'),
            type: 'GET',
            beforeSend: function() {
                // set loading
            }
        }).done(function(data) {
            that.view.render(data);
        }).fail(function() {
            //remove loading or display fail
        });
  });
};
