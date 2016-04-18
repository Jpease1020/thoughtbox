function getLinks(){
  $.getJSON('/api/v1/ideas', function(response){
      displayIdeas(response);
  });
}

function displayIdeas(ideas){
  ideas.forEach(function(idea){
    idea.body = truncateIdeaBody(idea);
    $('#idea-index').append(ideaHtml(idea));
  });
}
