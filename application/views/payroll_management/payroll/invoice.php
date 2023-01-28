{% extends "main.php" %}

{% 
  set scripts = [
    'plugins/input-mask/jquery.inputmask',
    'plugins/input-mask/jquery.inputmask.date.extensions',
    'plugins/input-mask/jquery.inputmask.extensions',
    'dist/js/payroll_management/payroll/invoice',
  ]
%}

{% set page_title = 'Add Patient' %}

{% block content %}
<div class="row">

    <div class="col-lg-12">
        <div class="box">

            <!-- /.box-header -->

            <!-- form start -->
            <div class="row">

                <div class="col-xs-12">
                    {% if states %}
                        {{ include('commons/alerts.php') }}
                    {% endif %}
                </div>

            
	         </div>

            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="box-body">

                        {{ form_open("payroll_management/payroll/sendInvoice", {"class": "xrx-form"}) }}

                        <div class="row">
                            <div class="col-md-12">
                                <label class="lead">Create Invoice</label>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4" style="margin-bottom: 20px;">
                                <label class="control-label">INVOICE#: {{ invoiceNumber }}</label>
                            </div>

                            <div class="col-md-8" style="margin-bottom: 20px;">
                                <label class="control-label">DATE: {{ dateToday }}</label>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-4 form-group">
                                <label class="control-label">No Part B or Hospice Evaluation</label>
                                <select class="form-control col-md-6" name="invoice_type" required>
                                    <option value="No Part B">No Part B</option>
                                    <option value="Hospice Evaluation">Hospice Evaluation</option>
                                </select>
                            </div>
                        </div>

                        <div class="row" style="margin-top:10px;">
                            <div class="col-md-4 form-group">
                                <label class="control-label">Contact Person</label>
                                <input type="text" class="form-control" placeholder="" name="contact_person" value="" required>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="control-label">Home Health <span>*</span></label>

                                <div class="dropdown mobiledrs-autosuggest-select">
                                    <input type="hidden" id="patient_hhcID" name="patient_hhcID" required="true">

                                    <input class="form-control" type="text" data-mobiledrs_autosuggest data-mobiledrs_autosuggest_url="{{ site_url('ajax/home_health_care_management/profile/search') }}" data-mobiledrs_autosuggest_dropdown_id="patient_hhcID_dropdown" id="patient_hhcID_dropdown_trigger">

                                    <div data-mobiledrs_autosuggest_dropdown id="patient_hhcID_dropdown" style="width: 100%;">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row" style="margin-top:10px;">
                            <div class="col-md-4 form-group">
                                <label class="control-label">Patient/s <span>*</span></label>
                            </div>
                            <div class="col-md-3 form-group">
                                <label class="control-label">Date of Service</label>
                            </div>

                            <div class="col-md-3 form-group ">
                                <label class="control-label">Amount</label>
                            </div>

                            <div class="col-md-2 form-group ">
                                <label class="control-label">Remove</label>
                            </div>

                        </div>

                        

                        <div class="row patiend-row" style="margin-top:10px;">
                            <div class="col-md-4 form-group">
                                <select class="prsl_patientID form-control" name="patientID[]" required="true">
                                </select>
                            </div>
                            <div class="col-md-3 form-group date-label">
                            </div>

                            <div class="col-md-3 form-group">
                                <input type="number" class="form-control amount-price" placeholder="" name="amount[]" value="">
                            </div>
                            <div class="col-md-2 form-group">
                            <i class="fa fa-remove remove-patient" style="cursor: pointer;"></i>
                            </div>
                        </div>


                        <div class="row" style="margin-top:10px;">
                            <div class="col-md-3 form-group ">
                                <button type="button" class="btn btn-block btn-default add-patient"><i class="fa fa-fw fa-plus"></i>Add Patient</button>
                            </div>
                        </div>
                        <div class="row" style="margin-top:10px;">
                            <div class="col-md-4 form-group" style="float: right;">
                                <label class="control-label" style="margin-right:35px;font-size: 17px;">Total</label>
                                <label class="control-label total-price" style="font-size: 17px;"></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label class="control-label">Additional Remarks</label>
                                <textarea rows="6" class="form-control" name="additional_remarks"></textarea>
                            </div>
                        </div>




                        <div class="row">
                            <div class="col-md-12 form-group xrx-btn-handler">
                                <a href="{{ site_url('patient_management/profile') }}" class="btn btn-default xrx-btn cancel">
                                    Cancel
                                </a>
                                <button type="submit" class="btn btn-primary xrx-btn">
                                    <i class="fa fa-check"></i> Send Invoice
                                </button>
                            </div>

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