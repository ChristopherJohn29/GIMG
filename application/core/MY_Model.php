<?php

class MY_Model extends CI_Model {
	protected $table_name = '';
	protected $limit = 0;
	protected $offset = 5;

	public function __construct()
	{
		parent::__construct();
	}

	public function insert(array $params) : int
	{
		$this->db->insert($this->table_name, $params['data']);

		return $this->db->insert_id();
	}

	public function update(array $params) : bool
	{
		return $this->db->update($this->table_name, $params['data'], [$params['key'] => $params['value']]);
	}

	public function record(array $params)
	{
		$this->db->where($params['key'], $params['value']);

		$query = $this->db->get($this->table_name);

		return $query->custom_row_object(0, $this->entity);
	}

	public function records(array $params = [])
	{
		if (isset($params['order_by'])) 
		{
			$this->db->order_by($params['key'], $params['order_by']);
		}

		if (isset($params['where'])) 
		{
			$this->db->where(
				$params['where']['key'] . ' ' .
				$params['where']['condition'],
				$params['where']['value']
			);
		}

		$query = $this->db->get($this->table_name, $this->limit, $this->offset);

		return $query->custom_result_object($this->entity);
	}

	public function find(array $params)
	{
		foreach ($params['where_data'] as $key => $value) {
			$this->db->like($key, $value);
		}

		$query = $this->db->get($this->table_name);

		return $query->custom_result_object($this->entity);
	}

	public function get_records_by_join(array $params)
	{	
		if (isset($params['joins'])) 
		{
			foreach ($params['joins'] as $key => $value) 
			{
				$this->db->join(
					$value['join_table_name'],
					$value['join_table_key'] . ' ' .
					$value['join_table_condition'] . ' ' .
					$value['join_table_value'],
					$value['join_table_type']
				);
			}
		}

		if (isset($params['where']))
		{
			$this->db->where(
				$params['where']['key'] . ' ' .
				$params['where']['condition'],
				$params['where']['value']
			);
		}

		$query = $this->db->get($this->table_name);

		return (isset($params['return_type']) && $params['return_type'] == 'row') ?
			$query->custom_row_object(0, $this->entity) :
			$query->custom_result_object($this->entity);
	}
}