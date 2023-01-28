var Mobiledrs =  Mobiledrs || {};

Mobiledrs.Payroll_invoice =  (function() {
  var init = function () {

    var repeatableHtml = jQuery('.patiend-row')[0].outerHTML;


    jQuery('#patient_hhcID_dropdown_trigger').change(function(){
        homeHealth = jQuery('#patient_hhcID').val();
        var patientHtml = '<option value=""> </option>';
        jQuery.ajax({
            url:'/ajax/patient_management/profile/searchByHomeHealth/'+homeHealth,
            type:'GET',
            success: function(data){
                const patient = JSON.parse(data);
                jQuery.each(patient, function(i, item) {
                    
                    date = $.datepicker.formatDate('m/dd/yy', new Date(item.pt_dateOfService));
                    patientHtml += '<option value="'+item.patient_id+'" data-date="'+date+'">'+item.patient_name+'</option>';
                
                });
                console.log(patientHtml);
                jQuery('.prsl_patientID').html(patientHtml);
                repeatableHtml = jQuery('.patiend-row').first()[0].outerHTML;
            }
         });
    });

    jQuery('.prsl_patientID').on('change', function(){
        serviceDate = jQuery(this).find("[value='"+jQuery(this).val()+"']").data('date');
        input = '<label class="control-label" style="font-size: 16px; font-weight: normal;">'+serviceDate+'</label><input value="'+serviceDate+'" type="hidden" name="dateofservice[]">';
        jQuery(this).parent().parent().find('.date-label').html(input);
    });

    jQuery('.amount-price').on('change', function() {
        var price = 0;
        jQuery('.amount-price').each(function(){
            price = price + parseInt(jQuery(this).val() ? jQuery(this).val() : 0); 
        });

        jQuery('.total-price').text('$'+price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
    });

    jQuery('.remove-patient').click(function(){
        patientNumber = jQuery('.patiend-row').length;
        if(patientNumber == 1){
           alert('Cannot remove all patient, atleast 1 patient to generate invoice');
           return;
        } else {
          jQuery(this).parent().parent().remove();
        }
    });


    jQuery('.add-patient').click(function(){

      patientNumber = jQuery('.patiend-row').length;

        if(patientNumber == 7){
           alert('Maximum of 7 patients');
           return;
        }

        jQuery(this).parent().parent().before(repeatableHtml);

        jQuery('.prsl_patientID').on('change', function(){
            serviceDate = jQuery(this).find("[value='"+jQuery(this).val()+"']").data('date');
            input = '<label class="control-label" style="font-size: 16px; font-weight: normal;">'+serviceDate+'</label><input value="'+serviceDate+'" type="hidden" name="dateofservice[]">';
            jQuery(this).parent().parent().find('.date-label').html(input);
        });

        jQuery('.amount-price').on('change', function() {
          var price = 0;
          jQuery('.amount-price').each(function(){
            price = price + parseInt(jQuery(this).val() ? jQuery(this).val() : 0); 
          });
          

          jQuery('.total-price').text('$'+price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
        });

        jQuery('.remove-patient').click(function(){
          patientNumber = jQuery('.patiend-row').length;
          if(patientNumber == 1){
             
          } else {
            jQuery(this).parent().parent().remove();
          }
      });

     
    });
    
  };

  return {
    init: init
  };

})();

Mobiledrs.Payroll_invoice.init();