<?php

class Profile_model extends \Mobiledrs\core\MY_Models {
	
	protected $table_name = 'patient';
	protected $entity = '\Mobiledrs\entities\patient_management\Profile_entity';
	protected $record_entity = null;

	public function __construct()
	{
		parent::__construct();

		$this->record_entity = new \Mobiledrs\entities\patient_management\Profile_entity();
	}

	public function prepare_data() : array
	{
		$this->prepare_entity_data();

		return [
			'patient_firstname' => $this->record_entity->patient_firstname,
			'patient_lastname' => $this->record_entity->patient_lastname,
			'patient_gender' => $this->record_entity->patient_gender,
			'patient_referralDate' => $this->record_entity->set_date_format($this->record_entity->patient_referralDate),
			'patient_medicareNum' => $this->record_entity->patient_medicareNum,
			'patient_dateOfBirth' => $this->record_entity->set_date_format($this->record_entity->patient_dateOfBirth),
			'patient_phoneNum' => $this->record_entity->patient_phoneNum,
			'patient_address' => $this->record_entity->patient_address,
			'patient_hhcID' => $this->record_entity->patient_hhcID,
			'patient_caregiver_family' => $this->record_entity->patient_caregiver_family
		];
	}

	public function search() : array
	{
		$patients_params = [
			'where_data' => [
				[ 
					'key' => 'patient.patient_firstname', 
					'value' => $this->input->post('search_term')
				],
				[ 
					'key' => 'patient.patient_lastname', 
					'value' => $this->input->post('search_term') 
				],
				[ 
					'key' => 'patient.patient_medicareNum', 
					'value' => $this->input->post('search_term') 
				]
			]
		];

		$records = $this->find($patients_params);

		$new_records = [];

		for ($i = 0; $i < count($records); $i++) {
			$trans_params = [
				'order_key' => 'patient_transactions.pt_dateOfService',
				'order_by' => 'DESC',
				'key' => 'patient_transactions.pt_patientID',
				'value' => $records[$i]->patient_id
			];

			$patient_trans = $this->transaction_model->record($trans_params);

			$new_records[] = [
				'patientId' => $records[$i]->patient_id,
				'patientName' => $records[$i]->get_fullname(),
				'patientReferralDate' => $records[$i]->get_date_format($records[$i]->patient_referralDate),
				'ICD10' => $patient_trans->pt_icd10_codes,
				'dateOfService' => $patient_trans->get_date_format($patient_trans->pt_dateOfService)
			];
		}

		return $new_records;
	}
}