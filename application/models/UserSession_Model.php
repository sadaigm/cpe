<?php
class UserSession_Model extends CI_Model{
  function __construct(){
    parent::__construct();
    $this->load->helper('date');
  }
  public $table_name ="bh_users_session";
  public $id_pk ="id";
  public function usersessionexists($session_data)
{
  $query = $this->db->get_where($this->table_name,$session_data);
  if($query->num_rows() >= 1)
  {
		//if query finds one row relating to this user then execute code accordingly here
    return true;
	}
  else {
    return false;
  }
}
  public function insert($request_data){
    $data=array('username'=>$request_data['username'],'token'=>$request_data['id'],'created_timestamp'=>date('Y-m-d H:i:s'));
    if ($this->db->insert("$this->table_name", $data)) {
      return true;
    }
  }
  public function delete($id){
    if ($this->db->delete("$this->table_name", "$this->id_pk = ".$id)) {
      return true;
    }
  }
  public function update($data,$key){
    $this->db->set($data);
    $this->db->where("$this->id_pk", $key);
    $this->db->update("$this->table_name", $data);
  }
}
?>
