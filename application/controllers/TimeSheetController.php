<?php
class TimeSheetController extends CI_Controller {
  function __construct(){
    parent::__construct();
    $this->load->helper('url');
    $this->load->database();
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, OPTIONS");

  }
  public $table_name ="projects";
  public $timesheet_table_name ="timesheet";
  public $id_pk ="id";
  public $project_fk ="project_fk";
  public function index()
  {
    $response_array['message']="Welcome!!!";
    //$this->output->enable_profiler(TRUE);
    $this->output->set_content_type('application/json');
    $this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
    $this->output->set_header('Pragma: no-cache');
    $this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
    $this->output->set_output( json_encode($response_array) );

  }
  public function getAllSheet()
  {
    $query = $this->db->get($this->table_name);
    $projects =$query->result_array();
    foreach($projects as $project)
    {
      //echo "$project";
    //  $project =json_encode($project);
    //  echo "$project";
      $pro_fk=$project["$this->id_pk"];
     //echo "$pro_fk";
      $t = $this->db->get_where($this->timesheet_table_name, array("$this->project_fk" => $pro_fk));
      if($t->result()!=null)
      {


      $entries[] = $t->result();
      $no_of_entries =$t->num_rows();
        $project_entry = array('summary' => $project,'entries' =>$entries,"no_of_entries" =>$no_of_entries,"$this->project_fk" => $pro_fk);
        }
        else {
        $project_entry = array('summary' => $project );
        }
        unset($entries);
        $response_projects[] = $project_entry;
    }

    $data['records'] = $query->result();
    $this->load->helper('url');
    $response_array['status']='success';
    $response_array['operation']='list';
    $response_array['message']='Record fetched successfully.';
    $response_array['data']=$response_projects;
    //$this->output->enable_profiler(TRUE);
    $this->output->set_content_type('application/json');
    $this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
    $this->output->set_header('Pragma: no-cache');
    $this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
    $this->output->set_output( json_encode($response_array) );
  }
  public function add_timesheet(){
    $this->load->model('TimeSheet_Project_Model');
    $this->load->model('TimeSheet_Entry_Model');
    $_POST = json_decode(file_get_contents('php://input'), true);
	//$posts = $this->input->post();
    $projects=$this->input->post('projects');
    foreach($projects as $project)
{
   $data = array(
     'project_code' => $this->checkValue($project['project_code']),
     'total_hrs' => $this->checkValue($project['total_hrs']),
     'username' => $this->checkValue($project['username']),
     'week_friday_date' => date('Y-m-d', strtotime($this->checkValue($project['week_friday_date'])))

   );
    $this->TimeSheet_Project_Model->insert($data);
      $id = $this->db->insert_id();
      $q = $this->db->get_where($this->table_name, array("$this->id_pk" => $id));
      $time_entries = $this->checkValue($project['values']);
      if($time_entries!="")
      {
        foreach($time_entries as $entry)
          {


              $timesheet_entry = array(
               'project_code' => $this->checkValue($entry['project_code']),
               'week_friday_date' => date('Y-m-d', strtotime($this->checkValue($entry['week_friday_date']))),
               'username' => $this->checkValue($entry['username']),
               'hours' => $this->checkValue($entry['hours']),
               'comments' => $this->checkValue($entry['comments']),
               'date' => date('Y-m-d', strtotime($this->checkValue($entry['date']))),
               'day' => $this->checkValue($entry['day']),
               'leave_day' => $this->checkValue($entry['leave_day']),
               'holiday' => $this->checkValue($entry['holiday']),
               'project_fk' => $id,
               'last_updated_dt' => $this->getTime()

              );
              $this->TimeSheet_Entry_Model->insert($timesheet_entry);
                $time_id = $this->db->insert_id();
                $t = $this->db->get_where($this->timesheet_table_name, array("$this->id_pk" => $time_id));
                $entries[] = $t->row();
          }
            $project_entry = array('summary' => $q->row(),'entries' =>$entries );
          }
          else {
              $project_entry = array('summary' => $q->row() );
          }
    $response_projects[] = $project_entry;
}
    // $data = array(
    //   'task' => $this->input->post('task'),
    //   'status' => $this->input->post('status'),
    //   'created_at' => $this->input->post('created_at'),
    //   'duedate' => $this->input->post('duedate')
    // );



		//echo json_encode($q->row());
    // $query = $this->db->get($this->table_name);
    // $data['records'] = $query->result();
    //$this->load->view('task_view',$data);
    $response_array['status']='success';
    $response_array['operation']='insert';
    $response_array['message']='Record Inserted successfully.';
    $response_array['projects']=$response_projects;
    $this->output->set_content_type('application/json');
    $this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
    $this->output->set_header('Pragma: no-cache');
    $this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
    $this->output->set_output( json_encode($response_array) );
  }
public function get_projects_hrs()
{

    $query = $this->db->get($this->table_name);
    //$data['data'] = $query->result();
    $this->load->helper('url');
    $response_array['status']='success';
    $response_array['operation']='getprojects';
    $response_array['message']='Projects fetched successfully.';
    $response_array['data']=$query->result();
    //$this->output->enable_profiler(TRUE);
    $this->output->nocache();
    $this->output->set_content_type('application/json');
    $this->output->set_output( json_encode($response_array) );
}
public function get_timesheet_entries()
{

    $query = $this->db->get($this->timesheet_table_name);
    //$data['data'] = $query->result();
    $this->load->helper('url');
    $response_array['status']='success';
    $response_array['operation']='getprojects';
    $response_array['message']='Projects fetched successfully.';
    $response_array['data']=$query->result();
    //$this->output->enable_profiler(TRUE);
    $this->output->set_content_type('application/json');
    $this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
    $this->output->set_header('Pragma: no-cache');
    $this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
    $this->output->set_output( json_encode($response_array) );
}
public function get_user_ts_bydate_project()
{
  //$_POST = json_decode(file_get_contents('php://input'), true);
//$posts = $this->input->post();
    $date_val=$this->input->post('date_val');
    $project_code=$this->input->post('project_code');
    $username=$this->input->post('username');
    $query = $this->db->get_where($this->timesheet_table_name,array("date" => $date_val
                                  ,"project_code" =>$project_code,"username" => $username
                                ));
    //$data['data'] = $query->result();
    $this->load->helper('url');
    $response_array['status']='success';
    $response_array['operation']='GetTimeSheet';
    $response_array['message']='Timesheet fetched successfully.';
    $response_array['data']=$query->result();
    $this->output->enable_profiler(TRUE);
    $this->output->set_content_type('application/json');
    $this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
    $this->output->set_header('Pragma: no-cache');
    $this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
    $this->output->set_output( json_encode($response_array) );
}



public function checkValue($say_something)
{
  if(isset($say_something)){
   return $say_something;
}
else{
   return "";
}
}
public function getTime(){
date_default_timezone_set('Asia/Kolkata');
return date('Y-m-d H:i:s', time());
}

}
