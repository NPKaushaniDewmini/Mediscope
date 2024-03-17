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
import java.util.List;

import com.mediscoop.dao.AppointmentDAO;
import com.mediscoop.model.Appointment;

public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AppointmentServlet() {
        super();   
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/createAppointment":
                	createAppointment(request, response);
                    break;
                case "/editAppointment":
                	editAppointment(request, response);
                    break;
                case "/deleteAppointment":
                	deleteAppointment(request, response);
                    break;
                case "/listAppointments":
                	listAppointments(request, response);
                    break;
                default:
                	listAppointments(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related errors
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
	}
	
	//Create Appointment Method
	 private void createAppointment(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
		 
	 }
	 
	//Update Appointment Method
	 private void editAppointment(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
		 
	 }
	 
	//Delete deleteAppointment Method
	private void deleteAppointment(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
			 
	}
	
	//Retrieve  deleteAppointment Method
	private void listAppointments(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		System.out.println("Hello");
		AppointmentDAO appointmentdao = new AppointmentDAO(); 
	    List<Appointment> listAppointments = appointmentdao.selectAllAppointments();
	    request.setAttribute("listAppointments", listAppointments);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("admin/list-appointments.jsp");
	    dispatcher.forward(request, response);
	}



}
