<?php

   include("config.php");
    class Functions 
	{
		public $error = array();
		public $succ = array();
		public function __construct(){
			   $db = new Config();
			}
			
	   public function admin_login($username,$password){
				$user = mysql_real_escape_string($username);
				$pass = sha1($password);
				$sql = "SELECT * FROM `admin_user` WHERE (admin_uname = '$user') AND admin_password = '$pass'";
				$res = mysql_query($sql);
				if(mysql_num_rows($res) > 0){
					$user_data = mysql_fetch_assoc($res);
					           
							   $this->start_session();
							   $_SESSION['logged_in'] = true;
							   $_SESSION['uname'] = $user_data['admin_uname'];
							   //echo $_SESSION['uname']. $_SESSION['email'];exit;
							   ob_start(); 
                               error_reporting(E_ALL);
                               ini_set('display_errors', 'On');
                               header("Location: dashboard.php");
                               ob_flush();
							   //echo 'hi';
							}
					else{
						  
						   	$this->error[] = "<span style='color: #F70707;'>ERROR: Your Login Info is Wrong !</span><br /><br />";
							 return FALSE;
						}
				}
			public function changePass($user, $password){
				$res = mysql_query("UPDATE admin_user SET `admin_password` = '$password' WHERE admin_uname = '$user'");
			if($res)
			return TRUE;
			}
			public function start_session(){
			   return session_start();
			}
			public function end_session(){
			   return session_destroy();
			}
			public function authenticate(){
				if($_SESSION['logged_in'])
				
				   return TRUE;
				   else
				   return FALSE;
				
			}
			public function addCat($category){
				$sql = "INSERT INTO categories (`category_name`) VALUES ('$category')";
				$res = mysql_query($sql);
				if($res)
				return TRUE;
			}
			public function display_cat(){
				$res = mysql_query("SELECT * FROM categories ORDER BY category_name ASC");
				$str = '';
				if(mysql_num_rows($res) > 0){
					while($data = mysql_fetch_assoc($res)){
						$str .= 
						 '<a href="products.php?category_id='.$data['id'].'"><li>'.$data['category_name'].'</li></a>';
					}
				}
				return $str;
			}
			public function catList(){
				$res = mysql_query("SELECT * FROM categories ORDER BY category_name ASC");
				$str = '';
					$str .= 
					'<table class="newslist" cellspacing="0">
					  <th>ID</th>
					  <th>Category Name</th>
					  <th>Actions</th>
					';
					if(mysql_num_rows($res) > 0){
					while($data = mysql_fetch_assoc($res)){
						$str .= '<tr>
						  <td>'.$data['id'].'</td>
						  <td>'.$data['category_name'].'</td>
						  <td><a href="dashboard.php?page=products&edit_category='.$data['id'].'">Edit</a> / 
						  <a href="dashboard.php?page=products&delete_category='.$data['id'].'" onClick="return conf();">Delete</a></td>
						  </tr>
						';
					}
				}
				$str .='</table>';
				return $str;
			}
			public function addProduct($p_cat, $p_sku, $p_name, $images, $prd_desc, $link, $price, $homepage, $stock_status){
				$sql = "INSERT INTO products (`c_id`, `prd_sku`, `prd_name`, `prd_imgs`, `prd_desc`, `prd_link`, `price`, `homepage`,`prd_stock`,`date`) VALUES
				 ('$p_cat', '$p_sku', '$p_name', '$images', '$prd_desc', '$link', '$price', '$homepage', '$stock_status', now())";
				$res = mysql_query($sql);
				if($res)
				return TRUE;
			}
			public function product_cat(){
				$sql = "SELECT * FROM categories ORDER BY category_name ASC";
				$res = mysql_query($sql);
				$str = '';
				if(mysql_num_rows($res) > 0){
					while($data = mysql_fetch_assoc($res)){
						$str .= '
						<option value="'.$data['id'].'">'.$data['category_name'].'</option>
						';
					}
				}
				return $str;
			}
			
			public function product_category($id){
				$sql = "SELECT * FROM categories ORDER BY category_name ASC";
				$res = mysql_query($sql);
				$str = '';
				if(mysql_num_rows($res) > 0){
					while($data = mysql_fetch_assoc($res)){
						$selected = '';
						if($data['id'] == $id){
							$selected = 'selected="selected"';
						}
						$str .= '
						<option value="'.$data['id'].'"'.$selected.'>'.$data['category_name'].'</option>
						';
					}
				}
				return $str;
			}
			
			public function product_display($home){
				if ($home == 'home') {
				    $sql = "SELECT * FROM products WHERE `homepage` = '1' ORDER BY id desc";
				}else {
					$sql = "SELECT * FROM products ORDER BY id desc";
				}
				$res = mysql_query($sql);
				$str = '<ul>';
				if(mysql_num_rows($res) > 0){
					while($data = mysql_fetch_assoc($res)){
						$c_id = $data['c_id'];
						$res_c = mysql_query("SELECT * FROM categories WHERE `id` = '$c_id'");
						$data_c = mysql_fetch_assoc($res_c);
						$image = explode('|', $data['prd_imgs']);
						$name = $data['prd_name'];
      					$name_sh = strlen($name) > 20 ? substr($name,0,20)."..." : $name;
						$str .= 
						 '<li class="product-col">
              <div class="product-col-img">
                <a href="product_detail.php?id='.$data['id'].'"><img src="products/'.$image[0].'" /></a>
               </div>
               <div class="product-content">
                  <div class="product-name"><h4>'.$name_sh.'</h4></div>
            	  <div class="product-category"><h4><a href="products.php?category_id='.$data_c['id'].'">'.$data_c['category_name'].'</a></h4></div>
            	  
                  <div class="product-bottom-content">
                     <div class="product-price"><i class="fa fa-usd"></i> '.$data['price'].'</div>
                     <div class="view-details"><a href="product_detail.php?id='.$data['id'].'" class="button">View Details</a></div>
                  </div>
               </div>
            </li>
						 ';
					}
				}
				$str .= '</ul>';
				return $str;
			}
			public function ProductdisplayByCat($id){
				    $sql = "SELECT * FROM products WHERE `c_id` = '$id' ORDER BY id desc";
				$res = mysql_query($sql);
				$str = '<ul>';
				if(mysql_num_rows($res) > 0){
					while($data = mysql_fetch_assoc($res)){
						$c_id = $data['c_id'];
						$res_c = mysql_query("SELECT * FROM categories WHERE `id` = '$c_id'");
						$data_c = mysql_fetch_assoc($res_c);
						$image = explode('|', $data['prd_imgs']);
						$name = $data['prd_name'];
      					$name_sh = strlen($name) > 20 ? substr($name,0,20)."..." : $name;
						$str .= 
						 '<li class="product-col">
              <div class="product-col-img">
                <a href="product_detail.php?id='.$data['id'].'"><img src="products/'.$image[0].'" /></a>
               </div>
               <div class="product-content">
                  <div class="product-name"><h4>'.$name_sh.'</h4></div>
            	  <div class="product-category"><h4><a href="products.php?category_id='.$data_c['id'].'">'.$data_c['category_name'].'</a></h4></div>
            	  <div class="product-details">
                  <p>'.$data['prd_desc'].'</p>
            	  </div>
                  <div class="product-bottom-content">
                     <div class="product-price"><i class="fa fa-usd"></i> '.$data['price'].'</div>
                     <div class="view-details"><a href="product_detail.php?id='.$data['id'].'" class="button">View Details</a></div>
                  </div>
               </div>
            </li>
						 ';
					}
				}
				$str .= '</ul>';
				return $str;
			}
			public function galleryDisplay(){
				$sql = "SELECT * FROM gallery ORDER BY id DESC";
				$res = mysql_query($sql);
				$str = '';
				  if(mysql_num_rows($res) > 0){
					while($data = mysql_fetch_assoc($res)){
						$str .= '<div class="gallery_img">
								<a href="images/gallery/'.$data['gallery_img'].'" class="img_group">
                				<img src="images/gallery/'.$data['gallery_img'].'" height="220px" width="330px" /></a>
								</div>';
					}
				  }
				  return $str;
			}
			public function productList(){
				$sql = "SELECT * FROM products ORDER BY prd_name ASC";
				$res = mysql_query($sql);
			    $img_b = '';
				$str = '';
					$str .= 
					'<table class="newslist" cellspacing="0">
					  <th>SKU Code</th>
					  <th>Product Name</th>
					  <th>Category</th>
					  <th>Thumbnail</th>
					  <th>Price</th>
					  <th>URL</th>
					  <th>Stock Status</th>
					  <th>Added On</th>
					  <th>Actions</th>
					';
					while($data = mysql_fetch_assoc($res)){
						$image = explode('|', $data['prd_imgs']);
						$c_id = $data['c_id'];
						$res_c = mysql_query("SELECT * FROM categories WHERE `id` = '$c_id'");
						$data_c = mysql_fetch_assoc($res_c);
						
						if(mysql_num_rows($res) > 0){
						$str .= '<tr>
						  <td>'.$data['prd_sku'].'</td>
						  <td>'.$data['prd_name'].'</td>
						  <td>'.$data_c['category_name'].'</td>
						  <td><img src="../products/'.$image[0].'" width="80"></td>
						  <td><span>Rs. '.$data['price'].' /-</span></td>
						  <td><a href="'.$data['prd_link'].'" target="_blank">Open Link</td>
						  <td>'.$data['prd_stock'].'</td>
						  <td>'.$data['date'].'</td>
						  <td><a href="dashboard.php?page=products&edit_product='.$data['id'].'">Edit</a> / 
						  <a href="dashboard.php?page=products&delete_product='.$data['id'].'" onClick="return conf();">Delete</a></td>
						  </tr>
						';
					}
				}
				return $str;
			}
			public function singleProductdisplay($id){
				$sql = "SELECT * FROM products WHERE id = '$id'";
				$res = mysql_query($sql);
				if(mysql_num_rows($res) > 0){
					return mysql_fetch_assoc($res);
				}
			}
			public function displayCategory($id){
				$sql = "SELECT * FROM categories WHERE id = '$id'";
				$res = mysql_query($sql);
				if(mysql_num_rows($res) > 0){
					return mysql_fetch_assoc($res);
				}
			}
			public function randomCode($length) {
                    $key = '';
                    $keys = array_merge(range(0, 9), range('a', 'z'), range('A', 'Z'));

                    for ($i = 0; $i < $length; $i++) {
                    $key .= $keys[array_rand($keys)];
                    }
                    return $key;
                 }
			
			public function addSlide($name, $slide_img){
				$sql = "INSERT INTO slider (`name`, `slide_img`) VALUES ('$name', '$slide_img')";
				$res = mysql_query($sql);
				if($res)
				return TRUE;
			}
			public function addImg($images){
				$sql = "INSERT INTO gallery (`gallery_img`) VALUES ('$images')";
				$res = mysql_query($sql);
				if($res)
				return TRUE;
			}
			
			public function slider_display(){
				$sql = "SELECT * FROM slider ORDER BY id ASC";
				$res = mysql_query($sql);
				$str = '';
				if(mysql_num_rows($res) > 0){
					while($data = mysql_fetch_assoc($res)){
						$str .= 
						 '<img src="images/slides/'.$data['slide_img'].'" class="img-responsive" />';
					}
				}
				return $str;
			}
			
			public function slider_view(){
				$sql = "SELECT * FROM `slider` ORDER BY id ASC";
				$res = mysql_query($sql);
				$str = '';
				if(mysql_num_rows($res) > 0){
					$str .= '<table class="newslist" cellspacing="0">
					  <th>Slide Name</th>
					  <th>Thumbnail</th>
					  <th colspan="2">Actions</th>
					';
					while($data = mysql_fetch_assoc($res)){
						$str .= '<tr>
						  <td>'.$data['name'].'</td>
						  <td><img src="../images/slides/'.$data['slide_img'].'" width="120"/>'.'</td>
						  <td><a href="dashboard.php?page=slider&delete_slide='.$data['id'].'" onClick="return conf();">Delete</a></td>
						  </tr>
						';
					}
				}
				return $str;
			}
			
		public function custom_content($page_name){
			$res = mysql_query("SELECT * FROM custom_content WHERE page_name = '$page_name'");
			$str = '';
			if(mysql_num_rows($res) > 0){
				$data = mysql_fetch_assoc($res);
				$str .= $data['content'];
			}
			return $str;
		}
		public function update_custom_content($content, $page_name){
			$res = mysql_query("UPDATE custom_content SET content = '$content' WHERE page_name = '$page_name'");
			if($res)
			return TRUE;
		}
		public function product_edit($id){
			$sql = "SELECT * FROM `products` WHERE id = '$id'";
			$res = mysql_query($sql);
			if(mysql_num_rows($res) > 0){
				return mysql_fetch_assoc($res);
			}
		}
		public function category_edit($id){
			$sql = "SELECT * FROM categories WHERE id = '$id'";
			$res = mysql_query($sql);
			if(mysql_num_rows($res) > 0){
				return mysql_fetch_assoc($res);
			}
		}
		
		public function updateSlide($id, $name, $slide_img, $link){
			$sql = "UPDATE `slider` SET `name` = '$name', `slide_img` = '$slide_img', `link` = '$link' WHERE `id` = '$id'";
			$res = mysql_query($sql);
			if($res)
			return TRUE;
		}
		public function updateCat($id, $category){
			$sql = "UPDATE `categories` SET `category_name` = '$category' WHERE `id` = '$id'";
			$res = mysql_query($sql);
			if($res)
			return TRUE;
		}
		public function update_product($id, $p_cat, $p_sku, $p_name, $images, $prd_desc, $link, $price, $homepage, $stock_status){
			$sql = "UPDATE `products` SET c_id = '$p_cat', prd_sku = '$p_sku', prd_name = '$p_name', prd_desc = '$prd_desc', 
			prd_link = '$link', price = '$price', homepage = '$homepage', prd_stock = '$stock_status', prd_imgs = $images WHERE `id` = '$id'";
			$res = mysql_query($sql);
			if($res)
			return TRUE;
		}
			
		public function slide_edit($id){
			$sql = "SELECT * FROM `slider` WHERE id = '$id'";
			$res = mysql_query($sql);
			if(mysql_num_rows($res) > 0){
				return mysql_fetch_assoc($res);
			}
		}
		
		public function delete_product($id){
			$sql = "DELETE FROM products WHERE id= '$id'";
				$res= mysql_query($sql);
				if($res){
				 return TRUE;
				}else {
				
				return FALSE;	
				}
		}
		public function delete_category($id){
			$sql = "DELETE FROM categories WHERE id= '$id'";
				$res= mysql_query($sql);
				if($res){
				 return TRUE;
				}else {
				
				return FALSE;	
				}
		}
		
		public function delete_slide($id){
			$sql = "DELETE FROM `slider` WHERE id= '$id'";
				$res= mysql_query($sql);
				if($res){
				 return TRUE;
				}else {
				
				return FALSE;	
				}
		}
		
		public function viewmenubar(){
				$location = @$_GET['sort_by'];
				$sql = "SELECT * FROM menubar ORDER BY id desc";
				$res = mysql_query($sql);
				$str = '';
				if(mysql_num_rows($res) > 0){
					$str .='
					<table class="newslist" cellspacing="0" style="width:900px;">
					  <th>About</th>
					  <th>Collections</th>
					  <th>Gallery</th>
					  <th>Contact</th>
					  <th>Policies</th>
					  <th>Disclaimer</th>
					  <th>Terms</th>
					  <th>Action</th>
					';
					while($data = mysql_fetch_assoc($res)){
						$str .= '<tr>
						  <td>'.$data['about'].'</td>
						  <td>'.$data['collection'].'</td>
						  <td>'.$data['gallery'].'</td>
						  <td>'.$data['contact'].'</td>
						  <td>'.$data['privacy'].'</td>
						  <td>'.$data['disclaimer'].'</td>
						  <td>'.$data['terms'].'</td>
						  <td><a href="dashboard.php?page=menubar&edit_menubar='.$data['id'].'">Edit</a></td>
						  </tr>
						';
					}
				}
				return $str;
			}
		
		public function menubar_edit($id){
			$sql = "SELECT * FROM menubar WHERE id = '$id'";
				$res = mysql_query($sql);
				if(mysql_num_rows($res) > 0){
					return mysql_fetch_assoc($res);
				}
		}
		public function update_menubar($id, $about, $collection, $gallery, $contact, $privacy, $terms, $disclaimer){
			$sql = "UPDATE menubar SET about = '$about', collection = '$collection', gallery = '$gallery', contact = '$contact',
			privacy = '$privacy', terms = '$terms', disclaimer = '$disclaimer' WHERE id = '$id'";
			$res = mysql_query($sql);
			if($res)
			return TRUE;
		}
		
		public function menubar_display(){
			$sql = "SELECT * FROM menubar";
				$res = mysql_query($sql);
				if(mysql_num_rows($res) > 0){
					return mysql_fetch_assoc($res);
				}
		}
		
	}
$function = new Functions();
?>