var ModalView = function(options) {
  this.$container = $(options.container);
};
ModalView.prototype.render = function(data) {
  this.$container.html(data);
  this.$container.toggleClass("hiddenModal").toggleClass("activeModal");
  $('#modal').on('click', function(e) {
      e.stopPropagation();
  });

  $(document).on('click', function (e) {
    $(document).off();
    this.$container.toggleClass("hiddenModal").toggleClass("activeModal").html("");
  });
};
