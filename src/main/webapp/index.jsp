<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Test Platform</title>
  <link rel="stylesheet" href="static/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="static/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="static/css/style.css">
  <link rel="shortcut icon" href="static/images/favicon.png" />
</head>
<script language="JavaScript">
	function validateForm() {
        var name = document.forms["login"]["Username"].value;
        var psd = document.forms["login"]["Password"].value;

        if (name == "" || name == null || name == undefined) {
            alert("姓名或密码错误.");
            return false;
        } else if (psd == "" || psd == null || psd == undefined) {
            alert("姓名或密码错误.");
            return false;
        } else {
            return true;
        }
    }
</script>

<body>
<script language="JavaScript">
	var islogin = "";
	islogin = "<%=session.getAttribute("loginStatus")%>"; 
	
	if("false" == islogin){
		alert("姓名或密码错误.");
	}
</script>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
          
          
         
          
            <div class="auth-form-light text-left p-5">
              <h4>指引测试平台</h4>
              <h6 class="font-weight-light">Zhiyin Test Platform.</h6>
              <form name="login" class="login" action="login" onsubmit="return validateForm()" method="get">
              	<table>
              		<tr>
              			<div class="form-group">
                 		 	<input type="text" class="form-control form-control-lg" id="exampleInputEmail1" name="Username" placeholder="Username">
               		 	</div>
              		</tr>
              		<tr>
              			<div class="form-group">
                  			<input type="password" class="form-control form-control-lg" id="exampleInputPassword1" name="Password" placeholder="Password">
               			</div>
              		</tr>
              		<tr>
              		 	<div class="mt-3">
                			<button type="submit" class="btn btn-gradient-primary mr-2">SIGN IN</button>
                   			<button type="reset" class="btn btn-light" style="float:right;">Cancel</button>
                		</div>
              		</tr>
              	</table>
                
               
              </form>
            </div>
            
            
            
           
            
            
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  
  
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="static/vendors/js/vendor.bundle.base.js"></script>
  <script src="static/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="static/js/off-canvas.js"></script>
  <script src="static/js/misc.js"></script>
  <!-- endinject -->
</body>

</html>
