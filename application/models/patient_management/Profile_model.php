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

	public function updateSpouse($patient_id = 0, $patient_spouse = 0) {
		$query = array(
			'patient_spouse' => $patient_spouse
		);


		$this->db->set($query);
		$this->db->where('patient_id', $patient_id);
		return $this->db->update('patient');
	}

	public function updateNameAddress($patient_id = 0) {
		$query = array(
			'patient_name' => $this->input->post('patient_name'),
			'patient_address' => $this->input->post('patient_address')
		);

		$this->db->set($query);
		$this->db->where('patient_id', $patient_id);
		return $this->db->update('patient');
	}

	public function getSpouseData($patient_id) {

		$this->db->select('*');
		$this->db->where('patient_id', $patient_id);
		$this->db->from('patient');
		$result = $this->db->get()->result_array();

		return $result;
	}

	public function prepare_data() : array
	{
		$this->prepare_entity_data();

		return [
			'patient_name' => $this->record_entity->patient_name,
			'patient_gender' => $this->record_entity->patient_gender,
			'patient_medicareNum' => $this->record_entity->patient_medicareNum,
			'patient_dateOfBirth' => $this->record_entity->set_date_format($this->record_entity->patient_dateOfBirth),
			'patient_phoneNum' => $this->record_entity->patient_phoneNum,
			'patient_address' => $this->record_entity->patient_address,
			'patient_hhcID' => $this->record_entity->patient_hhcID,
			'patient_caregiver_family' => $this->record_entity->patient_caregiver_family,
			'patient_spouse' => $this->record_entity->patient_spouse,
			'patient_sub_note' => $this->record_entity->patient_sub_note,
			'patient_pharmacy' => $this->record_entity->patient_pharmacy,
			'patient_pharmacyPhone' => $this->record_entity->patient_pharmacyPhone,
			'patient_drug_allergy' => $this->record_entity->patient_drug_allergy,
		];
	}

	public function searchByHomeHealth($homeHealt = false){
		$this->db->select('patient_name, patient_id');
		$this->db->where('patient_hhcID', $homeHealt);
		$this->db->from('patient');
		$this->db->order_by('patient_name', 'ASC');
		$results = $this->db->get()->result_array();

		$dataArray = array();
		foreach($results as $result){

			$this->db->select('pt_dateOfService');
			$this->db->where('pt_patientID', $result['patient_id']);
			$this->db->from('patient_transactions');
			$this->db->order_by('pt_dateOfService', 'DESC');
			$this->db->limit(1);

			$trans = $this->db->get()->result_array();

			if(isset($trans[0]['pt_dateOfService'])){
				$dataArray[] = array(
					'patient_name' => $result['patient_name'],
					'patient_id' => $result['patient_id'],
					'pt_dateOfService' => $trans[0]['pt_dateOfService']
				);
			}
			
		}

		return $dataArray;
	}

	public function search() : array
	{
		$patients_params = [
			'where_data' => [
				[ 
					'key' => 'patient.patient_name', 
					'value' => $this->input->post('search_term')
				],
				[ 
					'key' => 'patient.patient_medicareNum', 
					'value' => $this->input->post('search_term') 
				]
			]
		];

		$records = $this->find($patients_params);

		return $this->get_pt_profile_trans_recently_added($records);
	}

	public function findHhc($patient_id = 0){

		
		$this->db->select('*');
        $this->db->where('patient_id', $patient_id);
        $this->db->from('patient');
		$this->db->join('home_health_care', 'home_health_care.hhc_id = patient.patient_hhcID');
        $result = $this->db->get()->result_array();

        return $result;

	}
	
	public function get_pt_profile_trans(array $records) : array
	{
		$new_records = [];
		$added_patients = [];

		for ($i = 0; $i < count($records); $i++) {
			// no duplicate of patient name in the list
			if (in_array($records[$i]->pt_patientID, $added_patients))
			{
				continue;
			}

			$patientDetails_params = [
				'key' => 'patient.patient_id',
				'value' => $records[$i]->pt_patientID
			];

			// get the latest date of referral and date of service
			$trans_params = [
				'key' => 'patient_transactions.pt_patientID',
				'value' => $records[$i]->pt_patientID,
				'joins' => [
					[
						'join_table_name' => 'provider',
						'join_table_key' => 'provider.provider_id',
						'join_table_condition' => '=',
						'join_table_value' => 'patient_transactions.pt_providerID',
						'join_table_type' => 'left'
					]
				],
				'orders' => [
					[
						'column' => 'patient_transactions.pt_dateRef',
						'direction' => 'desc'
					],
					[
						'column' => 'patient_transactions.pt_dateOfService',
						'direction' => 'desc'
					]
				]
			];

			$cpo_params = [
				'order_key' => 'patient_CPO.ptcpo_dateBilled',
				'order_by' => 'DESC',
				'key' => 'patient_CPO.ptcpo_patientID',
				'value' => $records[$i]->pt_patientID
			];

			$patientDetails = $this->profile_model->record($patientDetails_params);
			$patient_trans = $this->transaction_model->record($trans_params);
			$patient_CPO = $this->CPO_model->record($cpo_params);

			$new_records[] = [
				'patientId' => $patientDetails->patient_id,
				'pt_tovID' => $patient_trans ? $patient_trans->pt_tovID : '',
				'patientName' => $patientDetails->patient_name,
				'patientReferralDate' => ($patient_trans && $patient_trans->pt_dateRef != '0000-00-00') ? $patient_trans->get_date_format($patient_trans->pt_dateRef) : '',
				'ICD10' => $patient_trans ? $patient_trans->pt_icd10_codes : '',
				'notes' => $patient_trans ? $patient_trans->pt_notes : '',
				'dateOfService' => $patient_trans ? $patient_trans->get_date_format($patient_trans->pt_dateOfService) : '',
				'provider_paid' => $patient_trans ? $patient_trans->get_date_format($patient_trans->pt_service_billed) : '',
				'aw_billed' => $patient_trans ? $patient_trans->get_date_format($patient_trans->pt_aw_billed) : '',
				'visit_billed' => $patient_trans ? $patient_trans->get_date_format($patient_trans->pt_visitBilled) : '',
				'provider' => $patient_trans ? $patient_trans->get_provider_fullname() : '',
				'cpo_billed' => $patient_CPO ? $patient_CPO->get_date_format($patient_CPO->ptcpo_dateBilled) : ''
			];

			$added_patients[] = $records[$i]->pt_patientID;
		}

		return $new_records;
	}

	public function get_pt_profile_trans_recently_added(array $records) : array
	{
		$new_records = [];

		for ($i = 0; $i < count($records); $i++) {
			$trans_params = [
				'key' => 'patient_transactions.pt_patientID',
				'value' => $records[$i]->patient_id,
				'joins' => [
					[
						'join_table_name' => 'provider',
						'join_table_key' => 'provider.provider_id',
						'join_table_condition' => '=',
						'join_table_value' => 'patient_transactions.pt_providerID',
						'join_table_type' => 'left'
					]
				],
				'order_key' => 'patient_transactions.pt_dateOfService',
				'order_by' => 'DESC'
			];

			$patient_trans = $this->transaction_model->record($trans_params);

			$new_records[] = [
				'patientId' => $records[$i]->patient_id,
				'pt_tovID' => $patient_trans ? $patient_trans->pt_tovID : '',
				'patientName' => $records[$i]->patient_name,
				'patientReferralDate' => ($patient_trans && $patient_trans->pt_dateRef != '0000-00-00') ? $patient_trans->get_date_format($patient_trans->pt_dateRef) : '',
				'ICD10' => $patient_trans ? $patient_trans->pt_icd10_codes : '',
				'notes' => $patient_trans ? $patient_trans->pt_notes : '',
				'dateOfService' => $patient_trans ? $patient_trans->get_date_format($patient_trans->pt_dateOfService) : '',
				'provider' => $patient_trans ? $patient_trans->get_provider_fullname() : ''
			];
		}

		return $new_records;
	}
}