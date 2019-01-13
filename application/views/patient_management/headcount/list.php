<div class="box-body">
    
    <div class="table-responsive">
        <table id="all-patient-list" class="table no-margin table-hover">
            <thead>
                <tr>
                    <th>Patient Name</th>
                    <th>Provider</th>
                    <th>Deductible</th>
                    <th>Home Health</th>
                    <th>Visit Billed</th>
                </tr>
            </thead>

            <tbody>

                {% for headcount in headcounts %}

                    <tr>
                        <td>{{ headcount['patient_name'] }}</td>
                        <td>{{ headcount['provider'] }}</td>
                        <td>{{ headcount['deductible'] }}</td>
                        <td>{{ headcount['home_health'] }}</td>
                        <td>{{ headcount['visit_billed'] }}</td>
                    </tr>

                {% endfor %}

            </tbody>
        </table>
    </div>
</div>