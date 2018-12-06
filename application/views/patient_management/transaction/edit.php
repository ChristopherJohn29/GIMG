
{% extends "main.php" %}

{% 
  set scripts = [
    'plugins/input-mask/jquery.inputmask',
    'plugins/input-mask/jquery.inputmask.date.extensions',
    'plugins/input-mask/jquery.inputmask.extensions',
    'dist/js/patient_management/transaction/add'
  ]
%}

{% set page_title = 'Update Transaction' %}

{% block content %}
	<div class="row">

		  <div class="col-lg-6">
          <div class="box">
          
            <div class="box-header with-border">
              <h3 class="box-title">Update Transaction</h3>
            </div>
            <!-- /.box-header -->
				
				<!-- form start -->
	            <div class="row">
					<div class="col-lg-12">
						<div class="box-body">
						
							{{ form_open("patient_management/transaction/save/edit/#{ record.patient_id }/#{ transaction.pt_id }", {"class": "xrx-form"}) }}
							
								<div class="row">
								
									<!-- This is the patient's information -->
									<div class="xrx-info">

										<input type="hidden" name="pt_patientID" value="{{ record.patient_id }}">
										<input type="hidden" name="pt_id" value="{{ transaction.pt_id }}">
									
										<div class="col-lg-6">
											<p class="lead"><span>Patient Name: </span> {{ record.get_reverse_fullname() }}</p>
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
									
									<div class="col-md-6 form-group">
									
										<label class="control-label">Type of Visit <span>*</span></label>
										<select class="form-control" style="width: 100%;" required="true" name="pt_tovID">
											<option value="" selected="true">Please select</option>

											{% for type_visit in type_visits %}

												<option value="{{ type_visit.tov_id }}" {{ transaction.get_selected_tov(type_visit.tov_id) }}>{{ type_visit.tov_name }}</option>

											{% endfor %}

										</select>
										
									</div>
									
									<div class="col-md-6 form-group">
									
										<label class="control-label">Provider <span>*</span></label>

										<input type="hidden" name="pt_providerID" required="true" value="{{ transaction.pt_providerID }}">
										<div class="dropdown mobiledrs-autosuggest-select">
										  	<input type="text" class="form-control" data-mobiledrs-autosuggest-select data-action-url="{{ site_url('ajax/patient_management/transaction/search') }}" data-input-target-name="pt_providerID">
										  	<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="width:100%;">
									  	  </ul>										
										</div>
										
									</div>
									
									<div class="col-md-6 form-group">
										<label>Date of Service <span>*</span></label>
										<input type="text" class="form-control" data-inputmask="'alias': 'mm/dd/yyyy'" data-mask required="true" name="pt_dateOfService" value="{{ set_value('pt_dateOfService', transaction.pt_dateOfService) }}">
									</div>
									
									<div class="col-md-6 form-group">
									
										<label class="control-label">Deductible</label>
										<input type="text" class="form-control" name="pt_deductible" value="{{ set_value('pt_deductible', transaction.pt_deductible) }}">
										
									</div>
									
									<div class="col-md-6 form-group">
									
										<label class="control-label">AW/IPPE Date</label>
										<input type="text" class="form-control" data-inputmask="'alias': 'mm/dd/yyyy'" data-mask name="pt_aw_ippe_date" value="{{ set_value('pt_aw_ippe_date', transaction.pt_aw_ippe_date) }}">
										
									</div>
									
									<div class="col-md-3 form-group">
									
										<label class="control-label">AW or IPPE?</label>
										<select class="form-control" style="width: 100%;" name="pt_aw_ippe_code">
											<option value="" selected="true">Please select</option>
											<option value="G0438" {{ transaction.get_selected_aw_ippe_code('G0438') }}>G0438</option>
											<option value="G0439" {{ transaction.get_selected_aw_ippe_code('G0439') }}>G0439</option>
											<option value="G0402" {{ transaction.get_selected_aw_ippe_code('G0402') }}>G0402</option>
										</select>
						                
									</div>
									
									<div class="col-md-3 form-group">
									
										<label class="control-label">Performed? <span>*</span></label>
										<select class="form-control" style="width: 100%;" required="true" name="pt_performed">
											<option value="" selected="true">Please select</option>
											<option value="1" {{ transaction.get_selected_choice(transaction.pt_performed, '1') }}>Yes</option>
											<option value="0"  {{ transaction.get_selected_choice(transaction.pt_performed, '0') }}>No</option>
										</select>
						                
									</div>
									
									<div class="col-md-6 form-group">
									
										<label class="control-label">ACP <span>*</span></label>
										<select class="form-control" style="width: 100%;" required="true" name="pt_acp">
											<option value="" selected="true">Please select</option>
											<option value="1" {{ transaction.get_selected_choice(transaction.pt_acp, '1') }}>Yes</option>
											<option value="0" {{ transaction.get_selected_choice(transaction.pt_acp, '0') }}>No</option>
										</select>
										
									</div>
									
									<div class="col-md-6 form-group">
									
										<label class="control-label">Diabetes <span>*</span></label>
										<select class="form-control" style="width: 100%;" required="true" name="pt_diabetes">
											<option value="" selected="true">Please select</option>
											<option value="1" {{ transaction.get_selected_choice(transaction.pt_diabetes, '1') }}>Yes</option>
											<option value="0" {{ transaction.get_selected_choice(transaction.pt_diabetes, '0') }}>No</option>
										</select>
										
									</div>
									
									<div class="col-md-6 form-group">
									
										<label class="control-label">Tobacco <span>*</span></label>
										<select class="form-control" style="width: 100%;" required="true" name="pt_tobacco">
											<option value="" selected="true">Please select</option>
											<option value="1" {{ transaction.get_selected_choice(transaction.pt_tobacco, '1') }}>Yes</option>
											<option value="0" {{ transaction.get_selected_choice(transaction.pt_tobacco, '0') }}>No</option>
										</select>
										
									</div>
									
									<div class="col-md-6 form-group">
									
										<label class="control-label">TCM <span>*</span></label>
										<select class="form-control" style="width: 100%;" required="true" name="pt_tcm">
											<option value="" selected="true">Please select</option>
											<option value="1" {{ transaction.get_selected_choice(transaction.pt_tcm, '1') }}>Yes</option>
											<option value="0" {{ transaction.get_selected_choice(transaction.pt_tcm, '0') }}>No</option>
										</select>
										
									</div>
									
									<div class="col-md-12 form-group">
									
										<label class="control-label">Others</label>
										<input type="text" class="form-control" name="pt_others" value="{{ set_value('pt_others', transaction.pt_others) }}">
										
									</div>
									
									<div class="col-md-12 form-group">
									
										<label class="control-label">ICD-10 Codes <span>*</span></label>
										<input type="text" class="form-control" required="true" name="pt_icd10_codes" value="{{ set_value('pt_icd10_codes', transaction.pt_icd10_codes) }}">
										
									</div>
									
									<div class="col-md-12 form-group">
									
										<label class="control-label">Date Referral was Emailed <span>*</span></label>
										<input type="text" class="form-control" data-inputmask="'alias': 'mm/dd/yyyy'" data-mask required="true" name="pt_dateRefEmailed" value="{{ set_value('pt_dateRefEmailed', transaction.pt_dateRefEmailed) }}">
										
									</div>
									
									<div class="col-md-12 form-group">
									
										<label class="control-label">Notes</label>
										<textarea class="form-control" name="pt_notes">{{ set_value('pt_notes', transaction.pt_notes) }}</textarea>
										
									</div>
									
									<div class="col-md-12 form-group xrx-btn-handler">
					              		<button type="submit" class="btn btn-primary xrx-btn">
											<i class="fa fa-check"></i> Update Transaction
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