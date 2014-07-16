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
//= require jquery.tokeninput
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

loadTags = function(){
  $("#contentTags").tokenInput("/contents/tags.json", {
    preventDuplicates: true,
    allowFreeTagging: true,
    prePopulate: $("#content_tags").data("pre"),
    theme: "facebook",    

  });
  $("#content_tags").tokenInput("/contents/tags.json", {
    preventDuplicates: true,
    prePopulate: $("#content_tags").data("pre"),
    theme: "facebook",    
  });
  
};

function filterInit(){
  var template = $("#template").html(); //got template
  var view = function(conc){
    conc.tags = conc.tags_array.join(',')
    return Mustache.render(template, conc);
  }

  var filter_type_functions = {
    tag: function(content_input_value, tag){
    return content_input_value.indexOf(tag) > -1 ? true : false;
    }
  };

  var filter_callbacks = {
    after_filter: function(result){
      if(result.length == 0){
        $('.well').css('display', 'block');
      }    
    }
  }

  var settings = {
    filter_criteria:{
      tags: ['#content_tags .EVENT.change .TYPE.tag' ,'tags_array']
    },
    callbacks: filter_callbacks,
    filter_on_init: false,
    filter_types: filter_type_functions,
    and_filter_on: false,
    //search: { input: '#content_tags1', search_in: '.tags', min_length: 4}
  }
  return FilterJS(conc, "#content_list",view,settings)
}


$(document).on('ready page:load', function(){
  loadTags();
  window.fjs = filterInit();

})
