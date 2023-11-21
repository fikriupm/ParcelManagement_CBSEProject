package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ParcelDao;

/**
 * Servlet implementation class Report
 */
@WebServlet("/report")
public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Report() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String available = request.getParameter("available");
		int count = 0;
		try {
			count = ParcelDao.getCountOfDateIn(available);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String all = request.getParameter("available");
		int count_all = 0;
		try {
			count_all = ParcelDao.getAllCountOfDateIn(all);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int count_out = count_all - count;

		double total = (count_all - count) * 0.5; // Calculate the profit

		// Set the count and money as request attributes
		request.setAttribute("countInDateIn", count);
		request.setAttribute("countAllDateIn", count_all);
		request.setAttribute("countOutDateIn", count_out);
		request.setAttribute("total", total);

		RequestDispatcher dispatcher = request.getRequestDispatcher("report.jsp");
		dispatcher.forward(request, response);
	}

}
