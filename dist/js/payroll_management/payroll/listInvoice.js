  $(function () {
    var oldStart = 0;
    
    $('#all-patient-list').DataTable({
      dom: "<'row'<'col-sm-3'<\"#totalUnpaid\">><'col-sm-6'<\".toolbar\">><'col-sm-3'f>>tp",
      initComplete: function(){
        var url = window.location.href;
        var button = $('<a href="#"><span class="label label-primary">Add</span></a>');
        
        button.attr('href', url.replace('invoiceReport', 'invoice'));

        $("#all-patient-list_wrapper div.toolbar").append(button);      
      },
      "pageLength": 50,
      "fnDrawCallback": function (o) {
        if ( o._iDisplayStart != oldStart ) {
          var targetOffset = $('table').offset().top;

          $('html,body').scrollTop(targetOffset);            

          oldStart = o._iDisplayStart;
        }
      }
    });

    jQuery('.checkall').click(function(){
        
        if(jQuery(this).is(":checked")){
            jQuery('#all-patient-list').find('input[type="checkbox"]').prop('checked', true);
        } else {
            jQuery('#all-patient-list').find('input[type="checkbox"]').prop('checked', false);
        }
        
    });

    jQuery('input[type=checkbox]').change(function(){
        
        if(jQuery('input[name="toPaid[]"]:checked').length > 0){
            jQuery('#paidBtn').attr('disabled', false);
        } else {
            jQuery('#paidBtn').attr('disabled', true);
        }
    });


    jQuery('#paid').click(function(){
        if(jQuery('#paid-patient-list.dataTable').length){

        } else {

          setTimeout(function(){ 

              $('#paid-patient-list').DataTable({
              dom: "<'row'<'col-sm-3'<\"#totalPaid\">><'col-sm-6'<\".toolbar\">><'col-sm-3'f>>tp",
              initComplete: function(){
                var url = window.location.href;
                var button = $('<a href="#"><span class="label label-primary">Add</span></a>');
                
                button.attr('href', url.replace('invoiceReport', 'invoice'));

                $("#paid-patient-list_wrapper div.toolbar").append(button);    
              },
              "pageLength": 50,
              "fnDrawCallback": function (o) {
                if ( o._iDisplayStart != oldStart ) {
                  var targetOffset = $('table').offset().top;

                  $('html,body').scrollTop(targetOffset);            

                  oldStart = o._iDisplayStart;
                }
              }
            });

                  var totalVal2 = '<p style="font-size: 1.5em;"><strong>Total: </strong>' + ($('[name="totalPaid"]').val()) + '</p>';
    $('#totalPaid').html(totalVal2);

        }, 500);
          

        }
    });

 
    

    

    var totalVal = '<p style="font-size: 1.5em;"><strong>Total: </strong>' + ($('[name="totalUnpaid"]').val()) + '</p>';
    $('#totalUnpaid').html(totalVal);
 

  });