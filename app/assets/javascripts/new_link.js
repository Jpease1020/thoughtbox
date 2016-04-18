function saveNewLink(){
  $('#submit-new-link').on('click', function(){
    var linkTitle = $('#new-link-title').val();
    var linkUrl  = $('#new-link-url').val();
    $.ajax({
      url: '/api/v1/links',
      type: 'POST',
      data: {
        'title': linkTitle,
        'url': linkUrl
      },
      success: function(response){
        $('#new-link-title').val("");
        $('#new-link-url').val("")
        // displayNewLink(response);
      }, error: function(xhr) {
        console.log(xhr.responseText)
      }
    })
  })
}

function displayNewLink(link){
  $('#link-index').prepend(linkHtml(link))
}
