package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class InputSensor
 */
@WebServlet("/InputSensor")
public class InputSensor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 주석처리했음
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int mysensor = Integer.parseInt(request.getParameter("mysensor"));
//		System.out.println("서버로 들어온 값 : " + mysensor);
//		SensorDAO dao = new SensorDAO();
//		SensorVO vo = dao.update2(mysensor);
//		PrintWriter out = response.getWriter();
//		String result = new Gson().toJson(vo);
//		out.print(result);
	}

}







