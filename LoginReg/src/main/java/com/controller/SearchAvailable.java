package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Parcel;
import com.dao.ParcelDao;

/**
 * Servlet implementation class SearchAvailable
 */
@WebServlet("/searchAvailable")
public class SearchAvailable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAvailable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dateIn = request.getParameter("searchTerm"); // Assuming the search parameter is named "dateIn"
		List<Parcel> listUser = ParcelDao.selectAvailablesearch(dateIn);
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("available-list.jsp");
		dispatcher.forward(request, response);
	}
}
