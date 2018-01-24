<?php
class User_Model extends CI_Model{
  function __construct(){
    parent::__construct();
  }
  public $table_name ="bh_users";
  public $id_pk ="id";
  public function userexists($key)
{
	$this->db->where("$this->id_pk", $key);
	$query = $this->db->get("$this->table_name");
	if($query->num_rows >= 1)
	{
		//if query finds one row relating to this user then execute code accordingly here
    return true;
	}
  else {
    return false;
  }
}
  public function insert($data){
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
