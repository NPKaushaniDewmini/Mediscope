package com.mediscoop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mediscoop.model.Doctor;
import com.mediscoop.model.Specialization;

public class SpecializationDAO {
	private static final String jdbcUrl = "jdbc:mysql://localhost:3306/mediscoop";
    private static final String jdbcUser = "root";
    private static final String jdbcPassword = "";
    private Connection connection;

    public SpecializationDAO() {
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
    
    // Select all Specialization
    public List<Specialization> selectAllSpecialization() {

        // using try-with-resources to avoid closing resources (boilerplate code)
        List<Specialization> specs = new ArrayList<>();

        try {

            String sql = "SELECT *  FROM specialization";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            System.out.println(pstmt);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("specialization_id");
                String spcName = rs.getString("spc_name");
                String spcDec = rs.getString("spc_dec");
                String creationDate = rs.getString("creation_date");

                specs.add(new Specialization( id,  spcName,  spcDec,  creationDate));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return specs;
    }
    
    //Add new Specialization
    public void addSpecialization(String specName, String specDecs) throws SQLException {
    	String query = "INSERT INTO specialization (spc_name, spc_dec, creation_date) VALUES (?, ?, NOW())";
    	PreparedStatement pstmt = connection.prepareStatement(query);
    	
    	pstmt.setString(1, specName);
    	pstmt.setString(2, specDecs);

    	pstmt.executeUpdate();	
    }
    
    //Select Specialization by id
    public static Specialization selectSpect(int id) {
    	Specialization specialization = null;
        
        // Step 1: Establishing a Connection
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM specialization WHERE specialization_id = ?")) {
            
            // Set the ID parameter in the prepared statement
            preparedStatement.setInt(1, id);
            
            System.out.println(preparedStatement);
            
            // Step 3: Execute the query
            ResultSet rs = preparedStatement.executeQuery();
            
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
            	String specName = rs.getString("spc_name");
            	String specDesc = rs.getString("spc_dec");
                
                // Create a new Specialization object
            	specialization = new Specialization(id,specName, specDesc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return specialization;
    }
    
    // Delete Doctor
    public static boolean deleteSpect(int id) throws SQLException {
        boolean rowDeleted;
        
        try (Connection connection = DatabaseConnector.getConnection();
        		PreparedStatement pstmt = connection.prepareStatement("DELETE FROM specialization WHERE specialization_id = ?");) {
        	pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    // Update an existing Specialization
    public static void updateSpect(Specialization spec) throws SQLException {
    	System.out.println("Hello Upadte");
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(
                 "UPDATE specialization SET spc_name=?, spc_dec=? WHERE specialization_id=?")) {

            pstmt.setString(1, spec.getSpcName());
            pstmt.setString(2, spec.getSpcDec());
            
            pstmt.setLong(3, spec.getSpecializationID());

            pstmt.executeUpdate();
        }
    }

}


