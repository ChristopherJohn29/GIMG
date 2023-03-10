{% extends "basic.php" %}

{% set page_title = 'Print Due For Visits' %}
{% set body_class = 'print' %}

{% block content %}
    
<script type="text/javascript">
	window.print();
</script>

<div class="box-body">
    <div class="table-responsive">
        <h3 class="box-title">Due For Visits</h3><br>

        <p>
            Date: {{ currentDate }}<br>
            Total: {{ total }}
        </p>

        <table id="headcount-list" class="table no-margin table-hover">
            <thead>
                <tr>
                    <th>Patient Name</th>
                    <th>Subnote</th>
                    <th>Date of Service</th>
                    <th>Home Health</th>
                    <th>Contact Person</th>
                </tr>
            </thead>

            <tbody>

                {% for record in records %}

                    <tr>
                        <td>{{ record['patientName'] }}</td>
                        <td>{{ record['subnote'] }}</td>
                        <td>{{ record['dos'] }}</td>
                        <td>{{ record['homeHealth'] }}</td>
                        <td>{{ record['contactPerson'] }}</td>
                    </tr>

                {% endfor %}

            </tbody>
        </table>
    </div>
</div>

{% endblock %}