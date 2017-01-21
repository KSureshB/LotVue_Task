
//Ajax
$.ajaxSetup({
    cache:false,
    'beforeSend':function (xhr) {
        xhr.setRequestHeader("Accept", "");
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});

// Global ajax activity indicators.
$(document).ajaxStart(
    function () {
        $('#ajax-indicator').show();

    }).ajaxStop(function () {
    $('#ajax-indicator').hide();
});


function globalAjaxCall(http_method, url, data){
  $.ajax({
    url: url,
    type: http_method,
    data: data
  });
}