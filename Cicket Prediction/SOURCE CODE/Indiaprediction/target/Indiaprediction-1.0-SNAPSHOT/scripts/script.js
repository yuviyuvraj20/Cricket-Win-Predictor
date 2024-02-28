$(window).load(function() {

  var rnd = Math.random() * (8000 - 2000) + 2000;

  $('.progress').css("animation", "loading " + rnd + "ms linear");

  console.log(rnd);

  setTimeout(function() {

    $('#loader').hide();
    $('#page').removeClass('hidden');

  }, rnd);

});
