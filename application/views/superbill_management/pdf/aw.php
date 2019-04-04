<img src="<?php echo base_url() ?>/dist/img/pdf_header_landscape.png">

<p style="margin:0; padding:0;"><span style="font-size:16px;">Annual Wellness</span><br>
<span style="font-size:10px; color: gray; padding-top:6px">Date Billed:</span> <?php echo $date_billed; ?></p>

<p style="font-size:8px; color: gray;">VISITS</p>

<table style="font-size: 7px;padding: 5px;">
	<thead>
		<tr>
			<th width="130px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8;">Patient Name</th>
			<th width="65px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">Medicare</th>
			<th width="50px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">DOB</th>
			<th width="125px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">Address</th>
			<th width="60px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">Phone</th>
			<th width="40px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">AW/IPPE</th>
			<th width="110px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">Provider</th>
			<th width="50px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">Date of Service</th>
			<th width="40px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">Place of Service</th>
			<th width="100px" bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">ICD-Code Diagnoses</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach($transaction_entity->has_performed_in_list($transactions) as $transaction): ?>
			<tr>
				<td width="130px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $transaction->patient_name; ?></td>
				<td width="65px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $transaction->patient_medicareNum; ?></td>
				<td width="50px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $transaction->get_date_format($transaction->patient_dateOfBirth); ?></td>
				<td width="125px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $transaction->patient_address; ?></td>
				<td width="60px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $transaction->patient_phoneNum; ?></td>
				<td width="40px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $transaction->pt_aw_ippe_code; ?></td>
				<td width="110px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $transaction->get_provider_fullname(); ?></td>
				<td width="50px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $transaction->get_date_format($transaction->pt_dateOfService); ?></td>
				<td width="40px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $POS_entity->get_pos_name($transaction->patient_placeOfService); ?></td>
				<td width="100px" style="border-bottom: 1px solid #d2d6de;"><?php echo  $transaction->pt_icd10_codes; ?></td>
			</tr>			
		<?php endforeach; ?>
	</tbody>
</table>
<table>
	<tr>
		<td style="width: 50%;">
            
            <p style="font-size:8px; color: gray; margin-bottom:10px; margin-left:5px;">NOTES</p>
            
            <span style="font-size: 7px;">
			<?php if ( ! empty($notes)): ?>

				<?php echo $notes; ?>

			<?php else: ?>

				There are no additional notes.

			<?php endif; ?>
            </span>
            
		</td>
		<td style="width: 50%;">
            
            <p style="font-size:8px; color: gray; margin-bottom:10px; margin-left:5px;">SUMMARY</p>
            
			<table style="font-size: 8px;padding: 5px;">
                <thead>
					<tr>
						<th bgcolor="#548bb8" style="color: white;border:1px solid #548bb8;">Code</th>
						<th bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">Name</th>
						<th bgcolor="#548bb8" style="color: white;border:1px solid #548bb8">No. of Visits</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="border-bottom: 1px solid #d2d6de;">G0402</th>
						<td style="border-bottom: 1px solid #d2d6de;">IPPE</td>
						<td style="border-bottom: 1px solid #d2d6de;"><?php echo  $summary['AW_CODES_G0402']; ?></td>
					</tr>
					
					<tr>
						<th style="border-bottom: 1px solid #d2d6de;">G0438</th>
						<td style="border-bottom: 1px solid #d2d6de;">AW – 8</td>
						<td style="border-bottom: 1px solid #d2d6de;"><?php echo  $summary['AW_CODE_G0438']; ?></td>
					</tr>
					
					<tr>
						<th style="border-bottom: 1px solid #d2d6de;">G0439</th>
						<td style="border-bottom: 1px solid #d2d6de;">AW – 9</td>
						<td style="border-bottom: 1px solid #d2d6de;"><?php echo  $summary['AW_CODE_G0439']; ?></td>
					</tr>
					
					<tr class="total">
                        <th colspan="2" style="border-bottom: 1px solid #d2d6de;"><span style="font-size:12px">Total</span></th>
                        <th style="border-bottom: 1px solid #d2d6de;"><span style="font-size:12px; font-weight:bold;"><?php echo  $summary['total']; ?></span></th>
					</tr>
				</tbody>
			</table>
		</td>
	</tr>
</table>