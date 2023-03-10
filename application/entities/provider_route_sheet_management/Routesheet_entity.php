<?php

namespace Mobiledrs\entities\provider_route_sheet_management;

class Routesheet_entity extends \Mobiledrs\entities\Entity {
	
	protected $prs_id;
	protected $prs_providerID;
	protected $prs_dateOfService;
	protected $prs_dateCreated;
	protected $prs_archive;
	protected $is_ca;

	protected $provider_id;
	protected $provider_firstname;
	protected $provider_lastname;
	protected $provider_contactNum;
	protected $provider_email;
	protected $provider_address;
	protected $provider_dateOfBirth;
	protected $provider_languages;
	protected $provider_areas;
	protected $provider_npi;
	protected $provider_dea;
	protected $provider_license;
	protected $provider_gender;
	protected $provider_dateCreated;
	protected $provider_rate_initialVisit;
	protected $provider_rate_followUpVisit;
	protected $provider_rate_aw;
	protected $provider_rate_acp;
	protected $provider_rate_noShowPT;
	protected $provider_rate_others;
	protected $provider_rate_mileage;
	protected $provider_rate_initialVisit_TeleHealth;
	protected $provider_rate_followUpVisit_TeleHealth;
	protected $provider_supervising_MD;
	protected $provider_inactive;
	protected $provider_rate_hospiceEvaluationVisit;
	protected $provider_rate_hospiceFollowUpVisit;
	protected $provider_rate_changeOfConditionVisit;
	protected $provider_rate_transitionalCareVisit;
	protected $provider_rate_hospiceEvaluationVisit_TeleHealth;
	protected $provider_rate_hospiceFollowUpVisit_TeleHealth;
	protected $provider_rate_changeOfConditionVisit_TeleHealth;
	protected $provider_rate_ca_homeHealth;
	protected $provider_rate_ca_teleHealth;
	

	public function get_provider_fullname() : string
	{
		return $this->provider_firstname . ' ' . $this->provider_lastname;
	}
}