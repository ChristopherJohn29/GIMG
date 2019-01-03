{% extends "main.php" %}

{% 
  set scripts = [
    'plugins/input-mask/jquery.inputmask',
    'plugins/input-mask/jquery.inputmask.date.extensions',
    'plugins/input-mask/jquery.inputmask.extensions'
  ]
%}

{% set page_title = 'Edit Notes' %}

{% block content %}
	 <div class="row">

		  <div class="col-lg-8">
          <div class="box">
          
            <div class="box-header with-border">
              <h3 class="box-title">Edit Notes</h3>
            </div>
            <!-- /.box-header -->
				
				<!-- form start -->
	            <div class="row">
					<div class="col-lg-12">
						<div class="box-body">
						
								{{ form_open("patient_management/communication_notes/save/edit/#{ record.patient_id }/#{ communication_note.ptcn_id }", {"class": "xrx-form"}) }}
							
								<div class="row">

									<input type="hidden" name="ptcn_patientID" value="{{ record.patient_id }}">
									<input type="hidden" name="ptcn_id" value="{{ communication_note.ptcn_id }}">
								
									<!-- This is the patient's information -->
									<div class="xrx-info">
									
										<div class="col-lg-6">
											<p class="lead"><span>Patient Name: </span> {{ record.patient_name }}</p>
										</div>
										
										<div class="col-lg-6">
											<p class="lead"><span>Date of Birth: </span> {{ record.get_date_format(record.patient_dateOfBirth) }}</p>
										</div>
										
										<div class="col-lg-6">
											<p class="lead"><span>Medicare: </span> {{ record.patient_medicareNum }}</p>
										</div>
										
										<div class="col-lg-6">
											<p class="lead"><span>Home Health: </span> {{ record.hhc_name }}</p>
										</div>
										
									</div>

									<div class="col-md-12 form-group {{ form_error('ptcn_message') ? 'has-error' : '' }}">
									
										<label class="control-label">Note <span>*</span></label>
                                        <textarea class="form-control" rows="7" required="true" name="ptcn_message">{{ set_value('ptcn_message', communication_note.ptcn_message) }}</textarea>
										
									</div>

									<div class="col-md-12 has-error">
										<span class="help-block">{{ form_error('ptcn_message') }}</span>
									</div>
									
									<div class="col-md-12 form-group xrx-btn-handler">
					              		<button type="submit" class="btn btn-primary xrx-btn">
											<i class="fa fa-check"></i> Update Note
										</button>
					              	</div>
								
								</div>
								
							</form>
							
						</div>
					</div>
				</div>
            
          </div>
          <!-- /.box -->

      </div>

      </div>
{% endblock %}
