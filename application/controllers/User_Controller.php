<?php
class User_Controller extends CI_Controller {
  function __construct(){
    parent::__construct();
    $this->load->helper('url');
    $this->load->database();
    $this->load->model('UserSession_Model');
  }
  public $table_name ="bh_users";
  public $id_pk ="id";
  public function index()
  {
    $query = $this->db->get($this->table_name);
    $data['records'] = $query->result();
    $this->load->helper('url');
    $response_array['status']='success';
    $response_array['operation']='list';
    $response_array['message']='Record fetched successfully.';
    $response_array['data']=$data;
    $this->output->set_content_type('application/json');
    $this->output->set_output( json_encode($response_array) );

  }
  public function auth_user()
  {
  $_POST = json_decode(file_get_contents('php://input'), true);
  $posts = $this->input->post();
    $data = array(
      'username'=> $posts['username'],
      'password'=> $posts['password']
    );
    $username = $data['username'];
    $password = $data['password'];
    // echo "$username";
    // echo "$password";
    $query = $this->db->get_where($this->table_name,$data);
    if($query->num_rows() >= 1)
  	{
      $auth_token = md5(uniqid());
      $request_data['username']=$username;
      $request_data['id']=$auth_token;
      $valid_session = $this->UserSession_Model->insert($request_data);
      if($valid_session)
      {
        $response_array['usersession'] = $valid_session;
        $response_array['message'] = 'loggedin Successfully';
      }
      else{
        $response_array['usersession'] = $valid_session;
        $response_array['message'] = '!!! warning -error occured in user session, but loggedin Successfully';
      }
          $response_array['status'] = 'loggedin';
        	$response_array['user'] = $username;
        	$response_array['id'] = $auth_token;

          $this->output->set_content_type('application/json');
          $this->output->set_output( json_encode($response_array) );
  	}
    else {
      $response_array['status'] = 'error';
      $response_array['message'] = 'Invalid Username or Password';
      $this->output->set_content_type('application/json');
      $this->output->set_output( json_encode($response_array) );
    }

  }

}
