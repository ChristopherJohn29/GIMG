<?php

require APPPATH . 'libraries/entities/Entity.php';

class User_entity extends Entity {
	
	protected $user_id; 
	protected $user_firstname;
	protected $user_lastname;
	protected $user_email;
	protected $user_dateCreated;
	protected $user_password;
	protected $user_roleID;
	protected $user_dateOfBirth;

	public function validate_password(string $password) : bool
	{
		return password_verify($password, $this->user_password);
	}
}