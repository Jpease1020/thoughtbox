function getLinks(){
  $.getJSON('/api/v1/links', function(response){
      displayLinks(response);
  });
}

function displayLinks(links){
  links.forEach(function(link){
    $('#link-index').append(linkHtml(link));
  });
}
