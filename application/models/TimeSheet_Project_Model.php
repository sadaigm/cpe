<?php
class TimeSheet_Project_Model extends CI_Model{
  function __construct(){
    parent::__construct();
  }
  public $table_name ="projects";
  public $id_pk ="id";
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
