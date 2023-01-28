var Mobiledrs =  Mobiledrs || {};

Mobiledrs.Payroll_list =  (function() {
  var init = function () {
    tableList();
  };

  var tableList = function() {
    var oldStart = 0;
    $('#all-patient-list-report').DataTable({
        "dom": '<"top"flp<"clear">>rt<"row"<"col-sm-6"i><"col-sm-6"p>>',
      	"searching": false,
       	"lengthChange": false,
        "pageLength": 100,
      	"fnDrawCallback": function (o) {
        	if ( o._iDisplayStart != oldStart ) {
          		var targetOffset = $('#headcount-list_wrapper').offset().top;

	          	$('html,body').scrollTop(targetOffset);            

	          	oldStart = o._iDisplayStart;
        	}
      	}
    });
  };

  return {
    init: init
  };
})();

Mobiledrs.Payroll_list.init();