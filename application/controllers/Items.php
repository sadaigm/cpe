<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Items extends CI_Controller {
	public function index()
	{
		$method = $_SERVER['REQUEST_METHOD'];
		// if($method != 'POST'){
		// 	json_output(400,array('status' => 400,'message' => 'Bad request.'));
		// } else {
			$check_auth_client = $this->AuthModel->check_auth_client();
			//echo "$check_auth_client";
			if($check_auth_client == true){
		        $response = $this->AuthModel->auth();
						// echo "$response";
		        //$respStatus['status'] = $response['status'];
		        if($response['status'] == 200){
																	$this->load->database();
																	$condition = array();
																	if(!empty($this->input->get("search"))){
																		 $this->db->like('title', $this->input->get("search"));
																		 $this->db->or_like('description', $this->input->get("search"));
																		// $condition['title'] = $this->input->get("search");
																		// $condition['description'] = $this->input->get("search");
																	}
																	if(!empty($this->input->get("user"))){
																		$user = $this->input->get("user");
																		$this->db->where('user',$user);
																		$condition['user'] = $user;
																	}

																	$count_query = $this->db->get_where("items",$condition);
																	 if(!empty($this->input->get("search"))){
																	 	$this->db->like('title', $this->input->get("search"));
																	 	$this->db->or_like('description', $this->input->get("search"));
																	 }
																	// if(!empty($this->input->get("user"))){
																	// 	$user = $this->input->get("user");
																	// 	$this->db->where('user',$user);
																	// }
																	$this->db->limit(5, ($this->input->get("page",1) - 1) * 5);
																	$query = $this->db->get_where("items",$condition);
																	$data['data'] = $query->result();
																	//$data['total'] = $this->db->count_all("items");
																	$data['total'] = $count_query->num_rows();
																	$respStatus['response']=$data;
																}
																 else {
																 $respStatus = $response;
																 }
															}
														// }
		echo json_encode($respStatus);
	}
	public function store()
    {
    	$this->load->database();
    	$_POST = json_decode(file_get_contents('php://input'), true);
    	$insert = $this->input->post();
		$this->db->insert('items', $insert);
		$id = $this->db->insert_id();
		$q = $this->db->get_where('items', array('id' => $id));
		echo json_encode($q->row());
    }
    public function edit($id)
    {
    	$this->load->database();
		$q = $this->db->get_where('items', array('id' => $id));
		echo json_encode($q->row());
    }
    public function update($id)
    {
    	$this->load->database();
    	$_POST = json_decode(file_get_contents('php://input'), true);
    	$insert = $this->input->post();
    	$this->db->where('id', $id);
    	$this->db->update('items', $insert);
        $q = $this->db->get_where('items', array('id' => $id));
		echo json_encode($q->row());
    }
    public function delete($id)
    {
    	$this->load->database();
        $this->db->where('id', $id);
		$this->db->delete('items');
		echo json_encode(['success'=>true]);
    }
}
 ?>
