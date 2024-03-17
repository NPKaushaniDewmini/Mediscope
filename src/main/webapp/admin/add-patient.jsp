<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- Check if the admin is not logged in --%>
<% if (session.getAttribute("adminLoggedIn") == null || !(Boolean) session.getAttribute("adminLoggedIn")) { %>
<%-- Redirect to the login page --%>
<%
   response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
   %>
<% } else { %>
<%-- Patient is logged in, display the dashboard --%>   
<% String page_title = "Dashboard"; %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <meta charset="ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title><% out.print(page_title); %></title>
      <!-- Bootstrap v5.3 CDN Link -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
      <!-- Main CSS File -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css" />
      <!-- Google Fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,800;1,600&display=swap" rel="stylesheet" />
      <!-- Remix Icon CDN -->
      <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet" />
   </head>
   <body class="bg-light">
      <div class="row dashboard">
         <aside class="col-lg-2 border-end border-end-5 fixed-left bg-white p-0">
            <!-- Import Sidebar-menu -->
            <%@ include file="common/admin-sidebar-menu.jsp" %>
         </aside>
         <div class="col-lg-10 ms-auto">
            <!-- Header -->
            <!-- Import header -->
            <%@ include file="common/header.jsp" %>
            <!-- Main Section -->
            <main class="main px-3 mt-5">
               <!-- Breadcrumb -->
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                        <a href="admin-dashboard.jsp">Dashboard</a>
                     </li>
                     <li class="breadcrumb-item active" aria-current="page">
                        Patients
                     </li>
                  </ol>
               </nav>
               <!-- Appoinments Table -->
               <div class="row mt-3 mx-auto">
                  <div class="col-lg-12 border rounded border-1 shadow-sm p-4 bg-white">
                     <div class="d-flex justify-content-between align-items-center mb-3">
                     	<h5>Add Patient</h5>
                     </div>
                     <form action="<%=request.getContextPath()%>/addPatient" method="post" class="mt-5 needs-validation row" novalidate>
                        <div class="col-md-2 mb-3">
                           <label for="inputEmail4" class="form-label">Gender</label>
                           <select class="form-select" aria-label="Default select example" name="gender" required>
                                <option selected>Select gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                           </select>
                        </div>
                        <div class="col-md-5 mb-3">
                           <label for="firstName" class="form-label">First Name</label>
                           <input type="text" class="form-control" id="firstName" name="firstName" required />
                        </div>
                        <div class="col-md-5 mb-3">
                           <label for="lastName" class="form-label">Last Name</label>
                           <input type="text" class="form-control" id="lastName" name="lastName" required />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="username" class="form-label">Username</label>
                           <input type="text" class="form-control" id="username" name="username" required />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="email" class="form-label">Email</label>
                           <input type="email" class="form-control" id="email" name="email" required />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="password1" class="form-label">Create Password</label>
                           <input type="password" class="form-control" id="password1" name="password" required />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="password2" class="form-label">Confirm Password</label>
                           <input type="password" class="form-control" id="password2" required />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="tel" class="form-label">Phone Number</label>
                           <input type="text" class="form-control" id="tel" name="tel" required />
                        </div>
                        
                        <div class="col-md-6 mb-3">
                           <label for="dob" class="form-label">Date of Birth</label>
                           <input type="date" class="form-control" id="dob" name="dob" required />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="bloodGroup" class="form-label">Blood Group</label>
                           <select class="form-select" aria-label="Default select example" name="bloodGroup" required>
                           	  <option selected>--</option>
                              <option value="A-">A-</option>
                              <option value="A+">A+</option>
                              <option value="B-">B-</option>
                              <option value="B+">B+</option>
                              <option value="AB">AB</option>
                              <option value="AB+">AB+</option>
                              <option value="O-">O-</option>
                              <option value="O+">O+</option>
                           </select>
                        </div>
                        <div class="col-lg-6 mb-3">
                           <label for="address" class="form-label">Address</label>
                           <input type="text" class="form-control" id="address" placeholder="1234 Main St" name="address" required />
                        </div>
                        <div class="col-md-5 mb-3">
                           <label for="city" class="form-label">City</label>
                           <input type="text" class="form-control" id="city" name="city" required />
                        </div>
                        <div class="col-md-5 mb-3">
                           <label for="state" class="form-label">State</label>
                           <input type="text" class="form-control" id="state" name="state" required />
                        </div>
                        <div class="col-md-2 mb-3">
                           <label for="zipCode" class="form-label">Zip Code</label>
                           <input type="text" class="form-control" id="zipCode" name="zipCode" required />
                        </div>
                        <button type="submit" class="btn btn-main mb-3">Add Patient</button>
                     </form>
                  </div>
               </div>
            </main>
         </div>
      </div>
      
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous" ></script>
      
   </body>
</html>
<% } %>