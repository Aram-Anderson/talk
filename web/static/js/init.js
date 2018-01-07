(function($){
  $(function(){
    $('.parallax').parallax();
    $(".dropdown-button").dropdown({ hover: true });
    $('.carousel').carousel();
    $('input#input_text, textarea#textarea1').characterCounter();
  }); // end of document ready
})(jQuery); // end of jQuery name space
