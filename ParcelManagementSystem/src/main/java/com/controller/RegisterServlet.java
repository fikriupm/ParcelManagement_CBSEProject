package com.controller;

import com.dao.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.GetConnection;

/**
 * Servlet implementation class RegistartionServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String umatric = request.getParameter("matric");
		String upwd = request.getParameter("pass");
		String Reupwd = request.getParameter("re_pass");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		boolean isValid = true;

		if (uname == null || uname.equals("")) {
			request.setAttribute("status", "invalidName");
			isValid = false;
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if (umatric == null || umatric.equals("")) {
			request.setAttribute("status", "invalidMatric");
			isValid = false;
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if (uemail == null || uemail.equals("")) {
			request.setAttribute("status", "invalidEmail");
			isValid = false;
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}		
		else if(!uemail.contains(umatric) || !uemail.contains("@student.upm.edu.my")) {
		    request.setAttribute("status", "invalidEmailStudent");
			isValid = false;
		    dispatcher = request.getRequestDispatcher("registration.jsp");
		    dispatcher.forward(request, response);
		}
		if (upwd == null || upwd.equals("")) {
			request.setAttribute("status", "invalidUpwd");
			isValid = false;
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		} else if (!upwd.equals(Reupwd)) {
			request.setAttribute("status", "invalidConfirmPassword");
			isValid = false;
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		} 
//		else if (!isValidPassword(upwd)) {
//		    request.setAttribute("status", "invalidPassword");
//		    isValid = false;
//		    dispatcher = request.getRequestDispatcher("registration.jsp");
//		    dispatcher.forward(request, response);
//		}

		if (isValid) {
			try {
				con = GetConnection.getConnection();
				UserDAO userDAO = new UserDAO(con);
				boolean success = userDAO.insertUser(uname, uemail, umatric, upwd);

				dispatcher = request.getRequestDispatcher("registration.jsp");

				if (success) {
					request.setAttribute("status", "success");
				} else {
					request.setAttribute("status", "failed");
				}
				dispatcher.forward(request, response);
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
//	private boolean isValidPassword(String password) {
//	    // Define your password requirements here
//	    // For example, a strong password requires at least 8 characters, 
//	    // including at least one uppercase letter, one lowercase letter, one digit, and one special character.
//	    String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
//
//	    return password.matches(passwordRegex);
//	}
}