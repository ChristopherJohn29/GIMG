$(function () {
 	var oldStart = 0;

  $('#dfv-list').DataTable({
    	"searching": false,
     	"lengthChange": false,
      "pageLength": 100,
    	"fnDrawCallback": function (o) {
      	if ( o._iDisplayStart != oldStart ) {
        		var targetOffset = $('#dfv-list').offset().top;

          	$('html,body').scrollTop(targetOffset);            

          	oldStart = o._iDisplayStart;
      	}
    	}
  });
});