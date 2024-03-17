package com.mediscoop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mediscoop.model.Appointment;

public class AppointmentDAO {
	private static final String jdbcUrl = "jdbc:mysql://localhost:3306/mediscoop";
    private static final String jdbcUser = "root";
    private static final String jdbcPassword = "";
    private Connection connection;

    public AppointmentDAO() {
        connection = getConnection();
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    	// Select all Appointmens
    	public List<Appointment> selectAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        try {

            String sql = "SELECT *  FROM appointments";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            System.out.println(pstmt);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int appID = rs.getInt("app_id");
                int patientID = rs.getInt("patient_id");
                int doctorID = rs.getInt("doctor_id");
                String diseases = rs.getString("diseases");
                String appDate = rs.getString("app_date");
                String amount = rs.getString("amount");
                
                appointments.add(new Appointment(appID,  patientID, doctorID,  diseases, appDate, amount));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointments;
    }
    	
    	//Calculate Total Appointments 
        public int getTotalAppointments() {
        	int totalRows = 0;
        	
        	try {
        		 String sql = "SELECT COUNT(*) AS total_appointments FROM appointments";
        		 PreparedStatement pstmt = connection.prepareStatement(sql);
        		 ResultSet resultSet = pstmt.executeQuery();
        		 if(resultSet.next()) {
        			 totalRows = resultSet.getInt("total_appointments");
        		 }
        		 resultSet.close();
        		 pstmt.close();
                 connection.close();
        		
        	} catch (Exception e) {
                e.printStackTrace();
            }
        	
        	return totalRows;
        }
}
