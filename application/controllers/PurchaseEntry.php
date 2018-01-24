<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PurchaseEntry extends CI_Controller {

	public $table_name ="purchase_entry";
	public $item_table ="items";
	public $id_pk ="id";
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
					//$this->db->or_like('description', $this->input->get("search"));
					// $condition['title'] = $this->input->get("search");
					// $condition['description'] = $this->input->get("search");
				}
				if(!empty($this->input->get("user"))){
					$user = $this->input->get("user");
					$this->db->where('user',$user);
					$condition['user'] = $user;
				}

				$count_query = $this->db->get_where($this->table_name,$condition);
				if(!empty($this->input->get("search"))){
					$this->db->like('title', $this->input->get("search"));
					//	$this->db->or_like('description', $this->input->get("search"));
				}
				// if(!empty($this->input->get("user"))){
				// 	$user = $this->input->get("user");
				// 	$this->db->where('user',$user);
				// }
				$this->db->limit(5, ($this->input->get("page",1) - 1) * 5);
				$query = $this->db->get_where($this->table_name,$condition);
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

	public function getProductNames()
	{
		$response = $this->authenticate();
		if($response['status'] == 200){
				$this->load->database();
				$condition = array();
				if(!empty($this->input->get("user"))){
					$user = $this->input->get("user");
					$this->db->where('user',$user);
					$condition['user'] = $user;
				}

				$query = $this->db->get_where($this->item_table,$condition);
				$data['data'] = $query->result();
				if ($query->num_rows() > 0)
				{
					$productNames = array();
				   foreach ($query->result() as $row)
				   {
				      $productNames[] = array('title' => $row->title, 'idfk'=> $row->id);
				      
				   }
				}
				$respStatus['response']=$query->result();
			}
			else {
				$respStatus = $response;
			}
		// }
		echo json_encode($respStatus);
	}


	public function authenticate(){
		$check_auth_client = $this->AuthModel->check_auth_client();
		if($check_auth_client == true){
			$response = $this->AuthModel->auth();
			return $response;
		}
		return false;

	}

	public function store()
	{
		$response = $this->authenticate();
		if($response['status'] == 200){
			$this->load->database();
			$_POST = json_decode(file_get_contents('php://input'), true);
			$insert = $this->input->post();
			$this->db->insert($this->table_name, $insert);
			$id = $this->db->insert_id();
			$q = $this->db->get_where($this->table_name, array("$this->id_pk" => $id));
			echo json_encode($q->row());
		}
		else{
			echo json_encode($response);
		}

	}
	public function edit($id)
	{
		$response = $this->authenticate();
		if($response['status'] == 200){
			$this->load->database();
			$q = $this->db->get_where($this->table_name, array("$this->id_pk" => $id));
			echo json_encode($q->row());
		}
		else{
			echo json_encode($response);
		}

	}
	public function update($id)
	{
		$this->load->database();
		$_POST = json_decode(file_get_contents('php://input'), true);
		$insert = $this->input->post();
		$this->db->where('id', $id);
		$this->db->update($this->table_name, $insert);
		$q = $this->db->get_where($this->table_name, array("$this->id_pk" => $id));
		echo json_encode($q->row());
	}
	public function delete($id)
	{
		$this->load->database();
		$this->db->where("$this->id_pk", $id);
		$this->db->delete($this->table_name);
		echo json_encode(['success'=>true]);
	}
}
?>
