{% extends "main.php" %}

{% set page_title = 'Provider List' %}

{% 
  set scripts = [
    'bower_components/datatables.net/js/dataTables.buttons.min',
    'dist/js/payroll_management/payroll/listInvoice'
  ]
%}

{% block content %}
	 <div class="row">

	 	<div class="col-xs-12">
	      {% if states %}
	        {{ include('commons/alerts.php') }}
	      {% endif %}
	    </div>

        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Invoice</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

            	<div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">UNPAID INVOICE</a></li>
              <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false" id="paid">PAID INVOICE</a></li>
             
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">

             
                <div class="table-responsive" style="overflow-x: hidden;">
               
                	<input type="hidden" name="totalUnpaid" value="{{ totalUnpaid }}">

                    {{ form_open("payroll_management/payroll/toPaid", {"class": "xrx-form"}) }}
                    <table id="all-patient-list" class="table no-margin table-hover">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="checkall"></th>
                                <th>Invoice #</th>
                                <th>Patient name</th>
                                <th>Date of Invoice (sent)</th>
                                <th>Home Health</th>
                                <th>Amount</th>
                                <th>Contact (phone#)</th>
                            </tr>
                        </thead>
                            
                        <tbody>
                            
                            {% if unpaid_invoice is defined %}

                                {% for record in unpaid_invoice %}

                                    <tr>
                                        <td><input type="checkbox" class="toPaid" value="{{ record.id }},{{ record.patient_id }}" name="toPaid[]"></td>
                                        <td>{{ record.invoice_id }}</td>
                                        <td>{{ record.patientName }}</td>
                                        <td>{{ record.invoiceDate }}</td>
                                        <td>{{ record.homeHealthName }}</td>
                                        <td>{{ record.amount }}</td>
                                        <td>{{ record.homeHealthContactNumber }}</td>
                                    </tr>

                                {% endfor %}

                            {% endif %}

                        </tbody>
                            
                        <tfoot>
                            <tr>
                                <th><input type="checkbox" class="checkall"></th>
                                <th>Invoice #</th>
                                <th>Patient name</th>
                                <th>Date of Invoice (sent)</th>
                                <th>Home Health</th>
                                <th>Amount</th>
                                <th>Contact (phone#)</th>
                            </tr>
                        </tfoot>
                            
                    </table>
                    <button type="submit" class="btn btn-danger xrx-btn pull-right" name="submit_type" style="margin-right: 5px;" value="paid" disabled="true" id="paidBtn">
                    <i class="fa fa-credit-card"></i> Paid
                </button>
                 
                </div>
           

              

               
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_2">

              <div class="table-responsive">
                	<input type="hidden" name="totalPaid" value="{{ totalPaid }}">

				    <table id="paid-patient-list" class="table no-margin table-hover">
					<thead>
						<tr>
                            
                            <th>Invoice #</th>
							<th>Patient name</th>
							<th>Date of Invoice (sent)</th>
							<th>Home Health</th>
							<th>Amount</th>
                            <th>Contact (phone#)</th>
                            <th>Paid date</th>
						</tr>
					</thead>
	                  
					<tbody>
						
						{% if paid_invoice is defined %}

							{% for record in paid_invoice %}

								<tr>
                                    
									<td>{{ record.invoice_id }}</td>
									<td>{{ record.patientName }}</td>
									<td>{{ record.invoiceDate }}</td>
									<td>{{ record.homeHealthName }}</td>
                                    <td>{{ record.amount }}</td>
                                    <td>{{ record.homeHealthContactNumber }}</td>
                                    <td>{{ record.datePaid }}</td>
								</tr>

							{% endfor %}

						{% endif %}

					</tbody>
                        
                    <tfoot>
		                <tr>
                           
		                  	<th>Invoice #</th>
							<th>Patient name</th>
							<th>Date of Invoice (sent)</th>
							<th>Home Health</th>
							<th>Amount</th>
                            <th>Contact (phone#)</th>
                            <th>Paid date</th>
		                </tr>
		              </tfoot>
                        
                </table>
                </div>

              </div>
              <!-- /.tab-pane -->
            
            </div>
            <!-- /.tab-content -->
          </div>

          
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          
        </div>
    </div>
{% endblock %}