<?php

namespace Mobiledrs\entities\patient_management;

class POS_entity extends \Mobiledrs\entities\Entity {

	protected $pos_id;
	protected $pos_code;
	protected $pos_name;

	private $pos_list = [
		2000000001 => 'POS11',
		2000000002 => 'POS12',
		2000000003 => 'POS13',
		2000000004 => 'POS14'
	];

	public function get_pos_name(string $pos_id) : string
	{
		return $this->pos_list[$pos_id] ?? '';
	}

	public function get_pos_completename(string $pos_id) : string
	{
		return $this->pos_list[$pos_id] . ' - ' . $this->pos_name;
	}
}
