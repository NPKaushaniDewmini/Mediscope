package com.mediscoop.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.mediscoop.dao.AdminDAO;
import com.mediscoop.model.Admin;
import com.mediscoop.model.Patient;

import java.sql.*;

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		
		try {
			switch (action) {
			case "/adminLogin":
				adminLogin(request, response);
				break;
			case "/updateAdminPassword":
				updateAdminPassword(request, response);
				break;
			default:
				form(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	
	private void adminLogin(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, IOException, ServletException {

	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    // Create a new AdminDAO instance to handle database operations
	    AdminDAO adminDao = new AdminDAO();

	    try {
	        // Check if the provided credentials are valid
	        Admin admin = adminDao.isValidUser(username, password);

	        if (admin != null) {
	            // Successful login
	            HttpSession session = request.getSession();
	            session.setAttribute("adminLoggedIn", true);
	            session.setAttribute("username", username);
	            session.setAttribute("adminData", admin);
	            
	            

	            response.sendRedirect(request.getContextPath() + "/admin/admin-dashboard.jsp");
	        } else {
	            // Invalid login
	            response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp?error=Invalid+username+or+password");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp?error=Login+failed");
	    }
	}

	private void updateAdminPassword(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, IOException, ServletException {
			// Retrieve form parameters from the request
	        int id = Integer.parseInt(request.getParameter("id"));
	        String currentPass = request.getParameter("CurrentPass");
	        String newPass = request.getParameter("NewPass");
	        	        
	        AdminDAO adminDAO = new AdminDAO();
	        
	        // Update the admin's password
	        boolean passwordUpdated = adminDAO.updateAdminPassword(id, currentPass, newPass);
	        	
	        if (passwordUpdated) {
	            // Password updated successfully
	            response.sendRedirect(request.getContextPath() + "/admin/change-password.jsp?msg=Update+Successfully");
	        } else {
	            // Password update failed
	            response.sendRedirect(request.getContextPath() + "/admin/change-password.jsp?error=Password+update+failed");
	        }
	}
	
	private void form(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {}
	



}
