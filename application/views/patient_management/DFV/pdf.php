<img src="<?php echo base_url(); ?>/dist/img/pdf_header_portrait.png">

<h3 class="box-title">Due For Visits</h3><br>

Date: <?php echo  $currentDate; ?><br>
Total: <?php echo  $total; ?><br>

<br>

<table class="table no-margin table-hover" style="font-size: 7px;padding: 5px;">
    <thead>
        <tr>
            <th bgcolor="#548bb8" style="color: white;border:1px solid #548bb8; font-weight:bold;">Patient Name</th>
            <th bgcolor="#548bb8" style="color: white;border:1px solid #548bb8; font-weight:bold;">Subnote</th>
            <th bgcolor="#548bb8" style="color: white;border:1px solid #548bb8; font-weight:bold;">Date of Service</th>
            <th bgcolor="#548bb8" style="color: white;border:1px solid #548bb8; font-weight:bold;">Home Health</th>
            <th bgcolor="#548bb8" style="color: white;border:1px solid #548bb8; font-weight:bold;">Contact Person</th>
            
        </tr>
    </thead>

    <tbody>
        
        <?php foreach($records as $record): ?>

            <tr>
                <td style="border-bottom: 1px solid #d2d6de;">
                    <?php echo $record['patientName']; ?>
                </td>
                <td style="border-bottom: 1px solid #d2d6de;">
                    <?php echo $record['subnote']; ?>
                </td>
                <td style="border-bottom: 1px solid #d2d6de;">
                    <?php echo $record['dos']; ?>
                </td>
                <td style="border-bottom: 1px solid #d2d6de;">
                    <?php echo $record['homeHealth']; ?>
                </td>
                <td style="border-bottom: 1px solid #d2d6de;">
                    <?php echo $record['contactPerson']; ?>
                </td>
            
            </tr>

        <?php endforeach; ?>

    </tbody>
</table>