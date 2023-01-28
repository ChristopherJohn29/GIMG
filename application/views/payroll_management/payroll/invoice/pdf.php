<!DOCTYPE html>
<html>
<head>
    
<style>
    
    h1 {
        color: #d4d4d4;
        font-size: 32px;
        font-weight: bolder;
        margin: 100px 0 30px;
        text-align: center;
    }
    
    div.receiver {
        clear: both;
        display: block;
    }
    
    div.receiver p {
        color: #000000;
        font-size: 8px;
        font-weight: normal;
    }
    
    div.receiver p span {
        clear: both;
        display: block;
        margin-bottom: 5px;
    }
    
    div.receiver p span.contact,
    div.receiver p span.homehealth {
        font-size: 12px;
        font-weight: bold;
    }
    
    div.receiver p span.invoice_num,
    div.receiver p span.invoice_date {
        clear: none;
        display: inline-block;
    }
    
    .header .logo {
        display: inline-block;
        clear: none !important;
        float: left;
        width: 616px !important;
    }
    
    .header .ofc {
        display: inline-block;
        float: right;
        font-size: 9px;
    }
    
</style>
    
</head>
<body>
    
<img src="<?php echo base_url() ?>/dist/img/pdf_header_portrait.png">
    
<h1>INVOICE</h1>

<div class="receiver">
    
<p>
<span class="invoice_date">DATE ISSUED:</span>
<span style="font-size:10px; color: black; font-weight:bold;"><?= $dateToday ?></span><br>
<span class="invoice_num">INVOICE #:</span>
<span style="font-size:10px; color: black; font-weight:bold;"><?= $invoiceNumber ?></span>
</p>
    
<p>
<span>INVOICE TO:</span><br>
<span class="homehealth"><?= $homeHealth ?></span><br>
<span><?= $homeHealthAddress ?></span>
</p>

<p>
<span>ATTENTION:</span><br>
<span class="contact"><?= $contactName ?></span>
</p>

</div>

<table style="padding: 10px 0 10px 10px;">
	<thead>
		<tr style="background-color:#e3e3e3;">
			<th width="120px" style="color: black; font-weight:bold; font-size:9px;">DESCRIPTION</th>
			<th width="190px" style="color: black; font-weight:bold; font-size:9px;">PATIENT NAME</th>
			<th width="120px" style="color: black; font-weight:bold; font-size:9px;">DATE OF SERVICE</th>
			<th width="90px" style="color: black; font-weight:bold; font-size:9px;">AMOUNT</th>
		</tr>
	</thead>
	<tbody>
        <?php foreach($entries as $entry) : ?>
        <tr>
            <td width="120px" style="border-bottom:1px solid #f1efef; font-size:10px; color: black;">
                <?=$entry['description'] ? $entry['description'] : '' ?>
            </td>
            <td width="190px" style="border-bottom:1px solid #f1efef; font-size:10px; color: black;">
                <?=$entry['patient_name'] ? $entry['patient_name'] : '' ?>
            </td>
            <td width="120px" style="border-bottom:1px solid #f1efef; font-size:10px; color: black;">
                <?=$entry['date_of_service'] ? $entry['date_of_service'] : '' ?>
            </td>
            <td width="90px" style="border-bottom:1px solid #f1efef; font-size:10px; color: black;">
                <?=$entry['amount'] ? $entry['amount'] : '' ?>
            </td>
        </tr>
        <?php endforeach; ?>
        <tr>
            <td width="120px"></td>
            <td width="190px"></td>
            <td width="120px"><p style="text-align:right; font-size:12px;">TOTAL</p></td>
            <td width="90px" style="font-size:12px; color: black; font-weight:bold;">
                <?=$totalAmount?>
            </td>
        </tr>
	</tbody>
</table>


<span style="font-size:8px;">REMARKS:</span>
<br>
<span style="font-size:9px;">* Total Payment due in 15 days.</span>
<br>
<span style="font-size:9px;">* Please include invoice number on your check.</span>
<br>
<span style="font-size:9px;">* Make all checks payable to: </span><span style="font-size:10px; color: black; font-weight:bold;">Global Integrated Medical Group</span>
<br>
<span style="font-size:9px; white-space: pre-line;"><?=$additionalRemarks?></span>

<p style="text-align:center; margin: 30px 0 0; font-size: 14px; color: #000;">Thank You For Your Business!</p>
    
</body>
</html>



