loadTags = function(){  
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
      console.log(result.length)
      if(result.length == 0){
        $('.fjs-ele').css('display', 'block');
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
