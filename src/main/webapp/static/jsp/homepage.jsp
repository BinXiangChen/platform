<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>首页</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="static/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="static/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="static/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="static/images/favicon.png" />
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="navbar-menu-wrapper d-flex align-items-stretch">
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="true">
              <div class="nav-profile-text">
                <p class="mb-1 text-black">陈斌翔</p>
              </div>
            </a>
            <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="#">
                	个人中心
              </a>
              <a class="dropdown-item" href="#">
                	退出
              </a>
            </div>
          </li>
          
          <li class="nav-item d-none d-lg-block full-screen-link">
            <a class="nav-link">
              <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
            </a>
          </li>
          
          <li class="nav-item nav-logout d-none d-lg-block">
            <a class="nav-link" href="#">
              <i class="mdi mdi-power"></i>
            </a>
          </li>
          <li class="nav-item nav-settings d-none d-lg-block">
            <a class="nav-link" href="#">
              <i class="mdi mdi-format-line-spacing"></i>
            </a>
          </li>
          
        </ul>
      </div>
    </nav>
    
    
    
    
    
    
    
    
    
    
    <!-- 左侧目录部分 -->
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item nav-profile">
            <a href="#" class="nav-link">
              <div class="nav-profile-image">
                <img src="static/images/faces/face1.jpg" alt="profile">
                <span class="login-status online"></span> <!--change to offline or busy as needed-->              
              </div>
              <div class="nav-profile-text d-flex flex-column">
                <span class="font-weight-bold mb-2">Chen Binxiang</span>
                <span class="text-secondary text-small">QA 测试工程师</span>
              </div>
              <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="index.html">
              <span class="menu-title">模板例子</span>
              <i class="mdi mdi-home menu-icon"></i>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-cases" aria-expanded="false" aria-controls="ui-cases">
              <span class="menu-title">用例管理</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a>
            <div class="collapse" id="ui-cases">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">接口自动化用例</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">PC UI自动化用例</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">业务场景自动化用例</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">安卓自动化用例</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">IOS自动化用例</a></li>
              </ul>
            </div>
          </li>
          
                  
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title">测试报告</span>
              <i class="mdi mdi-image-filter-none menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title">调度中心</span>
              <i class="mdi mdi-lan menu-icon"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span class="menu-title">项目管理</span>
              <i class="mdi mdi-buffer menu-icon"></i>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-data" aria-expanded="false" aria-controls="ui-data">
              <span class="menu-title">数据管理</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi-chart-bar menu-icon"></i>
            </a>
            <div class="collapse" id="ui-data">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">环境数据</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">接口信息</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">项目信息</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">数据工具</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-system" aria-expanded="false" aria-controls="ui-system">
              <span class="menu-title">系统设置</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi-settings menu-icon"></i>
            </a>
            <div class="collapse" id="ui-system">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">用户设置</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">报告设置</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">执行记录</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">日志信息</a></li>
              </ul>
            </div>
          </li>
         
        </ul>
      </nav>
      
      
      
      
      
      
      
      
      <!-- 右边显示部分 -->
      
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          
          
          
          内容部分
          
          
          
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Chen Binxiang. All rights reserved. </span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  
   

  <script src="static/vendors/js/vendor.bundle.base.js"></script>
  <script src="static/vendors/js/vendor.bundle.addons.js"></script>
  <script src="static/js/off-canvas.js"></script>
  <script src="static/js/misc.js"></script>
  <script src="static/js/dashboard.js"></script>
</body>

</html>
