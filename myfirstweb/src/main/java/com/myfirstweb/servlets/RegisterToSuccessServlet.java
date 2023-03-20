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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyFirstWebServlet
 */
@WebServlet("/RegisterToSuccessServlet")
public class RegisterToSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String url = "jdbc:postgresql://localhost/dannyDB";
    static final String user = "postgres";
    static final String SQLpassword = ""; //Insert SQL password inside the quotes

    /**
     * Default constructor. 
     */
    public RegisterToSuccessServlet() {
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
		String emailId = (String)request.getParameter("emailId");
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		String dob = (String)request.getParameter("DOB");
		
	
		try {
			insertRecord(emailId,username,password,dob);
		} catch (SQLException | ParseException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// Store data into SQL here
		
		// Then redirect to Success page
		request.setAttribute("message", "Successfully registered");
		request.getRequestDispatcher("/success.jsp").forward(request,  response);

	}
	
	public void insertRecord( String emailId, String username, String password, String dob) throws SQLException, ParseException, ClassNotFoundException {
		String INSER_USER_INFO_SQL = "INSERT INTO public.user_account(id, emailid, username, password, dob)	VALUES (?,?,?,?,?)";
		//String dob = "01/20/2002";	
		//SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-mm-dd");
		//Date date = formatter.parse(dob);
		
		ZoneId defaultZoneId = ZoneId.of("CST");
		LocalDate localDate = LocalDate.parse(dob);
		Date date = Date.from(localDate.atStartOfDay(defaultZoneId).toInstant());
		System.out.println(date); 
        // Step 1: Establishing a Connection
		
        try {
        	Class.forName("org.postgresql.Driver");
        	Connection connection = DriverManager.getConnection(url, user, SQLpassword);

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSER_USER_INFO_SQL);
            
            preparedStatement.setInt(1, getSequnceNumber(connection));
            preparedStatement.setString(2, emailId);
            preparedStatement.setString(3, username);
            preparedStatement.setString(4, password);
            preparedStatement.setDate(5, new java.sql.Date(date.getTimezoneOffset()));           
          

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            preparedStatement.executeUpdate();
        } catch (SQLException e) {

            // print SQL exception information
            System.out.println(e);
        }
	}
	
	public int getSequnceNumber(Connection connection) {
		long myId = 0;
		try {
			String sqlIdentifier = "select nextval('useridseq')";
			PreparedStatement pst = connection.prepareStatement(sqlIdentifier);

			
			synchronized (this) {
				ResultSet rs;

				rs = pst.executeQuery();

				if (rs.next()) {
					myId = rs.getLong(1);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (int)myId;
		
	}


}
