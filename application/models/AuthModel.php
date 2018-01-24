<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AuthModel extends CI_Model {

    var $client_service = "frontend-client";
    var $auth_key       = "simplerestapi";

    public function check_auth_client(){
        $client_service = $this->input->get_request_header('Client-Service', TRUE);
        $auth_key  = $this->input->get_request_header('Auth-Key', TRUE);
        // echo "$client_service";
        // echo "$this->client_service";
        // echo "$auth_key";
        // echo "$this->auth_key";

        if($client_service == $this->client_service && $auth_key == $this->auth_key){
          // echo "matching";
            return true;
        } else {
            return json_output(401,array('status' => 401,'message' => 'Unauthorized.'));
        }
    }
    public function register($username,$password,$name,$role)
    {
      $q  = $this->db->select('password,id')->from('users')->where('username',$username)->get()->row();
      if($q == ""){
        $hashed_password = crypt($password,$this->auth_key);
       $this->db->trans_start();
       $this->db->insert('users',array('name' => $name,'username' => $username,'password' => $hashed_password,'role' => $role,));
       if ($this->db->trans_status() === FALSE){
          $this->db->trans_rollback();
          return array('status' => 200,'customstatus' => 500,'message' => 'Internal server error.');
       } else {
          $this->db->trans_commit();
          return array('status' => 200,'customstatus' => 200,'message' => 'Successfully Registered.','name' => $name, 'username' => $username);
       }
       } else {
         return array('status' => 200,'customstatus' => 500,'message' => 'Username already exist.');
       }
    }

    public function login($username,$password,$role)
    {
        $q  = $this->db->select('password,id')->from('users')->where('username',$username)->where('role',$role)->get()->row();
        if($q == ""){
            return array('status' => 200,'customstatus' => 401,'message' => 'Username/Role Unauthorized.');
        } else {
            $hashed_password = $q->password;
            $id              = $q->id;
            if (hash_equals($hashed_password, crypt($password, $hashed_password)) ) {
               $last_login = date('Y-m-d H:i:s');
               $token = crypt(substr( md5(rand()), 0, 7),$this->auth_key);
               $expired_at = date("Y-m-d H:i:s", strtotime('+12 hours'));
               $this->db->trans_start();
               $this->db->where('id',$id)->update('users',array('last_login' => $last_login));
               $this->db->insert('users_authentication',array('users_id' => $id,'token' => $token,'expired_at' => $expired_at));
               if ($this->db->trans_status() === FALSE){
                  $this->db->trans_rollback();
                  return array('status' => 200,'customstatus' => 500,'message' => 'Internal server error.');
               } else {
                  $this->db->trans_commit();
                  return array('status' => 200,'customstatus' => 200,'message' => 'Successfully login.','id' => $id, 'token' => $token,'user'=>$username,'role'=>$role);
               }
            } else {
               return array('status' => 200,'customstatus' => 204,'message' => 'Wrong password.');
            }
        }
    }

    public function logout()
    {
        $users_id  = $this->input->get_request_header('User-ID', TRUE);
        $token     = $this->input->get_request_header('Authorization', TRUE);
        $this->db->where('users_id',$users_id)->where('token',$token)->delete('users_authentication');
        return array('status' => 200,'message' => 'Successfully logout.');
    }

    public function auth()
    {
        $users_id  = $this->input->get_request_header('User-ID', TRUE);
        $token     = $this->input->get_request_header('Authorization', TRUE);
        $q  = $this->db->select('expired_at')->from('users_authentication')->where('users_id',$users_id)->where('token',$token)->get()->row();
        if($q == ""){
          //return json_output(401,array('status' => 401,'message' => 'Unauthorized.'));
            return array('status' => 401,'message' => 'Unauthorized.');
        } else {
            if($q->expired_at < date('Y-m-d H:i:s')){
                return array('status' => 401,'message' => 'Your session has been expired.');
            } else {
                $updated_at = date('Y-m-d H:i:s');
                $expired_at = date("Y-m-d H:i:s", strtotime('+12 hours'));
                $this->db->where('users_id',$users_id)->where('token',$token)->update('users_authentication',array('expired_at' => $expired_at,'updated_at' => $updated_at));
                return array('status' => 200,'message' => 'Authorized.');
            }
        }
    }

    public function book_all_data()
    {
        return $this->db->select('id,title,author')->from('books')->order_by('id','desc')->get()->result();
    }

    public function book_detail_data($id)
    {
        return $this->db->select('id,title,author')->from('books')->where('id',$id)->order_by('id','desc')->get()->row();
    }

    public function book_create_data($data)
    {
        $this->db->insert('books',$data);
        return array('status' => 201,'message' => 'Data has been created.');
    }

    public function book_update_data($id,$data)
    {
        $this->db->where('id',$id)->update('books',$data);
        return array('status' => 200,'message' => 'Data has been updated.');
    }

    public function book_delete_data($id)
    {
        $this->db->where('id',$id)->delete('books');
        return array('status' => 200,'message' => 'Data has been deleted.');
    }

}
