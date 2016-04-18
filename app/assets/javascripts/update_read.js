function updateRead(){
  $('.links-index').delegate('.change-read-status', 'click', function(){
    var $readStatus = $(this).prev().html()
    var $linkId = $(this).closest(".panel").attr('data-id')
    // debugger
    $(this).prev().remove()
    $.ajax({
      url: 'api/v1/links/' + $linkId,
      type: 'PUT',
      data: {"change": 'true'},
      success: function(response){
        // replaceReadStatus($readStatus, response)
      }, error: function(xhr){
        console.log(xhr.responseText)
      }
    });
  });
}


function replaceReadStatus(oldResponse, response){
  oldResponse.replaceWith(response.read);
}
