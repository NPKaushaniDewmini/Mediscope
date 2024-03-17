<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Check if the patient is not logged in --%>
<% if (session.getAttribute("patientLoggedIn") == null || !(Boolean) session.getAttribute("patientLoggedIn")) { %>
<%-- Redirect to the login page --%>
<%
   response.sendRedirect(request.getContextPath() + "/login.jsp");
   %>
<% } else { %>
<%-- Patient is logged in, display the dashboard --%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <meta charset="ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Dashboard</title>
      <!-- Bootstrap v5.3 CDN Link -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
      <!-- Main CSS File -->
      <link rel="stylesheet" href="../assets/css/styles.css" />
      <!-- Google Fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,800;1,600&display=swap" rel="stylesheet" />
      <!-- Remix Icon CDN -->
      <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet" />
   </head>
   <body>
      <!-- Header Section -->
      <!-- Import Header file -->
      <%@ include file="../common/header.jsp" %>
      <!-- Page Banner -->
      <div class="container-fluid page-banner py-5">
         <div class="text-center">
            <h2>Profile Settings</h2>
            <nav aria-label="breadcrumb">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/patient/patient-dashboard.jsp"">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">
                     Profile Settings
                  </li>
               </ol>
            </nav>
         </div>
      </div>
      <!-- User Account -->
      <section class="container profile">
         <div class="row">
            <div
               class="col-lg-3 p-0 border border-1 rounded shadow-sm d-flex flex-column align-items-center"
               >
               <div class="avatar-img my-4">
                  <img
                     src="../assets/images/user.png"
                     class="avatar"
                     alt="avatar"
                     />
               </div>
               <h5>${patientData.firstName} ${patientData.lastName}</h5>
               <p class="m-0">
                  <i class="ri-calendar-2-line"></i> ${patientData.dob}
               </p>
               <p class="m-0"><i class="ri-map-pin-line"></i> ${patientData.city}, ${patientData.state}</p>
               <!-- Vertical nav -->
               <nav class="nav flex-column my-4 p-0">
                  <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/patient/patient-dashboard.jsp"
                     ><i class="ri-dashboard-line"></i> Dashboard</a
                     >
                  <a class="nav-link" href="#"
                     ><i class="ri-calendar-2-line"></i> Appointments</a
                     >
                  <a class="nav-link" href="<%=request.getContextPath()%>/patient/profile-settings.jsp"
                     ><i class="ri-user-settings-line"></i>Profile Setting</a
                     >
                  <a class="nav-link" href="change-password.html"
                     ><i class="ri-git-repository-private-line"></i>Change Password</a
                     >
                  <a class="nav-link" href="<%=request.getContextPath()%>/LogoutServlet"
                     ><i class="ri-logout-box-r-line"></i>Logout</a
                     >
               </nav>
            </div>
            <div class="col-lg-9">
               <div class="row mx-auto">
                  <div class="col-lg-12 border border-1 rounded shadow-sm p-4" >
                     <form action="<%=request.getContextPath()%>/updatePatient" method="post" class="row">
                        <input type="hidden" name="id" value="${patientData.patientID}" />
                        <div class="col-md-2 mb-3">
                           <label for="inputEmail4" class="form-label">Gender</label>
                           <select class="form-select" aria-label="Default select example" name="gender">
                                <option value="Male" ${patientData.gender == 'Male' ? 'selected' : ''}>Male</option>
                                <option value="Female" ${patientData.gender == 'Female' ? 'selected' : ''}>Female</option>
                           </select>
                        </div>
                        <div class="col-md-5 mb-3">
                           <label for="firstName" class="form-label">First Name</label>
                           <input type="text" class="form-control" id="firstName" name="firstName" value="${patientData.firstName}" />
                        </div>
                        <div class="col-md-5 mb-3">
                           <label for="lastName" class="form-label">Last Name</label>
                           <input type="text" class="form-control" id="lastName" name="lastName" value="${patientData.lastName}" />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="tel" class="form-label">Phone Number</label>
                           <input type="text" class="form-control" id="tel" name="tel" value="${patientData.phoneNo}" />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="email" class="form-label">Email</label>
                           <input type="email" class="form-control" id="email" name="email" value="${patientData.email}" />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="dob" class="form-label">Date of Birth</label>
                           <input type="date" class="form-control" id="dob" name="dob" value="${patientData.dob}" />
                        </div>
                        <div class="col-md-6 mb-3">
                           <label for="bloodGroup" class="form-label">Blood Group</label>
                           <select class="form-select" aria-label="Default select example" name="bloodGroup">
                              <option value="A-" ${patientData.bloodGroup == 'A-' ? 'selected' : ''}>A-</option>
                              <option value="A+" ${patientData.bloodGroup == 'A+' ? 'selected' : ''}>A+</option>
                              <option value="B-" ${patientData.bloodGroup == 'B-' ? 'selected' : ''}>B-</option>
                              <option value="B+" ${patientData.bloodGroup == 'B+' ? 'selected' : ''}>B+</option>
                              <option value="AB" ${patientData.bloodGroup == 'AB' ? 'selected' : ''}>AB</option>
                              <option value="AB+" ${patientData.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                              <option value="O-" ${patientData.bloodGroup == 'O-' ? 'selected' : ''}>O-</option>
                              <option value="O+" ${patientData.bloodGroup == 'O+' ? 'selected' : ''}>O+</option>
                           </select>
                        </div>
                        <div class="col-lg-12 mb-3">
                           <label for="address" class="form-label">Address</label>
                           <input type="text" class="form-control" id="address" placeholder="1234 Main St" value="${patientData.address}" name="address" />
                        </div>
                        <div class="col-md-5 mb-3">
                           <label for="city" class="form-label">City</label>
                           <input type="text" class="form-control" id="city" value="${patientData.city}" name="city" />
                        </div>
                        <div class="col-md-5 mb-3">
                           <label for="state" class="form-label">State</label>
                           <input type="text" class="form-control" id="state" value="${patientData.state}" name="state" />
                        </div>
                        <div class="col-md-2 mb-3">
                           <label for="zipCode" class="form-label">Zip Code</label>
                           <input type="text" class="form-control" id="zipCode" value="${patientData.zipCode}" name="zipCode" />
                        </div>
                        <div class="col-12">
                           <button type="submit" class="btn btn-main">Save changes</button>
                           <a href="listPatients" class="btn btn-second">Cancel</a>
                        </div>
                     </form> 
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- Footer Section -->
      <!-- Import Footer file -->
      <%@ include file="../common/footer.jsp" %>
   </body>
</html>
<% } %>