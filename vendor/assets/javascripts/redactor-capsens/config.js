window.init_redactor = function(){
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params = {};
  if (csrf_param !== undefined && csrf_token !== undefined) {
      params[csrf_param] = csrf_token;
  }
  $('.redactor').redactor(
    { "imageUpload":"/redactor_capsens/pictures",
      "uploadImageFields": params,
      "imageGetJson":"/redactor_capsens/pictures",
      "path":"/assets/redactor-capsens",
      "css":"style.css"}
  );
}

$(document).on( 'ready page:load', window.init_redactor );
