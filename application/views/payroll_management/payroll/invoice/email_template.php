<p style="margin-bottom: 22px;">Hi <strong><?php echo $contactName; ?></strong>,</p>

<p>See attached invoice <?php echo $invoiceNumber; ?> for <?php 

$patientHtml = ''; 
foreach($patients as $patient) : $patientHtml .= $patient.', ';endforeach; $patientHtml .= '999';
echo str_replace(', 999', '', $patientHtml);

?> (<?php echo $invoiceType ?>).</p>

<p>Kindly send the check to our office</p>

<p> 
Regards,<br>
Ronald Maghanoy
</p>

