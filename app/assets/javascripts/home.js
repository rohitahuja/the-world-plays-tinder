//$('a[href*=#]').click(function(){return false;});

var animationEndEvent = "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";

var Person = {
	// people: [ 
	// 	{name: 'Linda', age: 25, img: "http://i.imgur.com/QZuGC10.jpg"},
	// 	{name: 'Lisa', age: 20, img: "http://i.imgur.com/1EWwp59.jpg"},
	// 	{name: 'Sandra', age: 18, img: "http://i.imgur.com/Lu3laIj.jpg"},
	// 	{name: 'Chloe', age: 18, img: "http://i.imgur.com/WgYIxhw.png"},
	// 	{name: 'Alexa', age: 23, img: "http://i.imgur.com/D0PQegY.png"},
	// 	{name: 'Maria', age: 21, img: "http://i.imgur.com/eqd5IhH.jpg"},
	// 	{name: 'Emma', age: 24, img: "http://i.imgur.com/4F9NXPo.png"},
	// 	{name: 'Sara', age: 18, img: "http://i40.tinypic.com/ofxe21.jpg"},
	// 	{name: 'Lara', age: 22, img: "http://i.imgur.com/HMkdN6A.jpg"}
	// ],
	add: function(){
		//var random = this.people[Math.floor(Math.random() * this.people.length)];
		$.getJSON("home/index", function(result){
			$('#people').append("<div class='person'><img alt='" + result.name + "' src='" + result.photos + "' /><span><strong>" + result.name + "</strong>, " + result.age + "</span></div>");
	  });
	}
};

var App = {
	blocked: false,
	like: function(liked){
		var animate = liked ? 'animateYes' : 'animateNo';
		var self = this;
		if(!this.blocked){
		  this.blocked = true;
		  	$('.person').eq(0).addClass(animate).one(animationEndEvent, function(){
	   			$(this).remove();
				Person.add();
				self.blocked = false;
			});
		}
	}
};

var Phone = {
	wrap: $('#phone'),
	updateClock: function(){
		var date = new Date();
		var hours = date.getHours();
		var min = date.getMinutes();
     hours = (hours < 10 ? "0" : "") + hours;
		min = (min < 10 ? "0" : "") + min;
		var str = hours + ":" + min;
		$('.clock').text(str);
	}
}

$(document).on('click', '.button.yes .trigger', function() {
	App.like(true);
});

$(document).on('click', '.button.no .trigger', function() {
	App.like(false);
});


$(document).ready(function(){
	console.log($('body'));
  Phone.updateClock(); 
  setInterval('Phone.updateClock()', 1000);
  Person.add();
  Person.add();
  Person.add();
  Person.add();
});