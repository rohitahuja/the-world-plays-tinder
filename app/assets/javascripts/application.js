// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require turbolinks

var size = 140;
setInterval(function(){
  $('.pulse').width(size).height(size);
  size++;
  if(size > 200){
    $('.pulse').css('opacity', $('.pulse').css('opacity')-0.001);
  }
  if(size > 500){
    size = 50;
	$('.pulse').width(size).height(size);
    $('.pulse').css('opacity', '0.3');
  }
},0); 

$('.photo').click(function(){
  console.log('CLick'); 
  $( ".pulse" ).clone().appendTo( "body" );
})