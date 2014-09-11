loadTags = function(){
  console.log($('.search-query'));

$('.search-query').on('change', function(e) {
  var selected_vals = $.map($('.search-query').select2('data'), function(e, i){return e.text}).join(',')
  $('#content_tags').val(selected_vals);
  content_filter.filter();
});
$('div.container').on('click', 'a.select2-choice', function(e) {
   
});
};

function filterInit(){
  var template = $("#template").html(); //got template
  var view = function(conc){
    conc.tags = conc.tags_array.join(',')
    console.log(conc);
    console.log(current_user);
    console.log(conc.user_id);
    if(current_user == conc.user_id || current_user_role == 'Admin' || current_user_role == 'Super Admin')
      conc.valid_user = true;
    else if(current_user == "")
      conc.valid_user = true;
    else
      conc.valid_user = false;
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
