<?php

class Profile_model extends Mobiledrs\core\MY_Models {
	
	protected $table_name = 'provider';
	protected $entity = '\Mobiledrs\entities\provider_management\Profile_entity';
	protected $record_entity = null;

	public function __construct()
	{
		parent::__construct();

		$this->record_entity = new \Mobiledrs\entities\provider_management\Profile_entity();
	}

	public function lastInvoice() {
		$this->db->select('id');
		$this->db->from('invoice');
		$this->db->order_by('id', 'DESC');
		$this->db->limit(1);
		$result = $this->db->get()->result_array();

		return $result;
	}

	public function fetchHomeHealth($hhc_id) {
		$this->db->select('*');
		$this->db->from('home_health_care');
		$this->db->where('hhc_id', $hhc_id);
		$this->db->order_by('hhc_id', 'DESC');
		$this->db->limit(1);
		$result = $this->db->get()->result_array();

		return $result;
	}

	public function fetchPatient($patientId){
		$this->db->select('*');
		$this->db->from('patient');
		$this->db->where('patient_id', $patientId);
		$this->db->limit(1);
		$result = $this->db->get()->result_array();

		return $result;
	}

	public function unpaidInvoice(){
		$this->db->select('*');
		$this->db->from('invoice');
		$this->db->where('isPaid', 0);
		$this->db->order_by('id', 'DESC');
		$result = $this->db->get()->result_array();

		return $result;
	}

	public function paidInvoice(){
		$this->db->select('*');
		$this->db->from('invoice');
		$this->db->where('isPaid', 1);
		$this->db->order_by('id', 'DESC');
		$result = $this->db->get()->result_array();

		return $result;
	}

	public function fetchUnPaidInvoiceEntries($invoiceId){
		$this->db->select('*');
		$this->db->from('invoice_status');
		$this->db->where('isPaid', 0);
		$this->db->where('invoice_r_id', $invoiceId);
		$this->db->order_by('id', 'DESC');
		$result = $this->db->get()->result_array();

		return $result;
	}

	public function fetchPaidInvoiceEntries($invoiceId){
		$this->db->select('*');
		$this->db->from('invoice_status');
		$this->db->where('isPaid', 1);
		$this->db->where('invoice_r_id', $invoiceId);
		$this->db->order_by('id', 'DESC');
		$result = $this->db->get()->result_array();

		return $result;
	}

	public function invoice(){
		$this->db->select('*');
		$this->db->from('invoice');
		$this->db->order_by('id', 'DESC');
		$result = $this->db->get()->result_array();

		return $result;
	}

	public function toPaid($invoice_id, $patient_id, $date){
		$query['isPaid'] = 1;
		$query['datePaid'] = $date;
		$this->db->set($query);
        $this->db->where('invoice_r_id', $invoice_id);
		$this->db->where('patient_id', $patient_id);

        return $this->db->update('invoice_status');
	}


	public function saveInvoice($data = array()){
		$query['invoice_id'] = $data['invoiceNumber'];
		$query['hhc_id'] = $data['homeHealthId'];
		$query['contact_person'] = $data['contactName'];
		$query['remarks'] = $data['additionalRemarks'];
		$query['invoice_type'] = $data['invoiceType'];
		$query['patientIds'] = json_encode($data['patientIds']);
		$query['amount'] = json_encode($data['totalAmountRaw']);

		$this->db->insert('invoice', $query);

		$insert_id = $this->db->insert_id();

		return  $insert_id;
	}

	public function saveInvoiceEntry($patient_id, $amount, $invoice_id){
		$query['invoice_r_id'] = $invoice_id;
		$query['patient_id'] = $patient_id;
		$query['amount'] =  $amount;

		return $this->db->insert('invoice_status', $query);
	}

	public function prepare_data() : array
	{
		$this->prepare_entity_data();

		return [
			'provider_firstname' => $this->record_entity->provider_firstname,
			'provider_lastname' => $this->record_entity->provider_lastname,
			'provider_contactNum' => $this->record_entity->provider_contactNum,
			'provider_email' => $this->record_entity->provider_email,
			'provider_address' => $this->record_entity->provider_address,
			'provider_dateOfBirth' => $this->record_entity->set_date_format($this->record_entity->provider_dateOfBirth),
			'provider_languages' => $this->record_entity->provider_languages,
			'provider_areas' => $this->record_entity->provider_areas,
			'provider_npi' => $this->record_entity->provider_npi,
			'provider_dea' => $this->record_entity->provider_dea,
			'provider_license' => $this->record_entity->provider_license,
			'provider_gender' => $this->record_entity->provider_gender,
			'provider_rate_initialVisit' => $this->record_entity->provider_rate_initialVisit,
			'provider_rate_initialVisit_TeleHealth' => $this->record_entity->provider_rate_initialVisit_TeleHealth,
			'provider_rate_followUpVisit' => $this->record_entity->provider_rate_followUpVisit,
			'provider_rate_followUpVisit_TeleHealth' => $this->record_entity->provider_rate_followUpVisit_TeleHealth,
			'provider_rate_aw' => $this->record_entity->provider_rate_aw,
			'provider_rate_acp' => $this->record_entity->provider_rate_acp,
			'provider_rate_noShowPT' => $this->record_entity->provider_rate_noShowPT,
			'provider_rate_mileage' => $this->record_entity->provider_rate_mileage,
			'provider_supervising_MD' => $this->record_entity->provider_supervising_MD,
			'provider_inactive' => $this->record_entity->provider_inactive,
			'provider_rate_hospiceEvaluationVisit' => $this->record_entity->provider_rate_hospiceEvaluationVisit,
			'provider_rate_hospiceFollowUpVisit' => $this->record_entity->provider_rate_hospiceFollowUpVisit,
			'provider_rate_changeOfConditionVisit' => $this->record_entity->provider_rate_changeOfConditionVisit,
			'provider_rate_transitionalCareVisit' => $this->record_entity->provider_rate_transitionalCareVisit,
			'provider_rate_hospiceEvaluationVisit_TeleHealth' => $this->record_entity->provider_rate_hospiceEvaluationVisit_TeleHealth,
			'provider_rate_hospiceFollowUpVisit_TeleHealth' => $this->record_entity->provider_rate_hospiceFollowUpVisit_TeleHealth,
			'provider_rate_changeOfConditionVisit_TeleHealth' => $this->record_entity->provider_rate_changeOfConditionVisit_TeleHealth,
			'provider_rate_ca_homeHealth' => $this->record_entity->provider_rate_ca_homeHealth,
			'provider_rate_ca_teleHealth' => $this->record_entity->provider_rate_ca_teleHealth,
		];
	}

	public function supervisingMD_records() {
		return $this->records([
			'where' => [
				[
					'key' => 'provider_supervising_MD',
					'condition' => '',
					'value' => '1',
				]
			]
		]);
	}
}