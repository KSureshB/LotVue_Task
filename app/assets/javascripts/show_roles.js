function show_roles(){
	$('#show_roles').toggle();
}
// 	$("#show_roles").click(function(){
// 	alert(3333);
// 	$('#show').toggle();
// }
// })

	$(document).on('click','#show_users', function(){
  $.ajax({ 
    type: 'GET', 
    url: '/users/users_with_condition', 
    dataType: "html",
    success: function (data) { 
		$("#show_particular_users").html(data);        
     }
        });
});

	$(document).on('click','#show_particular_userss', function(){
  $.ajax({ 
    type: 'GET', 
    url: '/users/filter_users_condition', 
    data: { 'is_checked' : $('#list').val() }, 
    dataType: "html",
    success: function (data) { 
		$("#my_users").html(data);        
     }
        });
});

