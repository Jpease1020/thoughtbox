function updateRead(){
  $('.links-index').delegate('.change-read-status', 'click', function(){
    $(this).prev().remove()
    var $readStatus = $(this).prev().html()
    var $linkId = $(this).closest(".panel").attr('data-id')
    $.ajax({
      url: 'api/v1/links/' + $linkId,
      type: 'PUT',
      data: {"change": 'true'},
      success: function(response){
      }, error: function(xhr){
        console.log(xhr.responseText)
      }
    });
  });
}
