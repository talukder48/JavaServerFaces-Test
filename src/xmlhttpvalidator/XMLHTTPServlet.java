package xmlhttpvalidator;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import projectUtils.CommonFacade;
import projectUtils.ProjectUtils;

/**
 * Servlet implementation class XMLHTTPServlet
 */
@WebServlet("/XMLHTTPServlet")
public class XMLHTTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XMLHTTPServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Data = request.getParameter("data");
		Map<String, String> inmap = new HashMap<String, String>();
		Map<String, String> outmap = new HashMap<String, String>();
		String GsonString = "";
		try {
			inmap = ProjectUtils.DataTokenizer(Data);
			outmap = CommonFacade.SessionFacade(inmap);
			if (inmap.get("Method").equals("LoginMethod")) {
				HttpSession sessionParam = request.getSession();
				sessionParam.setAttribute("User_Id", inmap.get("user"));
				sessionParam.setAttribute("USER_NAME ", outmap.get("USER_NAME"));
				sessionParam.setAttribute("BranchCode", outmap.get("USER_BRANCH"));
				sessionParam.setMaxInactiveInterval(10* 60);
				SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss z");
				String date = sdf.format(new Date());
				sessionParam.setAttribute("LogOnTime", "");
				sessionParam.setAttribute("LogOnDate", date);
				sessionParam.setAttribute("USER_ROLE", outmap.get("USER_ROLE"));
				sessionParam.setAttribute("BRN_NAME", outmap.get("BRN_NAME"));
			} else if (inmap.get("Method").equals("LogOut")) {
				HttpSession sessionParam = request.getSession();
				sessionParam.invalidate();
			}
		}
		catch (Exception e) {
			outmap.put("ERROR_MSG", "Please fill the undefined field / Amount field shuld be Zero or  Non-Zero But Not Blank");
		}
		
		Gson gsonObj = new Gson();
		GsonString = gsonObj.toJson(outmap);
		//System.out.println(Data);
		System.out.println(inmap);
		System.out.println(outmap);
		//System.out.println(GsonString);
		PrintWriter out = response.getWriter();
		out.println(GsonString);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
