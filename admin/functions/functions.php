<?php

 /*error_reporting(0);

	ini_set('display_errors', 0);  */

class Functions{ 

	protected $db;

	public $date_time;

	public $date;

	public $time;

	private $host ='localhost';

	private $db_user ='dzoneind_dzoneindia';

	private $db_pass ='dzoneind_dzoneindia';

	private $db_name ='dzoneind_dzoneindia';

	public function __construct(){



		$this->db = new mysqli($this->host, $this->db_user, $this->db_pass, $this->db_name);



		if($this->db->connect_error) {



			die('Could Not Connect: ' .$this->db->connect_error);



		}

		date_default_timezone_set("America/Los_Angeles");

		$this->date_time = date('Y-m-d H:i:s');

		$this->time = date('H:i:s');

		$this->date = date('Y-m-d');

	}

	public function base_url(){



		return 'https://dzoneindia.co.in/admin';

	}

	

	public function base_url_front(){



		return 'https://dzoneindia.co.in';

	}

	

	public function start_session(){



		return session_start();

	}

	public function checkLogin(){



		$this->start_session();



		if(@$_SESSION['admin_logged_in']){



			return true;

		}

		else {



			header('Location: '.$this->base_url());

			die();



		}

	}



	public function checkUserLogin(){

		$this->start_session();

		if(@$_SESSION['user_logged_in']){

			return true;

		}

		else {

			header('Location: '.$this->base_url_front());

			die();

		}

	}

	public function admin_url(){

			$ip = $this->getUserIpAddr();

			$this->db->query("INSERT INTO login_activity (comment,date_time) VALUES ('admin url vistied $ip','$this->date_time')");

		}

	

	public function admin_url_submit(){

			$ip = $this->getUserIpAddr();

			$this->db->query("INSERT INTO login_activity (comment,date_time) VALUES ('login form submit vistied $ip','$this->date_time')");

		}

		public function admin_success(){

			$ip = $this->getUserIpAddr();

			$this->db->query("INSERT INTO login_activity (comment,date_time) VALUES ('login success vistied $ip','$this->date_time')");

		}

		public function admin_otp_page(){

			$ip = $this->getUserIpAddr();

			$this->db->query("INSERT INTO login_activity (comment,date_time) VALUES ('opt page vistied $ip','$this->date_time')");

			return TRUE;

		}

		public function admin_otp_submit(){

			$ip = $this->getUserIpAddr();

			$this->db->query("INSERT INTO login_activity (comment,date_time) VALUES ('opt submit $ip','$this->date_time')");

			return TRUE;

		}

		



		public function get_activity(){

			return $this->db->query("SELECT * FROM login_activity ORDER BY id DESC limit 20");

		}



	public function randomCode($length){



        $key = '';

        $keys = array_merge(range(1, 9), array('A','B','C','D','E','F','G','H','I','J','K'));



        for ($i = 0; $i < $length; $i++) {

            $key .= $keys[array_rand($keys)];

        }



        return $key;

    }



	public function randomCodeNum($length){



        $key = '';

        $keys = array_merge(range(1, 9));



        for ($i = 0; $i < $length; $i++){



        	$key .= $keys[array_rand($keys)];



        }



        return $key;

    }



	public function unique_randomCode($table,$unique_col,$prefix,$length){



		$i = 0;



		while($i < 1000){



	    	$code = $this->randomCode($length);



	    	if($prefix != ""){



	    		$code = $prefix.$code;



		    }



	    	$query = $this->db->query("SELECT * FROM $table WHERE $unique_col = '$code'");



	    	if($query->num_rows == 0){



	    		$i = 1000;



	    	}else{



	    		$i++;

	    	}

		}



		return $code;

    }



	public function unique_randomCodeNum($table,$unique_col,$prefix,$length){

		

    	$i = 0;

    	while($i < 1000){



    		$code = $this->randomCodeNum($length);



    		if($prefix != ""){



    			$code = $prefix.$code;

	    	}



	    	$query = $this->db->query("SELECT * FROM $table WHERE $unique_col = '$code'");



	    	if($query->num_rows == 0){



	    		$i = 1000;



	    	}else{



	    		$i++;

	    	}

    	}



    	return $code;

    }



    

	// ------------Admin side --------------------------//

	

	public function admin_login($username,$password){



		$username = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$username)));

		$password = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$password)));



		if($username == "" || $password == ""){



			$_SESSION['failed']  =  "<div class='alert alert-error'><button type='button' class='close' data-dismiss='alert'>×</button>

					<strong>ERROR : Please Fill All Mandatory  Fields !</strong> 

					</div>";

			header('Location: index?st=micly');

			exit();

		}



		else{

			

			$pass = sha1($password);

			$res = $this->db->query("SELECT id FROM admins WHERE username='$username' AND password = '$pass'");



			if($res->num_rows == 1){



			   $mobile_no = 8218466195;



				$otp = 123456; //$this->randomCodeNum(8);



				$_SESSION['login_otp'] = $otp;



				/*$msg="http://sms.hspsms.com/sendSMS?username=nattyindia&message=admin login  OTP $otp %0a Thanks.&sendername=NATYIN&smstype=TRANS&numbers=$mobile_no&apikey=4cbab4ea-39c6-4452-bc39-03eae476461e";



					$msg = str_replace(" ", "+", $msg);

					$response = file_get_contents($msg);*/

					$response =TRUE;



					if($response){

			

						header('Location: verify_otp');

						exit();

				}

			}else{

					$_SESSION['failed']  =  "<div class='alert alert-error'>

					<button type='button' class='close' data-dismiss='alert'>×</button>

					<strong>ERROR : wrong !</strong> 

					</div>";

					$_SESSION['admin_logged_in'] = FALSE;

					header('Location: index?st=micly');

					exit();

				

			}

		}

		return $err;

	}

	public function admin_verify_otp($enter_otp){



		$enter_otp = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$enter_otp)));



		$err ="";

		

		$otp = $_SESSION['login_otp'];

		

		if($enter_otp == "" ){



			$err  =  "<div class='alert alert-error'><button type='button' class='close' data-dismiss='alert'>×</button><strong>ERROR : Please Fill All Mandatory  Fields !</strong></div>";



			$_SESSION['admin_logged_in'] = FALSE;



		}if($enter_otp != $otp ){



			$_SESSION['failed']  =  "<div class='alert alert-error'>

					<button type='button' class='close' data-dismiss='alert'>×</button>

					<strong>ERROR : wrong !</strong> 

					</div>";

			$_SESSION['admin_logged_in'] = FALSE;

			header('Location: verify_otp');

			exit();	

		}



		if($enter_otp == $otp){



			unset($_SESSION['login_otp']);

			$this->admin_success();

			//$_SESSION['username'] = $username;

		  	$_SESSION['admin_logged_in'] = TRUE;

			$_SESSION['loginusingotps'] = TRUE;							

   			header('Location: dashboard');

   		    die();

		}

			

	}

	public function admin_acty($msg){

			$ip = $this->getUserIpAddr();

			$msg = $msg.$ip;

			$this->db->query("INSERT INTO login_activity (comment,date_time) VALUES ('$msg','$this->date_time')");

			return TRUE;

		}

		public	function getUserIpAddr(){

	    $ipaddress = $_SERVER['SERVER_ADDR'];		

		

		$ip_server_data = array('HTTP_X_REAL_IP', 'HTTP_CF_CONNECTING_IP', 'HTTP_X_FORWARDED_FOR','REMOTE_ADDR');		

		  

		  foreach($ip_server_data as $real_ip){	



			$real_ip = @$_SERVER[$real_ip];



			if($real_ip){		

				

				$ipaddress = $real_ip;

				

				break;

			}	

		}

		return $ipaddress;

	}

	public function change_password(){

		$err = "";



		if(trim($_POST['old_pass']) == "" || trim($_POST['pass']) == "" || trim($_POST['c_pass']) == "" ){



			$err ="<div class='alert alert-error'>

			<button type='button' class='close' data-dismiss='alert'>×</button>

			<strong>ERROR : Fill All Required details</strong> 

			</div>";

		}



	if($err == ""){



		$old_pass=htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$_POST['old_pass'])));

		$pass = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$_POST['pass'])));

		$c_pass = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db , $_POST['c_pass'])));



		$sec_passO = sha1($old_pass);

		$sec_passN = sha1($pass);



		if($pass != $c_pass){



			$err ="<div class='alert alert-error'>

			<button type='button' class='close' data-dismiss='alert'>×</button>

			<strong>ERROR : New Password And Confirm Password Must Be same</strong> 

			</div>";



		}else{



			$res = $this->db->query("SELECT * FROM admins WHERE username = 'admin' AND password = '".$sec_passO."'");



			if($res->num_rows > 0){



				$query = $this->db->query("UPDATE admins SET `password` = '".$sec_passN."' WHERE username = 'admin'");



				if($query){



					$err = "<div class='alert alert-success'>

					<button type='button' class='close' data-dismiss='alert'>×</button>

					<strong>SUCCESS : Passowrd Updated  Successfully</strong> 

					</div>";



				}else{



					$err = "<div class='alert alert-error'><button type='button' class='close' data-dismiss='alert'>×</button><strong>ERROR : Please try again</strong></div>";

				}

			}else {



				$err ="<div class='alert alert-error'><button type='button' class='close' data-dismiss='alert'>×</button><strong>ERROR : Wrong Password Provided </strong></div>";

			}

		}

	}

	return $err ;

}

	

	public function userDetail($id){



		$id = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$id)));		



		$res = $this->db->query("SELECT  * FROM users WHERE id='$id'");

		if($res){

			return $res->fetch_assoc();

		}		

	}

	public function updateUser($user,$name,$city,$pan,$adhar,$account,$ifsc){

		

		$name = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$name)));

		$city = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$city)));

		$pan = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$pan)));

		$adhar = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$adhar)));

		$account = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$account)));

		$ifsc = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$ifsc)));

		



		$res = $this->db->query("UPDATE users SET name =  '$name', city =  '$city', pan =  '$pan', adhar =  '$adhar', ac_no  =  '$account',ifsc =  '$ifsc' WHERE id= '$user'");



		$cookie_name = "myCookies";



		$query = $this->db->query("SELECT mobile FROM users WHERE  id = '$user'" );



		$data = $query->fetch_assoc();



		$cookie_value->name = $name;



		$cookie_value->mobile = $data['mobile'];

		

		$cookie_value = json_encode($cookie_value);



		setcookie($cookie_name, $cookie_value, time() + (86400 * 60), "/");

		

		if($res){



			return TRUE;

		}

	}



	//---------Fron End Member Registration Form--------------//

	

	public function login_user_from_admin($username, $password){

		

		if(trim($username == "") || trim($password == "")){



			$_SESSION['failed'] =  'Required Fields Can Not Be Empty !';

			header('Location: login');

			exit;

			return FALSE;

		}

		else{

			

			$username = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$_REQUEST['u_name'])));



			$password = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$_REQUEST['u_pass'])));



		//	$pass = sha1($password);

			$res = $this->db->query("SELECT id,username,status FROM users WHERE  username = '$username' AND password = '$password'" );



			if($res->num_rows > 0){



				$data = $res->fetch_assoc();



				if($data['status'] == 'Suspended'){



					$_SESSION['login_failed'] = 'Your Account Has Been Suspended Please Contact Support For More Details !';

					header('Location: login');

					exit;

					return FALSE;

				}



				else{	



				/*

					$otp = $this->randomCodeNum(6);

					$this->start_session();

					$_SESSION['otp'] = $otp;*/



				/*

					$msg="http://sms.hspsms.com/sendSMS?username=nattyindia&message=OTP for Login on natty india $otp &sendername=NATYIN&smstype=TRANS&numbers=$mobile&apikey=4cbab4ea-39c6-4452-bc39-03eae476461e ";

						$msg = str_replace(" ", "+", $msg);

						$response = file_get_contents($msg);

					header('Location: otp'); */

					

					$_SESSION['username'] = $data['username'];

					$_SESSION['user_id'] = $data['id'];

					$_SESSION['user_logged_in'] = TRUE;

					

					header("Location: users_login");

					exit();

				}

			}else{



				$_SESSION['login_failed'] ='Invalid details please check and try again!';



				header('Location: login');

				exit;

				return FALSE;

			}

		}

	}

	

	

	

	

	

	public function login_user($username, $password){



		if(trim($username == "") || trim($password == "")){



			$_SESSION['failed'] =  'Required Fields Can Not Be Empty !';

			header('Location: login');

			exit;

			return FALSE;

		}

		else{

			

			$username = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$_POST['username'])));



			$password = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$_POST['password'])));



			$pass = sha1($password);



			$res = $this->db->query("SELECT id,username,status FROM frenchise_users WHERE  username = '$username' AND password = '$pass'" );



			if($res->num_rows > 0){



				$data = $res->fetch_assoc();



				if($data['status'] == 'Suspended'){



					$_SESSION['login_failed'] = 'Your Account Has Been Suspended Please Contact Support For More Details !';

					header('Location: login');

					exit;

					return FALSE;

				}



				else{	



				/*

					$otp = $this->randomCodeNum(6);

					$this->start_session();

					$_SESSION['otp'] = $otp;*/



				/*

					$msg="http://sms.hspsms.com/sendSMS?username=nattyindia&message=OTP for Login on natty india $otp &sendername=NATYIN&smstype=TRANS&numbers=$mobile&apikey=4cbab4ea-39c6-4452-bc39-03eae476461e ";

						$msg = str_replace(" ", "+", $msg);

						$response = file_get_contents($msg);

					header('Location: otp'); */

					

					$_SESSION['username'] = $data['username'];

					$_SESSION['user_id'] = $data['id'];

					$_SESSION['user_logged_in'] = TRUE;

					

					header("Location: account/index");

					exit();

				}

			}else{



				$_SESSION['login_failed'] ='Invalid details please check and try again!';



				header('Location: login');

				exit;

				return FALSE;

			}

		}

	}

	

	public function register_user($sponsorid,$name,$mobile,$email,$password,$username,$txnpassword,$country){



		$redirect    = "register";

    	$name 		 = $this->xss_clean($name);

    	$mobile_no   = $this->xss_clean($mobile);    	

    	$email    	 = $this->xss_clean($email);

    	$spo_id   	 = $this->xss_clean($sponsorid);

    	$password 	 = $this->xss_clean($password);

    	$username 	 = $this->xss_clean($username);   	

    	$txnpassword = $this->xss_clean($txnpassword);   

    	$country 	 = $this->xss_clean($country);   



    	$username    = strtoupper($username);	    	

    	$spo_id      = strtoupper($spo_id);	

    	$email      = strtolower($email);	

  

        $query = $this->db->query("SELECT id FROM users WHERE username = '$username'");



    	if($query->num_rows >= '1'){



    		$_SESSION['failed']="Username already Registered, Choose different username";

    		return false;

    	}



    	$query=$this->db->query("SELECT id FROM users WHERE username = '$spo_id' AND status != 'Suspended'");



    	if($query->num_rows == 0){

    		$_SESSION['failed']="Referral id not found! OR Referral ID Not active";

        	header('Location: '.$redirect);

        	exit();

    	}



		$res_mobile = $this->db->query("SELECT id FROM users WHERE mobile = '$mobile_no'");



		if($res_mobile->num_rows > 1000){

			

			$_SESSION['failed']="Mobile already registered !";

						

		}

		$res_emails = $this->db->query("SELECT id FROM users WHERE email = '$email'");



		if($res_emails->num_rows > 100000){

			

			$_SESSION['failed']="email already registered !";

						

		}



		$pass  	  =sha1($password);

    	$token 	  =$this->unique_randomCode('users','token','',30);

    	

    	$sec = $txnpassword;

    	$sec_code =sha1($sec);



     	$res =$this->db->query("INSERT INTO users(username,password,sec_code,token,name,mobile, email,earnings,sponser_id,date_time,`date`,coin,country)VALUES('$username','$pass','$sec_code','$token','$name','$mobile_no','$email','0','$spo_id','$this->date_time','$this->date','10','$country')");



     	if($res){

     		$this->save_team($username,$spo_id,'30');

     		$this->calculate_refers($username,$spo_id,15);



/*

			$sub = 'Registeration Successful';

			$headers  = 'MIME-Version: 1.0' . "\r\n";

			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

			$headers .= 'From: info@aglobetrading.com' . "\r\n";

			$headers .= 'Reply-To: info@aglobetrading.com' . "\r\n";

			$headers .= 'X-Mailer: PHP/' . phpversion();



			$message = '<html><body>';



			$message = $message.'<h3>Dear '.$name.'</h3>';

			$message = $message.'<h4> Your login details is</h4>';

			$message = $message.'<h5>User ID : '.$username.'</h5>';

			$message = $message.'<h5>password: '.$password.'</h5>';

			$message = $message.'<h5>Transaction password: '.$sec.'</h5>';

			$message = $message.'<p>Team aglobetrading,</p>';

			$message = $message.'<p>www.aglobetrading.com</p>';

			$message .= '</body></html>';

			$mm = mail($email,$sub,$message,$headers);*/



     		$_SESSION['login_success'] = "Successfully registered on aglobetrading.com . Your login credential are Username : ".$username.", Password : ".$password." and Transaction password : ".$txnpassword." Thanks.";

        	header('Location: login');

        	exit();



     	}else{



     		$_SESSION['failed']="Try again later";

         	header('Location: '.$redirect);

        	exit();

     	}		

    }



	public function changePass($user,$old_pass,$pass){

		$old_pass =sha1($old_pass);

		$pass 	  =sha1($pass);

		$new_pass =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$pass)));

		$old_pass =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$old_pass)));



		$res =$this->db->query("SELECT id FROM users WHERE id='$user' and password='$old_pass'");

		if($res->num_rows > 0){



			$res =$this->db->query("UPDATE users SET password='$pass' WHERE id='$user'");

			if($res){



				return TRUE;

			}

		}else{

			$_SESSION['failed'] ='Invalid Old Password !';

        header('Location: changepass');

        exit;

		}

	}

	

	public function updateProfile($user_id,$address,$town,$city,$pincode,$state){

		

		$address 		 = $this->xss_clean($address);

    	$town  			 = $this->xss_clean($town);

		$city 			 = $this->xss_clean($city);

    	$pincode   		 = $this->xss_clean($pincode);

		$state   		 = $this->xss_clean($state);

		

		$res =$this->db->query("update frenchise_users SET  address='$address',

															town='$town',

															city='$city',

															pincode='$pincode',

															state='$state' 

															where id='$user_id'

															");

		

		if($res){

			$_SESSION['success'] ='Profile Updated Successfully';

			header('Location: profile');

			exit;

		}

		else

		{

			$_SESSION['failed'] ='Error Occured !';

			header('Location: profile');

			exit;

			

		}

	}	





	public function profile($user){



    	$user = $this->xss_clean($user); 

		

		$res = $this->db->query("SELECT * FROM frenchise_users WHERE username = '$user'");

		$result = "";

		if($res->num_rows > 0){

			$result = $res->fetch_assoc();

		}

		return $result;

	}

	

	

	public function get_where_custom_order_by($table,$col,$value,$order_by,$order){



		$table    = $this->xss_clean($table);

		$col      = $this->xss_clean($col);

		$value    = $this->xss_clean($value);

		$order    = $this->xss_clean($order);

		$order_by = $this->xss_clean($order_by);



		$res = $this->db->query("SELECT * FROM $table WHERE $col = '$value' ORDER BY $order_by $order");

		$data_ar = [];

		if($res->num_rows > 0){

			$data = $res->fetch_row();

		}

		

		return $data;

	}



	public function get_num_rows($table,$col,$value){



		$table    = $this->xss_clean($table);

		$col      = $this->xss_clean($col);

		$value    = $this->xss_clean($value);



		$res = $this->db->query("SELECT * FROM $table WHERE $col = '$value'");

		$data_ar = [];

		return $res->num_rows;

	}

	

	



	public function get_where_custom_order_by_assoc($table,$col,$value,$order_by,$order,$start,$limit){



		$table    = $this->xss_clean($table);

		$col      = $this->xss_clean($col);

		$value    = $this->xss_clean($value);

		$order    = $this->xss_clean($order);

		$order_by = $this->xss_clean($order_by);

    	$start 	  = $this->xss_clean($start); 

    	$limit    = $this->xss_clean($limit); 



		 $res = $this->db->query("SELECT * FROM $table WHERE $col = '$value' ORDER BY $order_by $order LIMIT $start,$limit");

		 $data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

			

		}



		return $data_ar;

	}



	public function get_where_custom_order_by_query($table,$col,$value,$order_by,$order){



		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$order_by = $this->xss_clean($order_by);

		$order = $this->xss_clean($order);

		

		$res = $this->db->query("SELECT * FROM $table WHERE $col = '$value' ORDER BY $order_by $order");

		return $res;

	}

	

	public function get_where_custom_order_by_staus($table,$col,$value,$order_by,$order){



		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$order_by = $this->xss_clean($order_by);

		$order = $this->xss_clean($order);



		$res = $this->db->query("SELECT * FROM $table WHERE $col = '$value' and status='$order_by'");

		return $res;

	}

	

	

	public function update_by_status($table,$col,$value,$where,$where_val){



		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$where = $this->xss_clean($where);

		$where_val = $this->xss_clean($where_val);

	//echo "Update $table SET $col='$value' where $where='$where_val'"; die;

		$res = $this->db->query("Update $table SET $col='$value' where $where='$where_val'");

		return $res;

	}





	public function referral($user){



		$user = $this->xss_clean($user);



		$res = $this->db->query("SELECT * FROM refer_earnings WHERE sponser_id = '$user' ORDER BY refer_earnings.id DESC  ");

		$refer_income_ar = [];

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$refer_income_ar[] = $data;

			}

		}

		return $refer_income_ar;

	}



	

	public function sponserName($user){

		$user = $this->xss_clean($user);

		$res = $this->db->query("SELECT * FROM users WHERE username = '$user'");

		if($res->num_rows > 0){

			$data = $res->fetch_assoc();

			return $data['name'];

		}

	}

	public function userNameFound($spo){

		$spo = $this->xss_clean($spo);

		$res = $this->db->query("SELECT * FROM users WHERE username = '$spo' ");

		if($res->num_rows > 0){

			$data = $res->fetch_assoc();

			return "Sponser Name = ".$data['name'];

		}else{

			return "No User Found";

		}

	}

	

	

	public function event_image_delete($id){



		$id  =$this->xss_clean($id);

	 	$res =$this->db->query("SELECT image FROM banners WHERE id='$id'");



	 	if($res->num_rows > 0){



	 		$data  =$res->fetch_assoc();

	 		$image =$data['image']; 

	 		unlink("./image/$image");



	 		$res1 =$this->db->query("DELETE FROM banners WHERE id='$id'");



	 		if($res1){



	 			return TRUE;

	 			exit();

	 		}

	 	}

 	}



	 public function admin_bank_account_delete($id){



		$id  =$this->xss_clean($id);

	 	$res =$this->db->query("SELECT id FROM admin_banks WHERE id='$id'");



	 	if($res->num_rows > 0){



	 		$res1 =$this->db->query("DELETE FROM admin_banks WHERE id='$id'");



	 	if($res1){



	 			return TRUE;

	 			exit();

	 		}

	 	}

 	}





	



	public function get1($table,$status){



		$table = $this->xss_clean($table);

		$status = $this->xss_clean($status);



		$res = $this->db->query("SELECT * FROM $table WHERE status = '$status' ORDER BY id DESC");

		$users_ar = [];

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$users_ar[] = $data;

			}

		}

		return $users_ar;

	}





	public function get_order_by($table,$order_by,$order){



		$table = $this->xss_clean($table);

		$order_by = $this->xss_clean($order_by);

		$order = $this->xss_clean($order);

		

		$res = $this->db->query("SELECT * FROM $table ORDER BY $order_by $order ");

		$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

		}

		return $data_ar;

	}

	

	

	

	public function get_category_data_to_edit($table,$id_jpr,$order){



		$table = $this->xss_clean($table);

		$order_by = $this->xss_clean($id_jpr);

		$order = $this->xss_clean($order);

	//	echo "SELECT * FROM $table where id=$order ";

		$res = $this->db->query("SELECT * FROM $table where id=$id_jpr ");

		$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

		}

		return $data_ar;

	}

	

	

	public function get_sub_category_data_to_edit($table,$id_jpr,$order){



		$table = $this->xss_clean($table);

		$order_by = $this->xss_clean($id_jpr);

		$order = $this->xss_clean($order);

	//	echo "SELECT * FROM $table where id=$order ";

		$res = $this->db->query("SELECT * FROM $table where id=$id_jpr ");

		$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

		}

		return $data_ar;

	}

	public function get_product_data_to_edit($table,$id_jpr,$order){



		$table = $this->xss_clean($table);

		$order_by = $this->xss_clean($id_jpr);

		$order = $this->xss_clean($order);

	//	echo "SELECT * FROM $table where id=$order ";

		$res = $this->db->query("SELECT * FROM $table where id=$id_jpr ");

		$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

		}

		return $data_ar;

	}

	

	

	public function get_product_data_to_edit_stock($table,$product_name,$order){



		$table = $this->xss_clean($table);

		$order_by = $this->xss_clean($product_name);

		$order = $this->xss_clean($order);

	

		$res = $this->db->query("SELECT * FROM $table where product_id=$product_name");

		

		return $res;

	}

	public function get_product_data_to_edit_product_stock($table,$product_name,$order){



		$table = $this->xss_clean($table);

		$order_by = $this->xss_clean($product_name);

		$order = $this->xss_clean($order);



		$res = $this->db->query("SELECT id,product_name,product_stock FROM $table where id=$product_name");

		

		if($res->num_rows == 0 )

		{

			 $_SESSION['failed']='<div class="alert alert-danger alert-dismissable">No Product Available!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

			 header('Location: edit_product_stock?id='.$product_name);

	         exit;

		}

		else

		{

		return $res;

		}

	}

	

	

	public function get_frenchise_user_to_edit_stock($table,$product_name,$order){



		$table = $this->xss_clean($table);

		$order_by = $this->xss_clean($product_name);

		$order = $this->xss_clean($order);



		$res = $this->db->query("SELECT * FROM $table where id=$product_name");

		

		return $res;

	}

	

	



	public function get_order_by2($table,$order_by,$order){



		$table = $this->xss_clean($table);

		$order_by = $this->xss_clean($order_by);

		$order = $this->xss_clean($order);



		$res = $this->db->query("SELECT * FROM $table ORDER BY $order_by $order LIMIT 0,500 ");

		$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

		}

		return $data_ar;

	}



	public function get_where($table,$id){



		$table = $this->xss_clean($table);

		$id    = $this->xss_clean($id);



		$res = $this->db->query("SELECT * FROM $table WHERE id = '$id' ");

		if($res->num_rows > 0){

			return $res->fetch_assoc();

		}	

	}

	public function get_where_name($table,$username){

		$table = $this->xss_clean($table);

		$username = $this->xss_clean($username);



		$res = $this->db->query("SELECT name FROM $table WHERE mobile = '$username'");

		if($res->num_rows > 0){

			return $res->fetch_assoc();

		}

		else

		{

			return false;

		}	

	}

	

	public function get_where_custom($table,$col,$value){



		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);



		$res = $this->db->query("SELECT * FROM $table WHERE $col = '$value' ");

		$data_ar = [];

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

		}

		return $data_ar;

	}



	public function get_custom_col($table,$col="*",$where,$value){ 



		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$where = $this->xss_clean($where);



		//echo "SELECT $col FROM $table WHERE $where='$value'";die;

			$res = $this->db->query("SELECT $col FROM $table WHERE $where='$value'");

		if($res->num_rows>0)

		{

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

		}

		return $data_ar;

	}



    

    public function get_count($table,$col,$value,$count){

		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$count = $this->xss_clean($count);

	

    	$res = $this->db->query("SELECT count($count) as count FROM $table WHERE $col = '$value'");

    	$count = $res->fetch_assoc();

    	return $count['count'];

    }

    public function get_count_all($table,$count){



		$table = $this->xss_clean($table);

		$count = $this->xss_clean($count);



    	$res = $this->db->query("SELECT count($count) as count FROM $table ");

    	$count = $res->fetch_assoc();

    	return $count['count'];

    }



    public function get_sum($table,$col,$value,$sum){



		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$sum = $this->xss_clean($sum);



    	$res = $this->db->query("SELECT sum($sum) as sum FROM $table WHERE $col = '$value'");

    	$sum = $res->fetch_assoc();

    	return round($sum['sum'],2);

    }

    public function get_sum_value($table,$sum){

		$table = $this->xss_clean($table);

		$sum = $this->xss_clean($sum);





    	$res = $this->db->query("SELECT sum($sum) as sum FROM $table");

    	$sum = $res->fetch_assoc();

    	return round($sum['sum'],2);

    }

    public function get_sum1($table,$col,$value,$sum){

		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$sum = $this->xss_clean($sum);



    	$res = $this->db->query("SELECT sum($sum) as sum FROM $table WHERE $col = '$value' AND status = 'Success'");

    	$sum = $res->fetch_assoc();

    	return round($sum['sum'],2);

    }



 

	public function getUserDetails($user){



	  $user  =$this->xss_clean($user);

	  $res   =$this->db->query("SELECT name, mobile, email, city, pan, adhar, ac_no, ifsc FROM users WHERE id='$user'");

	  $data =$res->fetch_assoc();

	  return $data;

	}



	public function changeDateToTimeDate($date)

	{		

		return date('h:i A d M Y', strtotime($date));

	}

		

	

	public function AddLocation($city){

		$city = $this->xss_clean($city);



		$res = $this->db->query("INSERT INTO locations (name) VALUES ('$city')");

		return TRUE;

	}

	

	public function get_refer($user){

		$user = $this->xss_clean($user);

		return $this->db->query("SELECT * FROM users WHERE sponser_id = '$user'");

	}

	

	public function users($status, $username, $from, $to){

		$status	  = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$status)));

		$username = htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$username)));

		$from = mysqli_real_escape_string($this->db,$from);

		$to   = mysqli_real_escape_string($this->db,$to);



	 	$query = "SELECT username,status,email,password, id, name, mobile, earnings, funds, sponser_id, date_time,earned FROM users WHERE status = '$status'"; 



		if($username!=""){



			$query .= "AND username='$username' OR mobile='$username'";

		}



		if($from!=""){



			$from = date('y-m-d',strtotime($from));

			$from = $from." 00:00:00";

			

			$query .= "AND date_time>='$from'";



		}



		if($to!=""){



			$to = date('y-m-d',strtotime($to));

			$to = $to." 23:59:59";



			$query .= "AND date_time<='$to'";



		}



		$query .="  ORDER BY id DESC";



		$res = $this->db->query($query);



		return $res;

	}

	public function users_all($username, $from, $to){



		$username=htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$username)));

		$from =mysqli_real_escape_string($this->db,$from);

		$to   =mysqli_real_escape_string($this->db,$to);



		$query ="SELECT username,name,mobile,email,earnings,sponser_id FROM users WHERE status!=''";



		if($username!=""){



			$query .=" AND username='$username' OR mobile='$username'";

		}

		if($from!=""){



			$from   =date('y-m-d',strtotime($from));

			$from   =$from." 00:00:00";

			$query .= "AND date_time>='$from'";

		}

		if($to!=""){



			$to =date('y-m-d',strtotime($to));

			$to =$to." 23:59:59";



			$query .=" AND date_time <='$to'";

		}

		$query .=" ORDER BY id DESC";

		$res =$this->db->query($query);



		return $res;

	}



	public function update_user_status($action, $id){



		$action =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$action)));

		$id     =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$id)));



		$query  =$this->db->query("UPDATE users SET status='$action' WHERE id='$id'");



		if($query){



			return true;	

		}

	}

      

	public function calculate_refers_user($username,$spo_id,$level,$amount,$user_order_id){

		 

		$myarr = array('1'=>10,'2'=>6,'3'=>4,'4'=>3,'5'=>1,'6'=>0.50,'7'=>0.50,'8'=>0.40,'9'=>0.40,'10'=>0.30,'11'=>0.30,'12'=>0.30,'13'=>0.30,'14'=>0.25,'15'=>0.25,'16'=>0.25,'17'=>0.25,'18'=>0.25,'19'=>0.25,'20'=>0.25,'21'=>0.25,'22'=>0.25,'23'=>0.25,'24'=>0.25,'25'=>0.25);

		

        $i = 1;

		

		$get_user_id = $this->db->query("SELECT id FROM users WHERE username='$username'");

		

		 $get_user_id_hwe =$get_user_id->fetch_assoc();

		

		$user_id = $get_user_id_hwe['id'];

		

        while($i<=$level){



        	$res =$this->db->query("SELECT id,sponser_id,status,username,team_business FROM users WHERE username='$spo_id'");



            if($res->num_rows >0){



                $data =$res->fetch_assoc();



                $sp_username =$spo_id;

                $spo_id 	 =$data['sponser_id'];

                $id 		 =$data['id'];

                $status 	 =$data['status'];

               

					

				$percent = $myarr[$i];

					

				$amount_hwe = $amount*$percent/100;

				

				$team_business = $data['team_business'];

				

				$team_business_new=$team_business+$amount;



				$this->db->query("Insert into  refer_earnings SET   user_id=$user_id,

																	user_order_id=$user_order_id,

																	sponser_id='$id',

																	business='$amount',

																	amount_rec='$amount_hwe',

																	level='$i',

																	percent='$percent',

																	status='Hold',

																	date_time='$this->date_time'

																	");

				$this->db->query("Update users SET team_business='$team_business_new'  WHERE id=".$id);

				



				}else{



					$i =$level+1;

				}



				if($spo_id == 'ADD'){



					$i = $level+1;



				}$i++;

			} 

			return TRUE;

		}

   

	public function Setup($private_key, $public_key) {

		$this->private_key = $private_key;

		$this->public_key = $public_key;

		$this->ch = null;

	}



	public function delete($table,$id){



 		$table =$this->xss_clean($table);

 		$id    =$this->xss_clean($id);



 		$query =$this->db->query("DELETE FROM $table WHERE id='$id'");



 		if($query){

 		

 			return true;

 		}

 	} 

  

	public function update_admin_with($id,$status){



		$id 	=$this->xss_clean($id);

		$status =$this->xss_clean($status);

		

		$res =$this->db->query("SELECT id FROM withdrawals WHERE id='$id' AND status='Pending' AND admin_status='Pending'");



		if($res->num_rows=='1'){

			

			$this->db->query("UPDATE withdrawals SET admin_status='Success' WHERE id='$id'");

			return true;



		}else{

			return false;

		}

	}







	public function xss_clean($value){



		return htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$value)));

	}



    private function calculate_refers_userwith($username,$spo_id,$level,$amount,$type=""){



		$username =$this->xss_clean($username);

		$spo_id   =$this->xss_clean($spo_id);

		$level    =$this->xss_clean($level);

		$amount   =$this->xss_clean($amount);



        $i =1;



        while($i <= $level){



        	$res =$this->db->query("SELECT id, sponser_id, status, username FROM users WHERE username='$spo_id'");



            if($res->num_rows >0){



                $data = $res->fetch_assoc();



                $sp_username =$spo_id;

                $spo_id 	 =$data['sponser_id'];

                $id 		 =$data['id'];

                $status 	 =$data['status'];



				if($i<= 21){



	                $levelcol = "level".$i;

               		$query =$this->db->query("UPDATE users SET business=business-$amount,$levelcol =levelcol -'$amount' WHERE id='$id'");

                }else{

               		$query =$this->db->query("UPDATE users SET business=business-$amount WHERE id='$id'");

                }

                    	

            }else{



                $i =$level+1;

            }



            if($spo_id == 'ADD'){



                $i = $level+1;



            }$i++;

        }



        return TRUE;

    }



	public function updatePassword($old_password,$password,$cpassword,$redirect){



		$old_pass 	  =$this->xss_clean($old_password);

    	$new_password =$this->xss_clean($password);

    	$cpassword =$this->xss_clean($cpassword);

    	$username 	  =$_SESSION['username'];



    	if($old_pass=="" || $new_password=="" || $cpassword=="" ){



			$_SESSION['failed']='old password, new password, Confirm Password fields are required!';

			header('Location:'.$redirect);

			exit();

        }



    	if ($new_password==$old_pass) {



			$_SESSION['failed']='New password and old password must be different!';

			header('Location:'.$redirect);

			exit();

		}



		if ($new_password!=$cpassword) {



			$_SESSION['failed']='New password and Confirm password must be same!';

			header('Location:'.$redirect);

			exit();

		}



		$old_pass =sha1($old_pass);

		$pass 	  =sha1($new_password);



		if (strlen($new_password) < 6){



			$_SESSION['failed']='Password must have six character in length.';

			header('Location:'.$redirect);

			exit();

		}



		if (strlen($new_password) > 25){



			$_SESSION['failed']='Password must not be grater than 25 character in length.';

			header('Location:'.$redirect);

			exit();

		}



		if (preg_match('/\s/',$new_password)){

			

			$_SESSION['failed']='You can not use any space in password.';

			header('Location:'.$redirect);

			exit();



		}

	

		$res =$this->db->query("SELECT id FROM users WHERE username = '$username' and password = '$old_pass' ");

		

		if($res->num_rows == 0){



			$_SESSION['failed']='Invalid Old Password!';

			header('Location:'.$redirect);

			exit();

		}



		$res =$this->db->query("UPDATE users SET password='$pass'  WHERE username='$username'");

		

		if($res){



			$_SESSION['success']='Password updated successfully!';

			header('Location:'.$redirect);

			exit();

		}

		

		$_SESSION['failed']='Try again later!';

			header('Location:'.$redirect);

			exit();

	}



	public function updateTxnPassword($old_password,$password,$cpassword,$redirect){



		$old_pass 	  =$this->xss_clean($old_password);

    	$new_password =$this->xss_clean($password);

    	$cpassword =$this->xss_clean($cpassword);



    	$username 	  =$_SESSION['username'];



    	if($old_pass=="" || $new_password=="" || $cpassword=="" ){



			$_SESSION['failed']='old transaction password, new transaction password, Confirm transaction Password fields are required!';

			header('Location:'.$redirect);

			exit();

        }



    	if ($new_password==$old_pass) {



			$_SESSION['failed']='New transaction password and old transaction password must be different!';

			header('Location:'.$redirect);

			exit();

		}



		if ($new_password!=$cpassword) {



			$_SESSION['failed']='New transaction password and Confirm transaction password must be same!';

			header('Location:'.$redirect);

			exit();

		}





		$old_pass =sha1($old_pass);

		$pass     =sha1($new_password);



		if (strlen($new_password)<6) {



			$_SESSION['failed'] ="Transaction Password must have six character in length.";

			header('Location:'.$redirect);

			exit();

		}



		if (strlen($new_password)>25) {



			$_SESSION['failed'] ="Transaction Password must not be grater than 25 character in length.";

		header('Location:'.$redirect);exit();

		}



		if (preg_match('/\s/',$new_password)){

			

			$_SESSION['failed'] ="You can not use any space in transaction password.";

			header('Location:'.$redirect);

			exit();

		}



		$res =$this->db->query("SELECT id FROM users WHERE username='$username' and sec_code='$old_pass'");

		

		if($res->num_rows == 0){



			$_SESSION['failed'] ="Invalid Old Transaction Password!";

			header('Location:'.$redirect);

			exit();

		}



		$res =$this->db->query("UPDATE users SET sec_code='$pass' WHERE username='$username'");		

		if($res){		

			$_SESSION['success'] ="Transaction Password updated successfully!";

			header('Location:'.$redirect);

			exit();

		}

		

		$_SESSION['failed'] ="Try again later!";

		header('Location:'.$redirect);

		exit();

	}



	public function get_where_custom_value($level,$users){



		$users = $this->xss_clean($users);

		$level = $this->xss_clean($level);



		$res = $this->db->query("SELECT user_id,name,status,business,invested,date_time FROM downline,users WHERE downline.level = '$level'  AND downline.sponser_id='$users' AND downline.user_id=users.username");

		$data_ar = [];

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

		}

		return $data_ar;

	}





	public function forgotPassword($user_id,$email){



		$username =$this->xss_clean($user_id);

		$email   =$this->xss_clean($email);



    	if($email=="" || $username==""){



			$_SESSION['failed'] ="email fields is required!";

			header('Location:forgot');

			exit();        

        }



		$res =$this->db->query("SELECT name,email,mobile FROM frenchise_users WHERE username='$username' AND email='$email'");

		

		if($res->num_rows == 0){



			$_SESSION['failed'] ="Email and user Id Not matched, please try again!";

			header('Location:forgot');

			exit();        

		}



		$data      =$res->fetch_assoc(); 

		$name      =$data['name'];

		$email     =$data['email'];

		$mobile    =$data['mobile'];

		$pass      =rand(100000,999999);

		$password  =sha1($pass);

		$pass1     =rand(100000,999999);

		$password1 =sha1($pass1);



		$sub ='Password for Aglobetrading';



		$headers  = 'MIME-Version: 1.0' . "\r\n";

		$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

		$headers .= 'From: noreply@aglobetrading.com' . "\r\n";

		$headers .= 'Reply-To: noreply@aglobetrading.com' . "\r\n";

		$headers .= 'X-Mailer: PHP/' . phpversion();



		$message  = '<html><body style ="background-color:#000; color:#fff;">';

		$message  = $message.'<div style ="margin: 25px;">';

		$message  = $message.'<center><img src="https://aglobetrading.com/img/logos/logo.png" style ="margin: 25px;"></center>';

		$message  = $message.'<center><h3>Dear '.$name.'</h3>';

		$message  = $message.'<h4> Your login details is</h4>';

		$message  = $message.'<h5>User ID : '.$username.'</h5>';

		$message  = $message.'<h5>password: '.$pass.'</h5>';

		$message  = $message.'<h5>Transaction password: '.$pass1.'</h5>';

		$message  = $message.'<p>Aglobetrading,</p>';

		$message  = $message.'</center>';

		$message  = $message.'</div>';

		$message .= '</body></html>';



		$mm =mail($email,$sub,$message,$headers);

					

		if($mm){



			$res =$this->db->query("UPDATE frenchise_users SET password='$password',sec_code='$password1' WHERE username='$username'");	

			$_SESSION['success'] ="Password changed successfully, Please check your registered Email!";

			header('Location:forgot');

			exit();   

		}

			

		$_SESSION['failed'] ="Sorry! Try again later!";

		header('Location:forgot');

		exit();   

		

	}



	public function get_country(){



		return $this->db->query("SELECT id,name,phonecode FROM countries");

	}



	

	public function get_countryname($id){





		$id = $this->xss_clean($id);

		$res = $this->db->query("SELECT name FROM countries WHERE id = '$id'");

		return $res->fetch_object()->name;



	}

	



/* new funcitons */



	public function get_custom_order_by($table,$order_by,$order,$col="",$value=""){



		$table    =$this->xss_clean($table);

		$col      =$this->xss_clean($col);

		$value    =$this->xss_clean($value);

		$order    =$this->xss_clean($order);

		$order_by =$this->xss_clean($order_by);



		if($col=="" || $value==""){		



			return $this->db->query("SELECT * FROM $table ORDER BY $order_by $order");

			

		}else{



			return $this->db->query("SELECT * FROM $table WHERE $col='$value' ORDER BY $order_by $order");

		}

	}	



	public function get_custom_multiple_order_by($table,$order_by,$order,$col,$value,$col1,$value1,$col2="",$value2=""){



		$table    =$this->xss_clean($table);

		$col      =$this->xss_clean($col);

		$value    =$this->xss_clean($value);

		$col1     =$this->xss_clean($col1);

		$value1   =$this->xss_clean($value1);

		$col2     =$this->xss_clean($col2);

		$value2   =$this->xss_clean($value2);

		$order    =$this->xss_clean($order);

		$order_by =$this->xss_clean($order_by);



		if($col2 == "" || $value2 == ""){



			return $this->db->query("SELECT * FROM $table WHERE $col='$value' AND $col1='$value1' ORDER BY $order_by $order");

			

		}else{



			return $this->db->query("SELECT * FROM $table WHERE $col='$value' AND ($col1='$value1' OR $col2='$value2') ORDER BY $order_by $order");

		}



	}



    public function get_custom_sum($table,$col,$value,$sum,$col1,$value1){



    	$table  =$this->xss_clean($table);

    	$col    =$this->xss_clean($col);

    	$value  =$this->xss_clean($value);

    	$sum    =$this->xss_clean($sum);

    	$col1   =$this->xss_clean($col1);

    	$value1 =$this->xss_clean($value1);



    	$res =$this->db->query("SELECT sum($sum) as sum FROM $table WHERE $col='$value' AND $col1='$value1'");

    	$sum =$res->fetch_assoc();

    	return round($sum['sum'],2);

    }   



    public function get_custom_count($table,$col,$value,$count,$col1,$value1){



    	$table  = $this->xss_clean($table);

    	$col    = $this->xss_clean($col);

    	$value  = $this->xss_clean($value);

    	$count  = $this->xss_clean($count);

    	$col1   = $this->xss_clean($col1);

    	$value1 = $this->xss_clean($value1);



    	$res = $this->db->query("SELECT count($count) as count FROM $table WHERE $col = '$value' AND $col1 = '$value1'");

    	$count = $res->fetch_assoc();

    	return round($count['count'],2);

    }



	public function get_username($username){



    	$username =$this->xss_clean($username);



		$res =$this->db->query("SELECT name FROM users WHERE username = '$username'");

		return $res->fetch_assoc()['name'];

	}



	public function changetxnPass($user,$old_pass,$pass){



		$old_pass =sha1($old_pass);

		$pass 	  =sha1($pass);

		$new_pass =$this->xss_clean($pass);

		$old_pass =$this->xss_clean($old_pass);



		$res =$this->db->query("SELECT id FROM users WHERE id='$user' and sec_code='$old_pass'");



		if($res->num_rows > 0){



			$res =$this->db->query("UPDATE users SET sec_code='$pass' WHERE id='$user'");



			if($res){



				return TRUE;

			}

		}else{

			$_SESSION['failed'] ='Invalid Old Transaction Password !';

        	header('Location: changetxnpass');

        	exit;

		}

	}



	public function get_custom_order_by_limit($table,$col,$value,$order_by,$order,$limit){



		$table 	  =$this->xss_clean($table);

		$col 	  =$this->xss_clean($col);

		$value    =$this->xss_clean($value);

		$order    =$this->xss_clean($order);

		$order_by =$this->xss_clean($order_by);



		$res =$this->db->query("SELECT * FROM $table WHERE $col='$value' ORDER BY $order_by $order LIMIT $limit");

		return $res;

	}	



	public function get_package_value($package){



		$package =$this->xss_clean($package);



		$res =$this->db->query("SELECT name,package FROM packages WHERE max>='$package' AND package > 0 ORDER BY id ASC LIMIT 1");



		return $res->fetch_assoc();



	}



	public function get_custom_field_data($table,$col,$value,$fields,$order_by,$order){



		$table    =$this->xss_clean($table);

		$col      =$this->xss_clean($col);

		$value    =$this->xss_clean($value);

		$order    =$this->xss_clean($order);

		$order_by =$this->xss_clean($order_by);

		$fields   =$this->xss_clean($fields);



		$res =$this->db->query("SELECT $fields FROM $table WHERE $col='$value' ORDER BY $order_by $order");

		return $res->fetch_assoc();

	}	



	public function get_name_by_username($user){



		$user =$this->xss_clean($user);



		$res  =$this->db->query("SELECT name FROM users WHERE username='$user'");

		$data =$res->fetch_assoc();

		return $data['name'];

	}



 	public function send_otp_by_email($email,$code,$name){



 		$email = $this->xss_clean($email);

 		$code  = $this->xss_clean($code);

 		$name  = $this->xss_clean($name);



		$sub ='OTP Verification';



		$headers  ='MIME-Version: 1.0' . "\r\n";

		$headers .='Content-type: text/html; charset=iso-8859-1' . "\r\n";

		$headers .='From: info@aglobetrading.com' . "\r\n";

		$headers .='Reply-To: info@aglobetrading.com' . "\r\n";

		$headers .='X-Mailer: PHP/' . phpversion();



		$message ='<html><body style ="background-color:#000; color:#fff;">';

		$message =$message.'<div style ="margin: 25px;">';

		$message =$message.'<center><img src="https://aglobetrading.com/img/logos/logo.png" style ="margin: 25px;"></center>';

		$message =$message.'<center><h3>Dear '.$name.'</h3>';

		$message =$message.'<h5>Your otp number is : '.$code.'</h5>';

		$message =$message.'<p>Team Aglobetrading,</p>';

		$message =$message.'<p>www.aglobetrading.com</p></center>';

		$message =$message.'</div>';

		$message .='</body></html>';



		$mm = mail($email,$sub,$message,$headers);

		if($mm){

			return true;

		}else{

			return false;

		}

	}



	public function add_categories($title){



		$title   =$this->xss_clean($title);

		//$message =$this->xss_clean($message);

		

		if($_FILES['image']['name']!=''){



			

			$fileinfo = @getimagesize($_FILES["image"]["tmp_name"]);

			$width = $fileinfo[0];

			$height = $fileinfo[1];

			

			if($width > 120 || $height > 120)

			{

				$_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  120 X 120</div>';

				header('Location: add_categories');

				exit;

			}







	 		$name =time().$this->randomCode(5);

			$ext  =strstr($_FILES["image"]["name"],".");

			$new_name =$name.$ext;



			if(move_uploaded_file($_FILES["image"]["tmp_name"],"../gallery/category-images/".$new_name)){

				

				$res =$this->db->query("INSERT INTO categories(category_name,category_image,category_status,created)VALUES('$title','$new_name','Active','$this->date_time')");



			 	if($res){



		 		    header('Location: add_categories.php');

		 			return TRUE;

		            exit;

			 	}

		 	}

			

 		}	

	}

	public function edit_categories($cat_id,$title){



		$cat_id   =$this->xss_clean($cat_id);

		$title   =$this->xss_clean($title);

	//	$message =$this->xss_clean($message);

		

	//	if($_FILES['image']['name']!=''){



	 		$name =time().$this->randomCode(5);

			$ext  =strstr($_FILES["image"]["name"],".");

			$new_name =$name.$ext;

			$cat_name = $_REQUEST['cat_name'];

			

			if($title != $cat_name)

			{

				$get_cat = $this->db->query("select * from categories where category_name='$title'");

				$get_cat_res = $get_cat->fetch_object();

				if($title == $get_cat_res->category_name)

				{

					$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Category Already Exist !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

					header('Location: edit_categories?cat_name='.$title.'&id='.base64_encode($cat_id));

					exit;

				}

			}

			

			if(move_uploaded_file($_FILES["image"]["tmp_name"],"../gallery/category-images/".$new_name)){

				

				$res =$this->db->query("update categories SET   category_name='$title',

																category_image='$new_name',

																updated='$this->date_time'

																where id=$cat_id");

			 if($res){



		 		//    header('Location: event_image.php');

		 			return TRUE;

		            exit;

			 	} 

		 	}

			

 		//	}	

	}

	public function update_cat_status($cat_id){



		$cat_id   =$this->xss_clean($cat_id);



		$query =$this->db->query("select * from categories where id=".$cat_id);

	

		$res = $query->fetch_assoc();

		

		$new_status='';

		if($res['category_status']=='Active')

		{

			$new_status = 'Deactive';

		}

		else

		{

			$new_status = 'Active';

		}

	

		$query =$this->db->query("update categories SET category_status='$new_status'

														where id=".$res['id']);



 		if($query){



 			return true;

 		}

	}

	

	public function update_product_status($product_id){



		$product_id   =$this->xss_clean($product_id);



		$query =$this->db->query("select * from products where id=".$product_id);

	

		$res = $query->fetch_assoc();

		

		$new_status='';

		if($res['status']=='Active')

		{

			$new_status = 'Deactive';

		}

		else

		{

			$new_status = 'Active';

		}

	

		$query =$this->db->query("update products SET status='$new_status'

														where id=".$res['id']);



 		if($query){



 			return true;

 		}

	}

	

	

	public function add_sub_categories($title,$cat_name){

			

		$title  =$this->xss_clean($title);

		$cat_name =$this->xss_clean($cat_name);

		$query =$this->db->query("INSERT INTO sub_categories(cat_name,sub_category_name,status,created)VALUES('$cat_name','$title','Active','$this->date_time')");



 		if($query){



 			return true;

 		}

	}

	public function edit_sub_categories($cat_id,$title){



		$cat_id   =$this->xss_clean($cat_id);

		$title   =$this->xss_clean($title);

		$sub_cat_name = $_REQUEST['sub_cat_name'];

		//$cat_name =$this->xss_clean($cat_name);

		

		if($title != $sub_cat_name)

		{

			$get_sub_cat = $this->db->query("select * from sub_categories where sub_category_name='$title'");

			$get_sub_cat_res = $get_sub_cat->fetch_object();

			if($title == $get_sub_cat_res->sub_category_name)

				{

					$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Sub Category Already Exist !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

					header('Location: edit_sub_categories?cat_name='.$title.'&id='.base64_encode($cat_id));

					exit;

				}

		}

		

		$query =$this->db->query("update sub_categories SET 

															sub_category_name='$title'



															where id=$cat_id");



 		if($query){



 			return true;

 		}

	}

	public function update_sub_cat_status($cat_id){



		$cat_id   =$this->xss_clean($cat_id);



		$query =$this->db->query("select * from sub_categories where id=".$cat_id);

	

		$res = $query->fetch_assoc();

		

		

		$new_status='';

		if($res['status']=='Active')

		{

			$new_status = 'Deactive';

		}

		else

		{

			$new_status = 'Active';

		}

	

		$query =$this->db->query("update sub_categories SET status='$new_status'

														where id=".$res['id']);



 		if($query){



 			return true;

 		}

	}	

	public function add_products($product_name,$product_category_name,$product_sub_category_name,$product_mrp,$product_dp,$product_bv,$product_full_desc,$product_short_desc,$product_image_link,$product_gallery_image1_link,$product_gallery_image2_link,$product_gallery_image3_link){



	//	$title                     = $this->xss_clean($title);

		$product_name 			   = $this->xss_clean($product_name);

		$product_category_name     = $this->xss_clean($product_category_name);

		$product_sub_category_name = $this->xss_clean($product_sub_category_name);

		$product_mrp   			   = $this->xss_clean($product_mrp);

		$product_dp   			   = $this->xss_clean($product_dp);

		$product_bv   			   = $this->xss_clean($product_bv);

		$product_full_desc         = $this->xss_clean($product_full_desc);

		$product_short_desc        = $this->xss_clean($product_short_desc);

		$product_image_link        = $this->xss_clean($product_image_link);

		$product_gallery_image1_link =$this->xss_clean($product_gallery_image1_link); 

		$product_gallery_image2_link =$this->xss_clean($product_gallery_image2_link); 

		$product_gallery_image3_link =$this->xss_clean($product_gallery_image3_link); 

		

		if(!empty($_FILES['product_image']['name'] ))

		{	

			if(empty($_FILES['product_gallery_image1']['name'] ))

			{

				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Gallery image cant be blank !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: add_products');

				exit;	

			}

			if(empty($_FILES['product_gallery_image2']['name'] ))

			{

				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Gallery image cant be blank !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: add_products');

				exit;

			}

			if(empty($_FILES['product_gallery_image3']['name'] ))

			{

				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Gallery image cant be blank !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: add_products');

				exit;

			}

			$fileinfo = @getimagesize($_FILES["product_image"]["tmp_name"]);

			$width = $fileinfo[0];

			$height = $fileinfo[1];

			

			if($width > 120 || $height > 120)

			{

				$_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  120 X 120</div>';

				header('Location: add_categories');

				exit;

			}



			$fileinfo = @getimagesize($_FILES["product_gallery_image1"]["tmp_name"]);

			$width = $fileinfo[0];

			$height = $fileinfo[1];

			

			if($width > 120 || $height > 120)

			{

				$_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  120 X 120</div>';

				header('Location: add_categories');

				exit;

			}



			$fileinfo = @getimagesize($_FILES["product_gallery_image2"]["tmp_name"]);

			$width = $fileinfo[0];

			$height = $fileinfo[1];

			

			if($width > 120 || $height > 120)

			{

				$_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  120 X 120</div>';

				header('Location: add_categories');

				exit;

			}



			$fileinfo = @getimagesize($_FILES["product_gallery_image3"]["tmp_name"]);

			$width = $fileinfo[0];

			$height = $fileinfo[1];

			

			if($width > 120 || $height > 120)

			{

				$_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  120 X 120</div>';

				header('Location: add_categories');

				exit;

			}



			

			$filenamep  = strtolower($this->xss_clean($_FILES["product_image"]["name"]));

			$filenamep  = str_replace('php','', $filenamep);

			

			$filenamep1  = strtolower($this->xss_clean($_FILES["product_gallery_image1"]["name"]));

			$filenamep1  = str_replace('php','', $filenamep1);

			

			$filenamep2  = strtolower($this->xss_clean($_FILES["product_gallery_image2"]["name"]));

			$filenamep2  = str_replace('php','', $filenamep2);

			

			$filenamep3  = strtolower($this->xss_clean($_FILES["product_gallery_image3"]["name"]));

			$filenamep3  = str_replace('php','', $filenamep3);

			

			if($filenamep != ""){





			

			$size_p = getimagesize($this->xss_clean($_FILES['product_image']['tmp_name']));

			$ext_p  = image_type_to_extension($size_p[2]);

				

			$size_p1 = getimagesize($this->xss_clean($_FILES['product_gallery_image1']['tmp_name']));

			$ext_p1  = image_type_to_extension($size_p1[2]);

				

			$size_p2 = getimagesize($this->xss_clean($_FILES['product_gallery_image2']['tmp_name']));

			$ext_p2  = image_type_to_extension($size_p2[2]);	

				

			$size_p3 = getimagesize($this->xss_clean($_FILES['product_gallery_image3']['tmp_name']));

			$ext_p3  = image_type_to_extension($size_p3[2]);		



			$allowed_type = ["image/jpg", "image/JPG", "image/jpeg", "image/JPEG", "image/png", "image/PNG"];

				

			if(!in_array($size_p1['mime'], $allowed_type)) {



			   $_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Invalid images!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

                header('Location: add_products');

                exit;

              }

			if(!in_array($size_p2['mime'], $allowed_type)) {



			   $_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Invalid images!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

                header('Location: add_products');

                exit;

              }	

			if(!in_array($size_p3['mime'], $allowed_type)) {



			   $_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Invalid images!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

                header('Location: add_products');

                exit;

              }		

				

			if(!in_array($size_p['mime'], $allowed_type)) {



			   $_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Invalid images!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

                header('Location: add_products');

                exit;

              }

				else

					

				{	 

					$p_filename = time().$ext_p;

					$p_filename1 = time().rand(0000,9999).$ext_p1;

					$p_filename2 = time().rand(000000,999999).$ext_p2;

					$p_filename3 = time().rand(00000000,99999999).$ext_p2;

					

														

					if(move_uploaded_file($_FILES['product_image']['tmp_name'], '../image/'.$p_filename) && move_uploaded_file($_FILES['product_gallery_image1']['tmp_name'], '../image/'.$p_filename1) && move_uploaded_file($_FILES['product_gallery_image2']['tmp_name'], '../image/'.$p_filename2) &&move_uploaded_file($_FILES['product_gallery_image3']['tmp_name'], '../image/'.$p_filename3) )

					{	

						

						$product_image_link = $p_filename; 

						$product_gallery_image_link1 = $p_filename1; 

						$product_gallery_image_link2 = $p_filename2; 

						$product_gallery_image_link3 = $p_filename3; 

						

						$query =$this->db->query("INSERT INTO products SET  product_name='$product_name',

															product_category_name='$product_category_name',

															product_sub_category_name='$product_sub_category_name',

															product_mrp='$product_mrp',

															product_dp='$product_dp',

															product_bv='$product_bv',

															product_full_desc='$product_full_desc',

															product_short_desc='$product_short_desc',

															product_image='$product_image_link',

															product_gallery_image1='$product_gallery_image_link1',

															product_gallery_image2='$product_gallery_image_link2',

															product_gallery_image3='$product_gallery_image_link3',

															status='Active',

															created='$this->date_time'

															");

						

					}

					else

					{

						$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Try again later !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

						 header('Location: add_products');

						 exit;

						

					}

					

				}

			}

		

 		if($query){

			



 			return true;

 		}

	}

	}

	public function edit_products($product_id,$product_name,$product_mrp,$product_dp,$product_bv,$product_full_desc,$product_short_desc,$product_image_link,$product_gallery_image1_link,$product_gallery_image2_link,$product_gallery_image3_link){



		$product_id   =$this->xss_clean($product_id);

		$product_name 			   = $this->xss_clean($product_name);

	//	$product_category_name     = $this->xss_clean($product_category_name);

	//	$product_sub_category_name = $this->xss_clean($product_sub_category_name);

		$product_mrp   			   = $this->xss_clean($product_mrp);

		$product_dp   			   = $this->xss_clean($product_dp);

		$product_bv   			   = $this->xss_clean($product_bv);

		$product_full_desc         = $this->xss_clean($product_full_desc);

		$product_short_desc        = $this->xss_clean($product_short_desc);

		$product_image_link        = $this->xss_clean($product_image_link);

		$product_gallery_image1_link =$this->xss_clean($product_gallery_image1_link); 

		$product_gallery_image2_link =$this->xss_clean($product_gallery_image2_link); 

		$product_gallery_image3_link =$this->xss_clean($product_gallery_image3_link); 

		

		$p_name=$_REQUEST['p_name'];

		$allowed_type = ["image/jpg", "image/JPG", "image/jpeg", "image/JPEG", "image/png", "image/PNG"];

		if($product_name != $p_name)

		{

			$get_prdt = $this->db->query("select * from products where product_name='$product_name'");

				$get_prdt_res = $get_prdt->fetch_object();

				if($title == $get_prdt_res->category_name)

				{

					$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Product name Already Exist !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

					header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

					exit;

				}

		}

		

		if(!empty($_FILES['product_image']['name'] ))

		{	

			$filenamep  = strtolower($this->xss_clean($_FILES["product_image"]["name"]));

			$filenamep  = str_replace('php','', $filenamep);

			

			$fileinfo = @getimagesize($_FILES["product_image"]["tmp_name"]);

			$width = $fileinfo[0];

			$height = $fileinfo[1];

			

			if($width > 120 || $height > 120)

			{

				$_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  120 X 120</div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				exit;

			}





			if($filenamep != ""){

			

			$size_p = getimagesize($this->xss_clean($_FILES['product_image']['tmp_name']));

			$ext_p  = image_type_to_extension($size_p[2]);

			}

			if(!in_array($size_p['mime'], $allowed_type)) {



				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Invalid images!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				 exit;

			   }

			$p_filename = time().$ext_p;

			if(!move_uploaded_file($_FILES['product_image']['tmp_name'], '../image/'.$p_filename))

			{

				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Try again later !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				exit;

			}

			$product_image_link = $p_filename; 

		}

		else

		{

			$data = $this->get_where_custom('products ','id',base64_decode($_REQUEST['id']));

			$product_image_link =  $data[0]['product_image']; 

		}

		if(!empty($_FILES['product_gallery_image1']['name'] ))

		{

			$size_p1 = getimagesize($this->xss_clean($_FILES['product_gallery_image1']['tmp_name']));

			$ext_p1  = image_type_to_extension($size_p1[2]);

			

			$fileinfo = @getimagesize($_FILES["product_gallery_image1"]["tmp_name"]);

			$width = $fileinfo[0];

			$height = $fileinfo[1];

			

			if($width > 120 || $height > 120)

			{

				$_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  120 X 120</div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				exit;

			}







			if(!in_array($size_p1['mime'], $allowed_type)) {



				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Invalid images!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				 exit;

			   }

			$p_filename1 = time().rand(0000,9999).$ext_p1;

			if(!	move_uploaded_file($_FILES['product_gallery_image1']['tmp_name'], '../image/'.$p_filename1))

			{

				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Try again later !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				exit;

			}

			$product_gallery_image_link1 = $p_filename1; 

		}	

		else

		{

			$data = $this->get_where_custom('products ','id',base64_decode($_REQUEST['id']));

			$product_gallery_image_link1 =  $data[0]['product_gallery_image1']; 

		}

		if(!empty($_FILES['product_gallery_image2']['name'] ))

		{	

			$size_p2 = getimagesize($this->xss_clean($_FILES['product_gallery_image2']['tmp_name']));

			$ext_p2  = image_type_to_extension($size_p2[2]);

			

			$fileinfo = @getimagesize($_FILES["product_gallery_image2"]["tmp_name"]);

			$width = $fileinfo[0];

			$height = $fileinfo[1];

			

			if($width > 120 || $height > 120)

			{

				$_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  120 X 120</div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				exit;

			}

			

			

			if(!in_array($size_p2['mime'], $allowed_type)) {



				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Invalid images!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				 exit;

			   }	

			   $p_filename2 = time().rand(000000,999999).$ext_p2;

			   if(!	move_uploaded_file($_FILES['product_gallery_image2']['tmp_name'], '../image/'.$p_filename2))

				{

				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Try again later !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				exit;

				}	

				$product_gallery_image_link2 = $p_filename2; 

		}

		else

		{

			$data = $this->get_where_custom('products ','id',base64_decode($_REQUEST['id']));

			$product_gallery_image_link2 =  $data[0]['product_gallery_image2']; 

		}		

		if(!empty($_FILES['product_gallery_image3']['name'] ))

		{

			$size_p3 = getimagesize($this->xss_clean($_FILES['product_gallery_image3']['tmp_name']));

			$ext_p3  = image_type_to_extension($size_p3[2]);

			

			$fileinfo = @getimagesize($_FILES["product_gallery_image3"]["tmp_name"]);

			$width = $fileinfo[0];

			$height = $fileinfo[1];

			

			if($width > 120 || $height > 120)

			{

				$_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  120 X 120</div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				exit;

			}

			

			

			if(!in_array($size_p3['mime'], $allowed_type)) {



				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Invalid images!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				 exit;

			   }		

			   $p_filename3 = time().rand(00000000,99999999).$ext_p2;  

			   if(!	move_uploaded_file($_FILES['product_gallery_image3']['tmp_name'], '../image/'.$p_filename3))

				{

				$_SESSION['failed'] ='<div class="alert alert-danger alert-dismissable">Try again later !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

				header('Location: edit_products?p_name='.$product_name.'&id='.base64_encode($product_id));

				} 

				$product_gallery_image_link3 = $p_filename3; 

		}	

		else

		{

			$data = $this->get_where_custom('products ','id',base64_decode($_REQUEST['id']));

			$product_gallery_image_link3 =  $data[0]['product_gallery_image3']; 

		}			

					

			$query =$this->db->query("Update products SET  product_name='$product_name',

															product_mrp='$product_mrp',

															product_dp='$product_dp',

															product_bv='$product_bv',

															product_full_desc='$product_full_desc',

															product_short_desc='$product_short_desc',

															product_image='$product_image_link',

															product_gallery_image1='$product_gallery_image_link1',

															product_gallery_image2='$product_gallery_image_link2',

															product_gallery_image3='$product_gallery_image_link3'

															where id=$product_id

															

															");

					

 		if($query){



 			return true;

 		 }

    	

	}

	public function add_product_stock($quantity,$product_name){

		

		$quantity  =$this->xss_clean($quantity);

		$product_name =$this->xss_clean($product_name);

			

		$query_res_jpr =$this->db->query("Select id from product_stock where product_id=".$product_name);

		

		if($query_res_jpr->num_rows > 0){

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Quantity Already Exist !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	                    header('Location: stock-management');

	                    exit;

				

				//return true; 

			}

		

		if($quantity == 0)

		{

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Quantity Should be valid Number!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	        header('Location: stock-management');

	        exit;

			

		}

		elseif($quantity < 0 )

		{	

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Quantity Should be valid Number!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	        header('Location: stock-management');

	        exit;

			

		}

		$query =$this->db->query("Update products SET product_stock='$quantity'where id=".$product_name);



 		if($query){

			

			$query_res =$this->db->query("Select id,product_name,product_stock from products where id=".$product_name);

			if($query_res->num_rows > 0){

			$data = $query_res->fetch_assoc();

			$product_stock = $data['product_stock'];

			$this->db->query("Insert into  product_stock SET product_id='$product_name',

															 total_quantity='$product_stock',

															 created='$this->date_time'

															");

			if($product_stock > 0)

			{

				$entry_type='Cr';

				$cmt = 'Added';

			}

				else

				{

					$entry_type='Dr';

					$cmt = 'Debited';

				}

				

			$comment='Stock '.$cmt.' By Admin';	

			$this->db->query("Insert into  stock_record SET product_id='$product_name',

																remainning='$product_stock',

																order_stock='$product_stock',

																type='$entry_type',

																comment='$comment',

																created='$this->date_time'");	

			}

			

 			return true; 

 		}

		else

		{

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">No Products Available !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	        header('Location: stock-management');

	        exit;

		}

	}

	

	public function edit_stock_of_product($product_id,$product_stock){

		

		$product_id   =$this->xss_clean($product_id);

		$product_stock   =$this->xss_clean($product_stock);

		

		$query_res =$this->db->query("Select id,product_name,product_stock from products where id=".$product_id);	

		

		if($product_stock == 0)

			{

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Quantity Should be valid Number!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	        header('Location: edit_product_stock?id='.base64_encode($product_id));

	        exit;

			

			}

		

		if($query_res->num_rows == 0)

		{

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">No Products Available!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	        header('Location: edit_product_stock?id='.base64_encode($product_id));

	        exit;	

		}

		else

		{

			$query_res_jpr = $query_res->fetch_assoc();

			

			$product_stock_total = $query_res_jpr['product_stock']+$product_stock;

			

			if($product_stock_total < 0)

			{

				$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Quantity Should be valid Number!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

				header('Location: edit_product_stock?id='.base64_encode($product_id));

				exit;

			}

			

			$remainning = $product_stock_total;

			

				if($product_stock < 0  )

				{

					$entry_type='Dr'; 

					$cmt = 'Debited';

				}

				else

				{

					$entry_type='Cr'; 

					$cmt = 'Added';

				}

			$comment = 'Stock '.$cmt.' By Admin';

			

			$test = str_replace("-", " ", $product_stock);

		$query =$this->db->query("Insert into  stock_record SET product_id='$product_id',

																remainning='$remainning',

																order_stock='$test',

																type='$entry_type',

																comment='$comment',

																created='$this->date_time'");

		

		

		$query =$this->db->query("update products SET 

														product_stock='$product_stock_total'

													

														where id=$product_id");

		$query =$this->db->query("update product_stock SET 

														total_quantity='$product_stock_total'

													

														where product_id=$product_id");

		



 		if($query){



 			$_SESSION['success']='<div class="alert alert-success alert-dismissable "> Product Stock Edited Successfully! <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

	        header('Location: edit_product_stock?id='.base64_encode($product_id));

			exit;

 		}

	  }

	}	



	public function register_fr_user($sponsorid,$name,$mobile,$state,$district,$email,$password,$username,$txnpassword){



		$redirect    = "fr_users";

    	$name 		 = $this->xss_clean($name);

    	$mobile_no   = $this->xss_clean($mobile);    	

		$state		 = $this->xss_clean($state);    	

		$district    = $this->xss_clean($district);    	

    	

		$email    	 = $this->xss_clean($email);

    	$spo_id   	 = $this->xss_clean($sponsorid);

    	$password 	 = $this->xss_clean($password);

    	$username 	 = $this->xss_clean($username);   	

    	$txnpassword = $this->xss_clean($txnpassword);   

    //	$country 	 = $this->xss_clean($country);   



    	$username    = strtoupper($username);	    	

    	$spo_id      = strtoupper($spo_id);	

    	$email      = strtolower($email);	

  

        $query = $this->db->query("SELECT id FROM frenchise_users WHERE username = '$username'");



    	if($query->num_rows >= '1'){



    	//	$_SESSION['failed']="Username already Registered, Choose different username";

			

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Username already Registered, Choose different username<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	                  

    		return false;

    	}



    	$query=$this->db->query("SELECT id FROM frenchise_users WHERE username = '$spo_id' AND status != 'Suspended'");



    	if($query->num_rows == 0){

    	//	$_SESSION['failed']="Referral id not found! OR Referral ID Not active";

			

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Referral id not found! OR Referral ID Not active<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

			

        	header('Location: '.$redirect);

        	exit();

    	}



		$res_mobile = $this->db->query("SELECT id FROM frenchise_users WHERE mobile = '$mobile_no'");



		if($res_mobile->num_rows > 1000){

			

		//	$_SESSION['failed']="Mobile already registered !";

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Mobile already registered !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

						

		}

		$res_emails = $this->db->query("SELECT id FROM frenchise_users WHERE email = '$email'");



		if($res_emails->num_rows > 100000){

			

		//	$_SESSION['failed']="email already registered !";

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">email already registered !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

						

		}



		$pass  	  =sha1($password);

    	

    	$sec = $txnpassword;

    	$sec_code =sha1($sec);

		

		$get_state_code=$this->db->query("select id,state_code,state_name from states where id='$state'");

		

		$get_state_code_res = $get_state_code->fetch_object();

		$state_code = $get_state_code_res->state_code;

		

		

		$res =$this->db->query("INSERT INTO frenchise_users(username,password,sec_code,name,mobile,email,earnings,sponser_id,state_id,state_code,district,date_time)VALUES('$username','$pass','$sec_code','$name','$mobile_no','$email','0','$spo_id',$state,$state_code,'$district','$this->date_time')");

		return true;

		

    }

	

	public function edit_fr_user($user_id,$name,$mobile,$email,$state,$district,$password,$txn_pass){



		$redirect    = "edit_r_users?id=".$user_id;

		$user_id     = $this->xss_clean($user_id);

    	$name 		 = $this->xss_clean($name);

    	$mobile_no   = $this->xss_clean($mobile);    	

		$state		 = $this->xss_clean($state);    	

		$district    = $this->xss_clean($district);    	

    	

		$email    	 = $this->xss_clean($email);

   // 	$spo_id   	 = $this->xss_clean($sponsorid);

    	$password 	 = $this->xss_clean($password);

    //	$username 	 = $this->xss_clean($username);   	

    	$txn_pass = $this->xss_clean($txn_pass);   

    //	$country 	 = $this->xss_clean($country);   



    //	$username    = strtoupper($username);	    	

    //	$spo_id      = strtoupper($spo_id);	

    	$email      = strtolower($email);	

  

      	$pass  	  =sha1($password);

    	

    	

    	$sec = $txn_pass;

    	$sec_code =sha1($sec);

		

		$get_state_code=$this->db->query("select id,state_code,state_name from states where id='$state'");

		

		$get_state_code_res = $get_state_code->fetch_object();

		$state_code = $get_state_code_res->state_code;

		

		

		

		

		$res =$this->db->query("Update frenchise_users SET  name='$name',

															mobile='$mobile',

															email='$email',

															password='$pass',

															sec_code='$sec_code',

															

															state_id='$state',

															state_code='$state_code',

															district='$district',

															date_time='$this->date_time'

															where id='$user_id'");

															

		return true;

		

    }

	

	

	

	public function get_frenchise_users_to_edit($table,$user_id){



		$table = $this->xss_clean($table);

	

		$user_id = $this->xss_clean($user_id);



		$res = $this->db->query("SELECT * FROM $table where id=$user_id");

		

		return $res;

	}

	public function get_frenchise_prdt_stck_to_edit($table,$user_id){



		$table = $this->xss_clean($table);

	

		$user_id = $this->xss_clean($user_id);



		$res = $this->db->query("SELECT * FROM $table where product_id=$user_id");

		

		return $res;

	}

	public function add_frenchise_product_stock($quantity,$product_id,$frenchise_id){

		

		$quantity  =$this->xss_clean($quantity);

		$product_id =$this->xss_clean($product_id);

		$frenchise_id =$this->xss_clean($frenchise_id);

		//echo "Select id from frenchise_product_stock where product_id=".$product_id." And frenchise_id=".$frenchise_id;	

		$query_res_jpr =$this->db->query("Select id from frenchise_product_stock where product_id=".$product_id." And frenchise_id=".$frenchise_id);

		if($query_res_jpr->num_rows > 0){

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Quantity Already Exist !<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	                    header('Location: fr-stock-management');

	                    exit;

				

				//return true; 

			}

			if($quantity == 0){

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Quantity Should be a Valid number!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	                    header('Location: fr-stock-management');

	                    exit;

				

				//return true; 

			}

		

			$query_res =$this->db->query("Select id,product_name,product_stock from products where id=".$product_id);

			if($query_res->num_rows == 0){

				$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">No Product Available!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	                    header('Location: fr-stock-management');

	                    exit;

			}

			else{

			$data = $query_res->fetch_assoc();

			$product_stock = $data['product_stock'];

			if($quantity > $product_stock  )

			{

				$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">No Stock Available!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	                    header('Location: fr-stock-management');

	                    exit;	

			}

				else {

					$quantity1 =  $product_stock-$quantity;

					

					$query_fr_userres =$this->db->query("Select id,username from frenchise_users where id=".$frenchise_id);

					$query_fr_userres_jpr = $query_fr_userres->fetch_assoc();

					

					if($quantity > 0  )

					{

						$entry_type='Cr'; 

						$cmt='Added';

					}

					

					$comment = 'Stock '.$cmt.' By Admin To Frenchise '.$query_fr_userres_jpr['username'];

					

					$test = str_replace("-", " ", $quantity);

					$query =$this->db->query("Update products SET product_stock='$quantity1'where id=".$product_id);

					$query =$this->db->query("Update product_stock SET total_quantity='$quantity1'where product_id=".$product_id);

					

					$query =$this->db->query("Insert into  stock_record SET product_id='$product_id',

																remainning='$quantity1',

																order_stock='$test',

																type='$entry_type',

																comment='$comment',

																created='$this->date_time'");

					

					$query =$this->db->query("Insert into  frenchise_stock_record SET   frenchise_id='$frenchise_id',

																						product_id='$product_id',

																						remainning='$test',

																						order_stock='$test',

																						type='$entry_type',

																						comment='$comment',

																						created='$this->date_time'");



					

					$this->db->query("Insert into  frenchise_product_stock SET  frenchise_id='$frenchise_id',

																				product_id='$product_id',

																				total_quantity='$test',

																				created='$this->date_time'

																				");



			}

 			return true; 

 		}

	}	

	

	public function edit_stock_of_frenchise_product($product_id,$u_id,$product_stock){

		

		$product_id   =$this->xss_clean($product_id);

		$u_id   =$this->xss_clean($u_id);

		$product_stock   =$this->xss_clean($product_stock);

		

		$query_res =$this->db->query("Select id,product_name,product_stock from products where id=".$product_id);	

		

		if($product_stock == 0){

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Quantity Should be a Valid number!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	        header('Location: edit_frenchise_product_stock?id='.base64_encode($product_id).'&u_id='.base64_encode($u_id));

	        exit;

				

				//return true; 

			}

		

		if($query_res->num_rows == 0)

		{

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">No Product Available!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	        header('Location: edit_frenchise_product_stock?id='.base64_encode($product_id).'&u_id='.base64_encode($u_id));

	        exit;

		}

		else

			{

			$query_res_jpr = $query_res->fetch_assoc();

			

			

			if($product_stock >  $query_res_jpr['product_stock'])

			{

				$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">No Stock Available!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

	            header('Location: edit_frenchise_product_stock?id='.base64_encode($product_id).'&u_id='.base64_encode($u_id));

	            exit;

			}

			

			$query_res_hwe =$this->db->query("Select id,total_quantity from frenchise_product_stock where product_id=".$product_id." and 																								frenchise_id=".$u_id);

			$query_res_jpr_hwe = $query_res_hwe->fetch_assoc();

			

			$quantity1= $query_res_jpr['product_stock']-$product_stock; 

			$quantity2= $query_res_jpr_hwe['total_quantity']+$product_stock; 

			

			if($quantity2 < 0)

			{

				$_SESSION['failed']='<div class="alert alert-danger alert-dismissable">Quantity Should be valid Number!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

				 header('Location: edit_frenchise_product_stock?id='.base64_encode($product_id).'&u_id='.base64_encode($u_id));

				exit;

			}

			

			$query_fr_userres =$this->db->query("Select id,username from frenchise_users where id=".$u_id);

			$query_fr_userres_jpr = $query_fr_userres->fetch_assoc();

			

			if($product_stock < 0  )

				{

					$entry_type='Dr'; 

					$cmt = 'Debited';

					$comment = 'Stock '.$cmt.' By Admin To Frenchise'.$query_fr_userres_jpr['username'];

					$test = str_replace("-"," ",$product_stock);			

				

				$this->db->query("Insert into  frenchise_stock_record SET frenchise_id='$u_id',

																		   product_id='$product_id',

																           remainning='$quantity2',

																		   order_stock='$test',

																		   type='$entry_type',

																		   comment='$comment',

																		   created='$this->date_time'");

				

				$this->db->query("Update  frenchise_product_stock SET  total_quantity='$quantity2'

																		where frenchise_id='$u_id' And product_id='$product_id'");	                            

				}

				else

				{

					$entry_type='Cr'; 

					$cmt = 'Added';

					

					$comment = 'Stock '.$cmt.' By Admin To Frenchise '.$query_fr_userres_jpr['username'];

					

					$query =$this->db->query("Insert into  stock_record SET product_id='$product_id',

																remainning='$quantity1',

																order_stock='$product_stock',

																type='$entry_type',

																comment='$comment',

																created='$this->date_time'");

					

					$query1 =$this->db->query("update products SET  product_stock='$quantity1'

																	where id=$product_id");

					

					$query2 =$this->db->query("update product_stock SET total_quantity='$quantity1'

																		where product_id=$product_id");

					

					$query3 =$this->db->query("Insert into  frenchise_stock_record SET frenchise_id='$u_id', 

																						product_id='$product_id',

																						remainning='$quantity2',

																						order_stock='$product_stock',

																						type='$entry_type',

																						comment='$comment',

																						created='$this->date_time'");

				

					$this->db->query("Update  frenchise_product_stock SET  total_quantity='$quantity2'

																		where frenchise_id='$u_id' And product_id='$product_id'");	

					

				}

			

 			$_SESSION['success']='<div class="alert alert-success alert-dismissable "> Product Stock Edited Successfully! <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

	        header('Location: edit_frenchise_product_stock?id='.base64_encode($product_id).'&u_id='.base64_encode($u_id));

			exit;

 		

	  }

	}

	public function get_product_stock_record($table,$product_id,$order){



		$table = $this->xss_clean($table);

		$product_id = $this->xss_clean($product_id);

		$order = $this->xss_clean($order);



		$res = $this->db->query("SELECT * FROM $table where product_id=$product_id order by id $order");

		

		if($res->num_rows == 0 )

		{

			 $_SESSION['failed']='<div class="alert alert-danger alert-dismissable">No Product Available!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

			 header('Location: edit_product_stock?id='.$product_name);

	         exit;

		}

		else

		{

		return $res;

		}

	}

	public function get_fr_product_stock_record($table,$product_id,$fr_u_id,$order){



		$table = $this->xss_clean($table);

		$product_id = $this->xss_clean($product_id);

		$fr_u_id = $this->xss_clean($fr_u_id);

		

		$order = $this->xss_clean($order);

	//	echo "SELECT * FROM $table where product_id=$product_id And frenchise_id=$fr_u_id"; die;

		$res = $this->db->query("SELECT * FROM $table where product_id=$product_id And frenchise_id=$fr_u_id");

		

		if($res->num_rows == 0 )

		{

			 $_SESSION['failed']='<div class="alert alert-danger alert-dismissable">No Product Available!<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> </div>';

			 header('Location: edit_product_stock?id='.$product_name);

	         exit;

		}

		else

		{

		return $res;

		}

	}

	

	public function get_user_order_by_status($table,$status){



		$table =$this->xss_clean($table);

		$status   =$this->xss_clean($status);

		$res =$this->db->query("SELECT * FROM $table WHERE status='$status'");

	//	echo "SELECT * FROM $table WHERE status=$status";

    	$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

				$data_ar[] = $data;

			}

		}

		return $data_ar;

    	

    }

	

  public function user_order_history($table,$id){



		$table =$this->xss_clean($table);

		$id   =$this->xss_clean($id);

		$res =$this->db->query("SELECT * FROM $table WHERE order_history_id=$id");

    	$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){



				$data_ar[] = $data;

			}

		}

		return $data_ar;

    	

    }	

	public function update_user_order_status($table,$id,$status,$order_id){



		$table =$this->xss_clean($table);

		$status   =$this->xss_clean($status);

		$id   =$this->xss_clean($id);

		$order_id   =$this->xss_clean($order_id);

		

		if($status == 'Approved')

		{

			$res =$this->db->query("Update $table SET status='$status',updated='$this->date_time' WHERE order_id=$order_id");

			$res_jpr =$this->db->query("Update buy_product SET status='$status' WHERE order_history_id=$id");

			

			$get_user_order_history =$this->db->query("Select id,user_id,total_bv from $table WHERE order_id=$order_id");

			

			$get_user_order_history_res = $get_user_order_history->fetch_assoc();

			

			$get_user_history =$this->db->query("Select id,username,sponser_id,self_business,status from users WHERE id=".$get_user_order_history_res['user_id']);

			

			$get_user_history_res = $get_user_history->fetch_assoc();

			$self_business = $get_user_history_res['self_business'];

			$usr_status = $get_user_history_res['status'];

			$self_business_new = $self_business+$get_user_order_history_res['total_bv'];

			

			$type='';

			

			$this->db->query("Update users SET self_business='$self_business_new'  WHERE id='".$get_user_history_res['id']."'");

			

			$this->calculate_refers_user($get_user_history_res['username'],$get_user_history_res['sponser_id'],25,$get_user_order_history_res['total_bv'],$get_user_order_history_res['id']);

			

			$_SESSION['success']='<div class="alert alert-success alert-dismissable "> Order has been Approved Successfully! <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

			header('Location: order_history?status=Pending');

			exit;

		}

		else if($status == 'Rejected')

		{

			$res =$this->db->query("Update $table SET status='$status',updated='$this->date_time' WHERE order_id=$order_id");

			$res_jpr =$this->db->query("Update buy_product SET status='$status' WHERE order_history_id=$id");

			

			$get_buy_product =$this->db->query("Select product_id,quantity from buy_product WHERE order_history_id=$id");

			$get_buy_product_res = $get_buy_product->fetch_assoc();

			

			// Get Frenchise product stock

			$get_fr_product_stock =$this->db->query("Select id,frenchise_id,product_id,total_quantity from frenchise_product_stock WHERE id=".$get_buy_product_res['product_id']);

			

			if($get_fr_product_stock->num_rows > 0)

			{

			$get_fr_product_stock_res = $get_fr_product_stock->fetch_assoc();

			//print_r($get_fr_product_stock_res); die;

			

			//Update Frenchise Product Stock

			

			$updated_quantity = $get_buy_product_res['quantity'] + $get_fr_product_stock_res['total_quantity'];

			

			$update_fr_product_stock =$this->db->query("Update frenchise_product_stock SET total_quantity='$updated_quantity'  WHERE product_id=".$get_buy_product_res['product_id']." And frenchise_id=".$get_fr_product_stock_res['frenchise_id']);

			

			

			/*$update_fr_product_stock_record =$this->db->query("Insert into frenchise_stock_record SET 																							frenchise_id=".$get_fr_product_stock_res['frenchise_id'].",																	product_id=".$get_fr_product_stock_res['product_id'].",

																	remainning='$updated_quantity',

																	order_stock=".$get_buy_product_res['quantity'].",

																	type='Cr',

																	comment='Order Rejected Stock added to frenchise',

																	created='$this->date_time'

																	"); */

			

			$_SESSION['success']='<div class="alert alert-success alert-dismissable "> Order status has been updated  Successfully! <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

			header('Location: order_history?status=Pending');

			exit;

			}

		}

		else

		{

			$_SESSION['failed']='<div class="alert alert-danger alert-dismissable "> Eror Occured ! <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>';

			header('Location: order_history?status=Pending');

			exit;

		}

    	

    }	

	

	public function get_hold_amount_profit($table,$level,$status){



		$table =$this->xss_clean($table);

		$level   =$this->xss_clean($level);

		$status   =$this->xss_clean($status);

		

		$res =$this->db->query("SELECT sum(amount_rec) FROM $table WHERE level=$level And status='$status'");

				

    	$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){



				$data_ar[] = $data;

			}

		}

		return $data_ar;

    	

    }	

	public function get_clear_amount_profit($table,$level,$status){



		$table =$this->xss_clean($table);

		$level   =$this->xss_clean($level);

		$status   =$this->xss_clean($status);

		

		$res =$this->db->query("SELECT sum(amount_rec) FROM $table WHERE level=$level And status='$status'");

				

    	$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){



				$data_ar[] = $data;

			}

		}

		return $data_ar;

    	

    }	

	public function get_level_history($table,$level){



		$table =$this->xss_clean($table);

		$level   =$this->xss_clean($level);

	//	$status   =$this->xss_clean($status);

		

		$res =$this->db->query("SELECT * FROM $table WHERE level=$level");

				

    	$data_ar = array();

		if($res->num_rows > 0){

			while($data = $res->fetch_assoc()){

			

				$get_user_name = $this->db->query("SELECT id,name FROM users WHERE id=".$data['user_id']);

				

				$get_user_name_res = $get_user_name->fetch_assoc();

				

				$data['username'] = $get_user_name_res['name'];

				

				$data_ar[] = $data;

			}

		}

		return $data_ar;

    	

    }	

	

	public function auto_level_update(){



	//	$table =$this->xss_clean($table);

		

		$res =$this->db->query("SELECT id,username,level_value FROM users where status='Active'");

				

    	$data_ar = array();

		

		if($res->num_rows > 0){

			

			$per_cent90_res = 30000*90/100;

			$per_cent10_res = 30000*10/100;

			$per_cent80_res = 30000*80/100;

			$per_cent20_res = 30000*20/100;

			$per_cent70_res = 30000*70/100;

			$per_cent30_res = 30000*30/100;

			$per_cent60_res = 30000*60/100;

			$per_cent40_res = 30000*40/100;

			

			while($data = $res->fetch_assoc()){

				

				$username_hwe = $data['username'];

				$level_value = $data['level_value'];

				

			$get_users = $this->db->query("SELECT id,username,sponser_id FROM users where sponser_id='".$username_hwe."'");

		 

			if($get_users->num_rows == 3 )

			{	

				$get_sum_business = $this->db->query("SELECT username FROM users where sponser_id='".$username_hwe."' And team_business >= '$per_cent90_res'");

			

				if($get_sum_business->num_rows > 0)

				{

				$user1 = $get_sum_business->fetch_assoc()['username'];

				

				$get_res = $this->db->query("SELECT sum(team_business) as total FROM users where sponser_id='".$username_hwe."' And username !='$user1'");

				

				 $other_total = $get_res->fetch_assoc()['total'];



					if($other_total >= $per_cent10_res){

						

						$this->db->query("UPDATE users SET level1_status='Yes' WHERE username = '$username_hwe'");

					

					}

				}

				

				/// get 80 20 ratio

				

				$get_sum_business = $this->db->query("SELECT * FROM users where sponser_id='".$username_hwe."' And team_business >= '$per_cent80_res'");

				if($get_sum_business->num_rows > 0)

				{

				$user1 = $get_sum_business->fetch_assoc()['username'];

				

				$get_res = $this->db->query("SELECT sum(team_business) as total FROM users where sponser_id='".$username_hwe."' And username !='$user1'");



				 $other_total = $get_res->fetch_assoc()['total'];



					if($other_total >= $per_cent20_res){

						

						

						$this->db->query("UPDATE users SET level2_status='Yes' WHERE username = '$username_hwe'");

					

					}

				}

				

				/// get 70 30 ratio

				

				$get_sum_business = $this->db->query("SELECT * FROM users where sponser_id='".$username_hwe."' And team_business >= '$per_cent70_res'");

				if($get_sum_business->num_rows > 0)

				{

				$user1 = $get_sum_business->fetch_assoc()['username'];

				

				$get_res = $this->db->query("SELECT sum(team_business) as total FROM users where sponser_id='".$username_hwe."' And username !='$user1'");



				 $other_total = $get_res->fetch_assoc()['total'];



					if($other_total >= $per_cent30_res){

						

						$this->db->query("UPDATE users SET level3_status='Yes' WHERE username = '$username_hwe'");

					

					}

				}

				

				/// get 60 40 ratio

				

				$get_sum_business = $this->db->query("SELECT * FROM users where sponser_id='".$username_hwe."' And team_business >= '$per_cent60_res'");

				if($get_sum_business->num_rows > 0)

				{

				$user1 = $get_sum_business->fetch_assoc()['username'];

				

				$get_res = $this->db->query("SELECT sum(team_business) as total FROM users where sponser_id='".$username_hwe."' And username !='$user1'");



				 $other_total = $get_res->fetch_assoc()['total'];



					if($other_total >= $per_cent40_res){

						

					 	$this->db->query("UPDATE users SET level4_status='Yes' WHERE username = '$username_hwe'");

					

					}

				}

				

			}

		//	print_r($get_users_res);	

				$data_ar[] = $data;

			}

		}

		return $data_ar;

    	

    }

	

	public function auto_clear_hold_amount(){



	//	$table =$this->xss_clean($table);

		

		$res =$this->db->query("SELECT id,sponser_id,level,amount_rec,user_id FROM refer_earnings where status='Hold'");

				

    	$data_ar = array();

		

		if($res->num_rows > 0){

			

			while($data = $res->fetch_assoc()){

				

				if($data['level'] >= 3){

					$col = "level1_status";

				}

				elseif($data['level'] >= 6){

					$col = "level2_status";

				}

				elseif($data['level'] >= 11){

					$col = "level3_status";

				}

				elseif($data['level'] >= 16){

					$col = "level4_status";

				}

				else{

					

				}

			

			$get_users_by_id = $this->db->query("SELECT id,username,$col FROM users where id='".$data['sponser_id']."' And status='Active'");

		

			$get_users_by_id_res = $get_users_by_id->fetch_assoc();

			

			

				

			if($get_users_by_id_res[$col] == 'Yes')

			{	

				$this->db->query("Update refer_earnings  SET status='Clear',updated='$this->date_time'  where id='".$data['id']."'");	

				

				$this->db->query("Update users SET earnings=earnings+'".$data['amount_rec']."',earned=earned+'".$data['amount_rec']."' where username='".$get_users_by_id_res['username']."'");	

				

				$get_users_for_wallet =  $this->db->query("select username,earnings from users where username='".$get_users_by_id_res['username']."'");	

				

				$get_users_for_wallet_res = $get_users_for_wallet->fetch_assoc();

				

				$get_user_by_refer_user_id=$this->db->query("select username from users where id='".$data['user_id']."'");	

				$get_user_by_refer_user_id_res = $get_user_by_refer_user_id->fetch_assoc();

					//$data['user_id']

				

				$u_name = $get_users_for_wallet_res['username'];

				$remaning = $get_users_for_wallet_res['earnings'];

				$amount =$data['amount_rec'];

				$comment = 'Level Income from User #'.$get_user_by_refer_user_id_res['username'].' Level'.$data['level'];

				$type = 'Cr.';

				$wallet = 'Main';

				

			}

				

			}

			$this->db->query("Insert into wallet SET        username='$u_name',

															remaning='$remaning',

															amount='$amount',

															comment='$comment',

															wallet='$wallet',

															date_time='$this->date_time'

															");	

			}

		return true;

    	

    }	

	public function get_sum_for_invoice($table,$col,$value,$term){



		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$term = $this->xss_clean($term);

		

	    $res = $this->db->query("SELECT sum($term)  FROM $table where $col=$value");

		$data_ar = array();

		if($res->num_rows > 0){

		$data = $res->fetch_assoc();

				$data_ar[] = $data;

			}

		

		return $data_ar;

	}

	public function get_main_dashboard_sum_items($table,$col,$value){



		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$res = $this->db->query("SELECT id FROM $table WHERE $col = '$value'");

    	$sum = $res->num_rows;

    	return round($sum,2);

    }

	public function get_other_dashboard_sum_items($table,$col,$value,$col2,$value2){



		$table = $this->xss_clean($table);

		$col = $this->xss_clean($col);

		$value = $this->xss_clean($value);

		$col2 = $this->xss_clean($col2);

		$value2 = $this->xss_clean($value2);

		

		$res = $this->db->query("SELECT id FROM $table WHERE $col = '$value' and $col2 = '$value2'");

    	$sum = $res->num_rows;

    	return round($sum,2);

    }



	public function convert_number($number){



		$number = $this->xss_clean($number);



        if (($number < 0) || ($number > 999999999)) {



            throw new Exception("Number is out of range");  



        }



        $giga = floor($number / 1000000);



        // Millions (giga)



        $number -= $giga * 1000000;



        $kilo = floor($number / 1000);



        // Thousands (kilo)



        $number -= $kilo * 1000;



        $hecto = floor($number / 100);



        // Hundreds (hecto)



        $number -= $hecto * 100;



        $deca = floor($number / 10);



        // Tens (deca)



        $n = $number % 10;



        // Ones



        $result = "";



        if ($giga) {



            $result .= $this->convert_number($giga) .  "Million";



        }



        if ($kilo) {



            $result .= (empty($result) ? "" : " ") .$this->convert_number($kilo) . " Thousand";



        }



        if ($hecto) {



            $result .= (empty($result) ? "" : " ") .$this->convert_number($hecto) . " Hundred";



        }



        $ones = array("", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eightteen", "Nineteen");



        $tens = array("", "", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy", "Eigthy", "Ninety");



        if ($deca || $n) {



            if (!empty($result)) {

                $result .= " ";

            }



            if ($deca < 2) {

                $result .= $ones[$deca * 10 + $n];

            } else {

                $result .= $tens[$deca];

                if ($n) {

                    $result .= " " . $ones[$n];

                }

            }

        }



        if (empty($result)) {

            $result = "zero";

        }



        return $result;

    }

	

	public function auto_update_rank(){



	//	$table =$this->xss_clean($table);

		

		$res =$this->db->query("SELECT id,username,self_business,performance_rank FROM users where status='Active'");

				

    	$data_ar = array();

		

		if($res->num_rows > 0){

			

			$per_cent60_res = 500000*60/100;

			$per_cent40_res = 500000*40/100;

			

			

			while($data = $res->fetch_assoc()){

			

				$username_hwe = $data['username'];

				$self_business = $data['self_business'];

			 	$performance_rank = $data['performance_rank']+1;

				

			if($performance_rank == 1)

			{

				$get_users = $this->db->query("SELECT id,username,sponser_id FROM users where sponser_id='".$username_hwe."'");



				if($self_business >= 30000 )

					{

					if($get_users->num_rows >= 2 )

					{	

					 	$get_sum_business = $this->db->query("SELECT username FROM users where sponser_id='".$username_hwe."' And team_business >= '$per_cent60_res'");



						if($get_sum_business->num_rows > 0)

						{

							$user1 = $get_sum_business->fetch_assoc()['username'];



							$get_res = $this->db->query("SELECT sum(team_business) as total FROM users where sponser_id='".$username_hwe."' And username !='$user1'");



							$other_total = $get_res->fetch_assoc()['total'];



							if($other_total >= $per_cent40_res)

							{



								$this->db->query("UPDATE users SET performance_rank='1' WHERE username = '$username_hwe'");



							}

						}

					}



				}

			}

		else if($performance_rank == 2)

		{

			$get_users = $this->db->query("SELECT id,username,sponser_id FROM users where sponser_id='".$username_hwe."' And performance_rank = '1'");



			if($self_business >= 75000 )

			{

				if($get_users->num_rows >= 2 )

					{	

						$this->db->query("UPDATE users SET performance_rank='2' WHERE username = '$username_hwe'");

						

					}

			}

		

		}

		else if($performance_rank == 3)

		{

			$get_users = $this->db->query("SELECT id,username,sponser_id FROM users where sponser_id='".$username_hwe."' And performance_rank = '1'");



			if($get_users->num_rows >= 1)

			{

				$get_users_hwe = $this->db->query("SELECT id,username,sponser_id FROM users where sponser_id='".$username_hwe."' And performance_rank = '2'");

				

				if($get_users->num_rows >= 2)

				{

					if($self_business >= 150000 )

					{

						if($get_users->num_rows >= 2 )

							{	

								$this->db->query("UPDATE users SET performance_rank='3' WHERE username = '$username_hwe'");

							}

					}

				}

			}

		}

		else if($performance_rank == 4)

		{

			$get_users = $this->db->query("SELECT id,username,sponser_id FROM users where sponser_id='".$username_hwe."' And performance_rank = '1'");



			if($get_users->num_rows >= 1)

			{

				$get_users_hwe = $this->db->query("SELECT id,username,sponser_id FROM users where sponser_id='".$username_hwe."' And performance_rank = '3'");

				

				if($get_users->num_rows >= 2)

				{

					if($self_business >= 300000 )

					{

						if($get_users->num_rows >= 2 )

							{	

								$this->db->query("UPDATE users SET performance_rank='3' WHERE username = '$username_hwe'");

							}

					}

				}

			}

		}		

				

		}

			$data_ar[] = $data;

	  }

		return $data_ar; 

	}

	public function add_car_fund(){



		$first_date = $this->date_time;

		$sec_date = date("Y-m-d H:i:s", strtotime('-7 days'));

		

		$res =$this->db->query("SELECT sum(total_bv) as total_bv_sum FROM order_history where updated between '$sec_date' And '$first_date' and status='Approved'");

		

		$res_hwe = $res->fetch_assoc();

		$total_bv_sum = $res_hwe['total_bv_sum'];

			

		$car_fund_sd = $total_bv_sum * 2/100;			

		$car_fund_nd = $total_bv_sum * 1.25/100;

		$car_fund_ed = $total_bv_sum * 1/100;			

		$car_fund_ba = $total_bv_sum * .75/100;				

			

		$users_hwe =$this->db->query("SELECT count(id) as users_count_sd FROM users where status='Active' and performance_rank='2'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_sd =$users_hwe_res['users_count_sd']; 

		if($users_count_sd > 0)

		{

			$car_fund_sd_hwe = round($car_fund_sd/$users_count_sd,2);	

		}

		else

		{

			$car_fund_sd_hwe = 0;

		}

		

		$query1= $this->db->query("select id,username,earnings from users where performance_rank='2' and status='Active'");

			if($query1->num_rows > 0)

			{

				while($users_res=$query1->fetch_object())

				{

					$this->db->query("Insert into wallet SET    username='$users_res->username',

																remaning='$users_res->earnings',

																amount='$car_fund_sd_hwe',

																comment='Car Fund Income of performance rank #2 ',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_sd_hwe' 

																		     where

																			 id='$users_res->id' 

																			 ");

					

					$this->db->query("Insert into car_fund SET  user_id='$users_res->id',

																amount='$car_fund_sd_hwe',

																rank='2',

																created='$this->date_time'

															    ");

					

				}

			}

		

		$users_hwe =$this->db->query("SELECT count(id) as users_count_nd FROM users where status='Active' and  performance_rank='3'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_nd =$users_hwe_res['users_count_nd']; 

		if($users_count_nd > 0)

		{

			$car_fund_nd_hwe = round($car_fund_nd/$users_count_nd,2);

		}

		else

		{

			$car_fund_nd_hwe=0;

		}

			

		$query2=$this->db->query("select id,username,earnings from users where performance_rank='3' and status='Active'");

			if($query2->num_rows > 0)

			{

				while($query2_res = $query2->fetch_object())

				{

				    $this->db->query("Insert into wallet SET    username='$query2_res->username',

																remaning='$query2_res->earnings',

																amount='$car_fund_nd_hwe',

																comment='Car Fund Income of performance rank #3',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_nd_hwe'

																			where

																			id='$query2_res->id'

																			");

					

					$this->db->query("Insert into car_fund SET user_id='$query2_res->id',

															   amount='$car_fund_nd_hwe',

															   rank='3',

															   created='$this->date_time'

																");

					

				}

			}

			

		$users_hwe =$this->db->query("SELECT count(id) as users_count_ed FROM users where  status='Active' and  performance_rank='4'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_ed =$users_hwe_res['users_count_ed']; 

		

		if($users_count_ed > 0)

		{

			$car_fund_ed_hwe = round($car_fund_ed/$users_count_ed,2);

		}

		else

		{

			$car_fund_ed_hwe =0;

		}

		

		$query3 = $this->db->query("select id,username,earnings from users where performance_rank='4' and status='Active'");

			if($query3->num_rows > 0)

			{

				while($query3_res = $query3->fetch_object())

				{

					

					$this->db->query("Insert into wallet SET    username='$query3_res->username',

																remaning='$query3_res->earnings',

																amount='$car_fund_ed_hwe',

																comment='Car Fund Income of performance rank #4',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_ed'  

																			 where

																			 id='$query3_res->id' 

																			 ");

					

					$this->db->query("Insert into car_fund SET 	user_id='$query3_res->id',

																amount='$car_fund_ed_hwe',

																rank='4',

																created='$this->date_time'

																");

					

				}

			}

			

		$users_hwe =$this->db->query("SELECT count(id) as users_count_ba FROM users where status='Active' and  performance_rank='5'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_ba =$users_hwe_res['users_count_ba']; 

		

		if($users_count_ba > 0)

		{

			$car_fund_ba_hwe = round($car_fund_ba / $users_count_ba,2);	

		}

		else

		{

			$car_fund_ba_hwe =0;

		}

			

		$query4 = $this->db->query("select id,username,earnings from users where performance_rank='5' and status='Active'");

			if($query4->num_rows > 0)

			{

				while($query4_res = $query4->fetch_object())

				{

					

					$this->db->query("Insert into wallet SET    username='$query4_res->username',

																remaning='$query4_res->earnings',

																amount='$car_fund_ba_hwe',

																comment='Car Fund Income of performance rank #5',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_ba'  

																			 where

																			 id='$query4_res->id' And

																			 status='Active' And

																			 performance_rank='5'

																			 ");

		

					$this->db->query("Insert into car_fund SET user_id='$query4_res->id',

															   amount='$car_fund_ba_hwe',

															   rank='5',

															   created='$this->date_time'

															   ");

				}

			}

																				 

		$add_car_fund_report = $this->db->query("Insert into car_fund_report SET total_turn_over='$total_bv_sum',

																				 elg_u_rank2 = '$users_count_sd',

																			 	 elg_u_rank3 = '$users_count_nd',

																				 elg_u_rank4 = '$users_count_ed',

																				 elg_u_rank5 = '$users_count_ba',

																				 u_bonus_rank2 = '$car_fund_sd_hwe',

																				 u_bonus_rank3 = '$car_fund_nd_hwe',

																				 u_bonus_rank4 = '$car_fund_ed_hwe',

																				 u_bonus_rank5 = '$car_fund_ba_hwe',

																				 fund_type='car',

																				 created='$this->date_time'

																				 ");

	}



	public function add_travel_fund(){



		$first_date = $this->date_time;

		$sec_date = date("Y-m-d H:i:s", strtotime('-7 days'));

		

		$res =$this->db->query("SELECT sum(total_bv) as total_bv_sum FROM order_history where updated between '$sec_date' And '$first_date' and status='Approved'");

		

		$res_hwe = $res->fetch_assoc();

		$total_bv_sum = $res_hwe['total_bv_sum'];

			

	//	$car_fund_sd = $total_bv_sum * 2/100;			

		$car_fund_nd = $total_bv_sum * 2.50/100;

		$car_fund_ed = $total_bv_sum * 1.50/100;			

		$car_fund_ba = $total_bv_sum * 1/100;				

			

		$users_hwe =$this->db->query("SELECT count(id) as users_count_nd FROM users where status='Active' and  performance_rank='3'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_nd =$users_hwe_res['users_count_nd']; 

		if($users_count_nd > 0)

		{

			$car_fund_nd_hwe = round($car_fund_nd/$users_count_nd,2);

		}

		else

		{

			$car_fund_nd_hwe=0;

		}

			

		$query2=$this->db->query("select id,username,earnings from users where performance_rank='3' and status='Active'");

			if($query2->num_rows > 0)

			{

				while($query2_res = $query2->fetch_object())

				{

				    $this->db->query("Insert into wallet SET    username='$query2_res->username',

																remaning='$query2_res->earnings',

																amount='$car_fund_nd_hwe',

																comment='Travel Fund Income of performace Income #3',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_nd_hwe'

																			where

																			id='$query2_res->id' 

																			");

					

					$this->db->query("Insert into travel_fund SET user_id='$query2_res->id',

															   amount='$car_fund_nd_hwe',

															   rank='3',

															   created='$this->date_time'

																");

					

				}

			}

			

		$users_hwe =$this->db->query("SELECT count(id) as users_count_ed FROM users where status='Active' and  performance_rank='4'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_ed =$users_hwe_res['users_count_ed']; 

		

		if($users_count_ed > 0)

		{

			$car_fund_ed_hwe = round($car_fund_ed/$users_count_ed,2);

		}

		else

		{

			$car_fund_ed_hwe =0;

		}

		

		$query3 = $this->db->query("select id,username,earnings from users where performance_rank='4' and status='Active'");

			if($query3->num_rows > 0)

			{

				while($query3_res = $query3->fetch_object())

				{

					$this->db->query("Insert into wallet SET    username='$query3_res->username',

																remaning='$query3_res->earnings',

																amount='$car_fund_ed_hwe',

																comment='Travel Fund Income of Performance rank #4',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_ed_hwe'  

																			 where

																			 id='$query3_res->id'

																			 ");

					

					$this->db->query("Insert into travel_fund SET 	user_id='$query3_res->id',

																amount='$car_fund_ed_hwe',

																rank='4',

																created='$this->date_time'

																");

					

				}

			}

			

		$users_hwe =$this->db->query("SELECT count(id) as users_count_ba FROM users where status='Active' and performance_rank='5'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_ba =$users_hwe_res['users_count_ba']; 

		

		if($users_count_ba > 0)

		{

			$car_fund_ba_hwe = round($car_fund_ba / $users_count_ba,2);	

		}

		else

		{

			$car_fund_ba_hwe =0;

		}

			

		$query4 = $this->db->query("select id,username,earnings from users where performance_rank='5' and status='Active'");

			if($query4->num_rows > 0)

			{

				while($query4_res = $query4->fetch_object())

				{

					$this->db->query("Insert into wallet SET    username='$query4_res->username',

																remaning='$query4_res->earnings',

																amount='$car_fund_ba_hwe',

																comment='Travel	Fund Income of performance rank #5',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_ba_hwe'  

																			 where

																			 id='$query4_res->id'

																			 ");

		

					

					$this->db->query("Insert into travel_fund SET user_id='$query4_res->id',

															   amount='$car_fund_ba_hwe',

															   rank='5',

															   created='$this->date_time'

															   ");

					

				}

			}

																				 

		$add_car_fund_report = $this->db->query("Insert into car_fund_report SET total_turn_over='$total_bv_sum',

																				 elg_u_rank3 = '$users_count_nd',

																				 elg_u_rank4 = '$users_count_ed',

																				 elg_u_rank5 = '$users_count_ba',

																				 u_bonus_rank3 = '$car_fund_nd_hwe',

																				 u_bonus_rank4 = '$car_fund_ed_hwe',

																				 u_bonus_rank5 = '$car_fund_ba_hwe',

																				 fund_type='travel',

																				 created='$this->date_time'

																				 ");

	

	}

	public function add_company_share_harder_income(){



		$first_date = $this->date_time;

		$sec_date = date("Y-m-d H:i:s", strtotime('-7 days'));

		

		$res =$this->db->query("SELECT sum(total_bv) as total_bv_sum FROM order_history where updated between '$sec_date' And '$first_date' and status='Approved'");

		

		$res_hwe = $res->fetch_assoc();

		$total_bv_sum = $res_hwe['total_bv_sum'];

			

		$car_fund_nd = $total_bv_sum * 5/100;

		$car_fund_ed = $total_bv_sum * 3/100;			

		$car_fund_ba = $total_bv_sum * 2/100;				

			

		$users_hwe =$this->db->query("SELECT count(id) as users_count_nd FROM users where status='Active' and performance_rank='3'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_nd =$users_hwe_res['users_count_nd']; 

		

		if($users_count_nd > 0)

		{

			$car_fund_nd_hwe = round($car_fund_nd/$users_count_nd,2);

		}

		else

		{

			$car_fund_nd_hwe=0;

		}

			

		$query2=$this->db->query("select id,username,earnings from users where performance_rank='3' and status='Active'");

			

		if($query2->num_rows > 0)

			{

				while($query2_res = $query2->fetch_object())

				{

				   

					$this->db->query("Insert into wallet SET    username='$query2_res->username',

																remaning='$query2_res->earnings',

																amount='$car_fund_nd_hwe',

																comment='Company Share Income of performance rank #3',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_nd_hwe'

																			where

																			id='$query2_res->id'

																			");

					

					$this->db->query("Insert into company_harder_income SET user_id='$query2_res->id',

																		   amount='$car_fund_nd_hwe',

																		   rank='3',

																		   created='$this->date_time'

																			");

					

				}

			}

			

		$users_hwe =$this->db->query("SELECT count(id) as users_count_ed FROM users where status='Active' and  performance_rank='4'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_ed =$users_hwe_res['users_count_ed']; 

		

		if($users_count_ed > 0)

		{

			$car_fund_ed_hwe = round($car_fund_ed/$users_count_ed,2);

		}

		else

		{

			$car_fund_ed_hwe =0;

		}

		

		$query3 = $this->db->query("select id,username,earnings from users where performance_rank='4' and status='Active'");

			if($query3->num_rows > 0)

			{

				while($query3_res = $query3->fetch_object())

				{

					

					$this->db->query("Insert into wallet SET    username='$query3_res->username',

																remaning='$query3_res->earnings',

																amount='$car_fund_ed_hwe',

																comment='Company Share Income of performance rank #4',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_ed'  

																			 where

																			 id='$query3_res->id' And

																			 performance_rank='4' And 

																			 status='Active'

																			 ");

					

					$this->db->query("Insert into company_harder_income SET 	user_id='$query3_res->id',

																				amount='$car_fund_ed_hwe',

																				rank='4',

																				created='$this->date_time'

																				");

					

				}

			}

			

		$users_hwe =$this->db->query("SELECT count(id) as users_count_ba FROM users where status='Active' and  performance_rank='5'");	

		$users_hwe_res = $users_hwe->fetch_assoc();

		$users_count_ba =$users_hwe_res['users_count_ba']; 

		

		if($users_count_ba > 0)

		{

			$car_fund_ba_hwe = round($car_fund_ba / $users_count_ba,2);	

		}

		else

		{

			$car_fund_ba_hwe =0;

		}

			

		$query4 = $this->db->query("select id,username,earnings from users where performance_rank='5' and status='Active'");

			if($query4->num_rows > 0)

			{

				while($query4_res = $query4->fetch_object())

				{

					$this->db->query("Insert into wallet SET    username='$query4_res->username',

																remaning='$query4_res->earnings',

																amount='$car_fund_ba_hwe',

																comment='Company Share Income of performance rank #5',

																type='Cr',

																wallet='Main',

																date_time='$this->date_time'

															    ");

					

					$updt_users_earnigs = $this->db->query("Update users SET earnings = earnings + '$car_fund_ba_hwe'  

																			 where

																			 id='$query4_res->id' 

																			 ");

		

					$this->db->query("Insert into company_harder_income SET user_id='$query4_res->id',

																		   amount='$car_fund_ba_hwe',

																		   rank='5',

																		   created='$this->date_time'

																		   ");

					

				}

			}

																				 

		$add_car_fund_report = $this->db->query("Insert into car_fund_report SET total_turn_over='$total_bv_sum',

																				 elg_u_rank3 = '$users_count_nd',

																				 elg_u_rank4 = '$users_count_ed',

																				 elg_u_rank5 = '$users_count_ba',

																				 u_bonus_rank3 = '$car_fund_nd_hwe',

																				 u_bonus_rank4 = '$car_fund_ed_hwe',

																				 u_bonus_rank5 = '$car_fund_ba_hwe',

																				 fund_type='company_share',

																				 created='$this->date_time'

																				 ");

	

	}

	

	

 public function updateUserbyadmin($user,$name,$username,$earnings,$pass,$amount,$mobile,$email,$txnpass)

	 {

		$user =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$user)));

		$name =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$name)));

		$username =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$username)));

		$earnings =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$earnings)));

		$pass =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$pass)));

		$amount =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$amount)));

		$e_amount =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$e_amount)));

		$main_wallet =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$main_wallet)));

		$mobile =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$mobile)));

		$email =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db ,$email)));

		$with_status =htmlspecialchars(strip_tags(mysqli_real_escape_string($this->db,$with_status)));

		

	 	$this->db->query("UPDATE users SET name='$name', password='$pass', mobile='$mobile', email ='$email', sec_code='$txnpass' WHERE id='$user'");



		$ip =$this->getUserIpAddr();



		$order_id =234567546;



		$now =time();

		return TRUE;

  }

  public function add_admin_bank_details($upi,$ac_holder,$ifsc_code,$account,$bank)

  {

		$upi = $this->xss_clean($upi);

		$ac_holder = $this->xss_clean($ac_holder);

		$ifsc_code = $this->xss_clean($ifsc_code);

		$account = $this->xss_clean($account);

		$bank = $this->xss_clean($bank);



		$res = $add_bank = $this->db->query("INSERT into admin_banks SET upi='$upi',

																		 ac_holder='$ac_holder	',

																		 ifsc='$ifsc_code',

																		 account='$account',

																		 bank='$bank'

																		 ");

		if($res){



			header('Location: add_bank.php');

			return TRUE;

		   exit;

		}														  

  }

  public function edit_admin_bank_details($id,$upi,$ac_holder,$ifsc_code,$account,$bank)

  {

		$id = $this->xss_clean($id);

		$upi = $this->xss_clean($upi);

		$ac_holder = $this->xss_clean($ac_holder);

		$ifsc_code = $this->xss_clean($ifsc_code);

		$account = $this->xss_clean($account);

		$bank = $this->xss_clean($bank);



		$res = $add_bank = $this->db->query("Update admin_banks SET      upi='$upi',

																		 ac_holder='$ac_holder	',

																		 ifsc='$ifsc_code',

																		 account='$account',

																		 bank='$bank'

																		 where

																		 id=''

																		 ");

		if($res){



			header('Location: add_bank.php');

			return TRUE;

		   exit;

		}														  

  }

  public function update_payment_status($id,$status)

  {

		$id = $this->xss_clean($id);

		$status = $this->xss_clean($status);

		

		$res = $add_bank = $this->db->query("Update payment_request  SET   status='$status'

																			where

																			id='$id'

																			");

			if($res){



			header('Location: waiting_request_payments.php');

			return TRUE;

		   exit;

		}														  

  }


















/// DZONE WORK BY RAVI

// get data from table

public function get($table){

	$table = $this->xss_clean($table);

	$res   = $this->db->query("SELECT * FROM $table");

	$data_ar = array();

	if($res->num_rows > 0){

		while($data = $res->fetch_assoc()){

			$data_ar[] = $data;

		}

	}

	return $data_ar;

}




// upload logo 

public function addLogo(){

	if($_FILES['image']['name']!=''){		

	   $fileinfo = @getimagesize($_FILES["image"]["tmp_name"]);
		
	 /*  $width = $fileinfo[0];

	   $height = $fileinfo[1];

	   if($width > 500 || $height > 300)

	   {

		   $_SESSION['failed'] ='<div class="alert alert-danger">Image dimension should be within  350 X 150</div>';

		   header('Location: event_image');

		   exit;

	   } */
	   
		$name =time().$this->randomCode(5);

	   $new_name =$name;
	   $ext  =strstr($_FILES["image"]["name"],".");
	   $new_name =$name.$ext;
	 
	   if(move_uploaded_file($_FILES["image"]["tmp_name"],"image/logo/".$new_name)){
	
			$res =$this->db->query("UPDATE settings SET logo='$new_name'");

			if($res){

				header('Location: upload_logo.php');

				return TRUE;

			   exit;

			}

		}
	
	   

	}	

}



}

$functions =new Functions();



?>