package com.myfirstweb.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyFirstWebServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String url = "jdbc:postgresql://localhost/dannyDB";
    static final String user = "postgres";
    static final String SQLpassword = ""; //Insert SQL password inside the quotes
    
    private static String QUERY = null;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String emailId = (String)request.getParameter("emailId");
		String password = (String)request.getParameter("password");
		boolean success = false;
		QUERY = "select id,emailid,password from public.user_account where emailid ='"+emailId+"'";
		
		try {
			success = verify(emailId, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);	
		}
		
		//success = true;
		//request.setAttribute("message", "Incorrect email or password");
		//System.out.print("Successful login");
		//request.setAttribute("message", "Successfully logged in");
	
		
		if (success == false) {
			request.setAttribute("message", "Incorrect email or password");
			request.getRequestDispatcher("/index.jsp").forward(request,  response);
		} else {
			request.setAttribute("message", "Successfully logged in");
			request.getRequestDispatcher("/success.jsp").forward(request,  response);	
		}
	
	}
	
	public boolean verify(String given_emailid, String given_password) {
        // using try-with-resources to avoid closing resources (boiler plate
        // code)

        // Step 1: Establishing a Connection
        try (Connection connection = DriverManager.getConnection(url, user, SQLpassword);
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(QUERY);) {
            //preparedStatement.setInt(1, 1);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            int id;
            String email = null;
            String password = null;
            while (rs.next()) {
                id = rs.getInt("id");
                email = rs.getString("emailid");
                password = rs.getString("password");
                System.out.println(id + "," + email + "," + password);
            }
            
            if (given_password.equals(password)) {
            	return true;
            } else {
            	return false;
            }
        } catch (SQLException e) {
        	System.out.println(e);
        	return false; 
        }
    }

}
