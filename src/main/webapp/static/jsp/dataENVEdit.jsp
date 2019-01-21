<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>编辑环境变量</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../images/favicon.png" />
</head>
<script language="JavaScript">
	function validateForm() {
        var variable = document.forms["envdata"]["variable"].value;
        var value = document.forms["envdata"]["value"].value;

        if (variable == "" || variable == null || variable == undefined) {
            alert("变量名不能为空.");
            return false;
        } else if (value == "" || value == null || value == undefined) {
            alert("变量值不能为空.");
            return false;
        } else {
            return true;
        }
    }
	
	<%session.setAttribute("isEditEnv", "true");%>
	<%
		String id = request.getParameter("id");
		session.setAttribute("editId", id);
	%>
</script>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
          
          <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">编辑环境变量</h4>
                  <p class="card-description">
                    Edit Environmental Variables
                  </p>
                  <form name="envdata" class="envdata" action="../../envdata" onsubmit="return validateForm()" method="get">
                    <div class="form-group">
                      <label for="exampleInputName1">变量名</label>
                      <input type="text" class="form-control" id="exampleInputName1" placeholder=<%=request.getParameter("variable") %> name="variable">
                    </div>
                    
                    <div class="form-group">
                      <label for="exampleSelectGender">环境</label>
                        <select class="form-control" id="exampleSelectGender" placeholder=<%=request.getParameter("env") %> name="env">
                          <option>测试环境</option>
                          <option>预发环境</option>
                          <option>生产环境</option>
                        </select>
                    </div>
                      
                     <div class="form-group">
                     	 <label for="exampleInputName2">变量值</label>
                 		 <input type="text" class="form-control form-control-lg" id="exampleInputValue" placeholder=<%=request.getParameter("value") %> name="value">
               		 </div>
                
                    <button type="submit" class="btn btn-gradient-primary mr-2">Submit</button>
                    <button type="reset" class="btn btn-light">Cancel</button>
                  </form>
                </div>
              </div>
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
  <script src="../vendors/js/vendor.bundle.base.js"></script>
  <script src="../vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../js/off-canvas.js"></script>
  <script src="../js/misc.js"></script>
  <!-- endinject -->
</body>

</html>
