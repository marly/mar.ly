function changeCardRadius(new_radius) {
  $('#card').css('border-radius', new_radius);
  $('#card').css('-moz-border-radius', new_radius);
}

$(document).ready(function() {
  $('#card>img').each( function() {
    $(this).hide();
  });
  $('#recipe-link').hover(function() {
    $('#recipe-image').fadeIn();
  }, function() {
    $('#recipe-image').fadeOut();
  });
  $('#about-link').hover(function() {
    $('#about-image').fadeIn();
  }, function() {
    $('#about-image').fadeOut();
  });
  $('#code-link').hover(function() {
    $('#code-image').fadeIn();
    changeCardRadius('60px 60px 0px 0px');
  }, function() {
    changeCardRadius('60px 60px 0px 60px');
    $('#code-image').fadeOut();
  });
  $('#blog-link').hover(function() {
    $('#blog-image').fadeIn();
    changeCardRadius('60px 0px 0px 60px');
  }, function() {
    changeCardRadius('60px 60px 0px 60px');
    $('#blog-image').fadeOut();
  });
});



