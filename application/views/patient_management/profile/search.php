{% extends "main.php" %}

{% set page_title = 'Search Patient' %}

{% block content %}

<div class="row">
    
    <div class="col-lg-12">
    
        <div class="box">

            <div class="box-body">

                <section class="xrx-info">

                <div class="row">
                    
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="search-handler">
                            
                           {{ form_open("patient_management/profile/search", {"class": "xrx-form"}) }}
                                
                                <label><p class="lead">Search a Patient</p></label>
                                <div class="input-group">
                                  <div class="input-group-addon">
                                    <i class="fa fa-search"></i>
                                  </div>
                                  <input type="text" class="form-control input-lg" name="search_term" required="true">
                                </div>
                            
                            </form>
                            
                        </div>
                    </div>
                    
                </div>

                <div class="row xrx-row-spacer">

                    <div class="box-body">
                        <div class="table-responsive">
                            
                            <p class="lead">Search Result</p>
                            
                            <table id="all-patient-list" class="table no-margin table-hover">
                                <thead>
                                    <tr>
                                        <th>Patient Name</th>
                                        <th>Referral Date</th>
                                        <th>ICD10 - Code Diagnoses</th>
                                        <th>Date of Service</th>
                                        <th width="120px">Actions</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    {% if records %}

                                        {% for record in records %}

                                            <tr>
                                                <td>{{ record.get_fullname() }}</td>
                                                <td>{{ record.get_date_format(record.patient_referralDate) }}</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>
                                                    <a href="{{ site_url("patient_management/profile/details/#{ record.patient_id }") }}"><span class="label label-primary">View Details</span></a>
                                                </td>
                                            </tr>

                                        {% endfor %}

                                    {% else %}

                                        <tr>
                                            <td colspan="5" class="text-center">No data available in table</td>
                                        </tr>

                                    {% endif %}

                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                </div>

                </section>

            </div>
        <!-- /.box-body -->
        </div>
    <!-- /.box -->
    </div>

</div> 

{% endblock %}