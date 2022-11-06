
import java.io.*;
import javax.servlet.*;             
import javax.servlet.http.*;        
import javax.servlet.annotation.*;  

@WebServlet("/PlaysServlet")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class PlaysServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
	   
	   HttpSession session = request.getSession();
	   String data = (String) request.getParameter("plays");
	   int numPlays;
	   
	   if ((session != null) && (session.getAttribute("plays") == null)) {
		   session = request.getSession(true);
		   numPlays = Integer.parseInt(data.trim());
		   
		   if (numPlays <= 5) {							// verify maximum 5 plays.
			   session.setAttribute("plays", numPlays);
			   session.setAttribute("playsRemaining", numPlays);
			   response.setContentType("text/plain");
			   response.getWriter().write(numPlays);
		   }
	   }
   }
}
