<?php
class Task_controller extends CI_Controller {
  function __construct(){
    parent::__construct();
    $this->load->helper('url');
    $this->load->database();
  }
  public $table_name ="bh_tasks";
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
  public function get_task(){
    $id = $this->uri->segment('3');
    $query = $this->db->get_where($this->table_name,array("$this->id_pk" => $id));
    $data['records'] = $query->result();
    // $this->load->view('task_view',$data);
	if (!empty($errors)) {
	$response_array['status']='success';
    $response_array['operation']='get';
    $response_array['message']='Record with id : '.$id.' fetched successfully.';
    $response_array['data']=$data['records'];
	}
	else
	{
	$response_array['status']='Failure';
    $response_array['operation']='get';
    $response_array['message']='No Such Record Found in DB with id : '.$id;
    $response_array['data']=$data['records'];
	}

    $this->output->set_content_type('application/json');
    $this->output->set_output( json_encode($response_array) );
  }
  public function add_task(){
    $this->load->model('Task_Model');
    $_POST = json_decode(file_get_contents('php://input'), true);
	//$posts = $this->input->post();
    $data=$this->input->post('task_model');
    // $data = array(
    //   'task' => $this->input->post('task'),
    //   'status' => $this->input->post('status'),
    //   'created_at' => $this->input->post('created_at'),
    //   'duedate' => $this->input->post('duedate')
    // );
    $this->Task_Model->insert($data);
    $id = $this->db->insert_id();
		$q = $this->db->get_where($this->table_name, array("$this->id_pk" => $id));
		//echo json_encode($q->row());
    // $query = $this->db->get($this->table_name);
    // $data['records'] = $query->result();
    //$this->load->view('task_view',$data);
    $response_array['status']='success';
    $response_array['operation']='insert';
    $response_array['message']='Record Inserted successfully.';
    $response_array['data']=$q->row();
    $this->output->set_content_type('application/json');
    $this->output->set_output( json_encode($response_array) );
  }
  public function update_task(){
    $this->load->model('Task_Model');
    // $data = array(
    //   'task' => $this->input->post('task'),
    //   'status' => $this->input->post('status'),
    //   'created_at' => $this->input->post('created_at'),
    //   'duedate' => $this->input->post('duedate')
    // );
  //  $id = $this->input->post('id');
    $_POST = json_decode(file_get_contents('php://input'), true);
	//$posts = $this->input->post();
    $data=$this->input->post('task_model');
    $id = $data['id'];
    $this->Task_Model->update($data,$id);
    $query = $this->db->get_where($this->table_name,array("$this->id_pk" =>$id));
    $data['records'] = $query->result();
    //$this->load->view('task_view',$data);
    $response_array['status']='success';
    $response_array['operation']='update';
    $response_array['message']='Record Updated successfully.';
    $response_array['data']=$data['records'];
    $this->output->set_content_type('application/json');
    $this->output->set_output( json_encode($response_array) );
  }
  public function delete_task(){
    $this->load->model('Task_Model');
    $id = $this->uri->segment('3');
    $this->Task_Model->delete($id);
    //$query = $this->db->get($this->table_name);
    //$data['records'] = $query->result();
    // $this->load->view('task_view',$data);
    $response_array['status']='success';
    $response_array['operation']='delete';
    $response_array['message']='Record Deleted successfully.';
  //  $response_array['data']=$data;
    $this->output->set_content_type('application/json');
    $this->output->set_output( json_encode($response_array) );
  }

}
