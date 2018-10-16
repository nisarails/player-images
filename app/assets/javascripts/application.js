// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

i = 10;
uploads = [];
checkedValue = [];

function countdown() {
  show_image(i)
  document.getElementById("timer").innerHTML = i
  setTimeout(function () {
    i = i - 1
    if(i == 0){
      i = 10
    }
    countdown()
  }, 1000);
}

function show_image(count) {
  element = document.getElementById("image")  
  element.innerHTML = ""
  get_image(count)
}

function get_image(count) {
  img = document.createElement("img")
  img.src = uploads[count-1]
  img.setAttribute("id", "show-image")
  img.setAttribute("onclick", "save_it()  ")
  element = document.getElementById("image")
  element.appendChild(img)
}


function get_all_uploads(){
  all_uploads = document.getElementsByClassName("uploads")
  for(var j = 0; j < all_uploads.length; j++)
  {
    uploads.push(all_uploads[j].value);
  }
  if(uploads.length < 10){
    repeat_uploads();
  }
  uploads = uploads.reverse()
  countdown();
}

function save_it(e) {
  image_path = document.getElementById("show-image").src
  count = document.getElementById("timer").innerHTML
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      element = document.getElementById("plays")
      element.innerHTML = ""
      element.innerHTML = this.responseText
    }
  };

  xhttp.open("GET", "/games/new.js?path="+image_path+"&count="+count, true);
  xhttp.send();
}

function repeat_uploads(){
  for(var j = 0; j < all_uploads.length; j++){
    if(uploads.length < 10){
      uploads.push(all_uploads[j].value);
    } else{
      break;
    }
  }
  if(uploads.length < 10){
    repeat_uploads()
  }
}