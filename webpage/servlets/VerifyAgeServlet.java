
import java.io.*;
import javax.servlet.*;             
import javax.servlet.http.*;        
import javax.servlet.annotation.*;  

@WebServlet("/VerifyAgeServlet")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class VerifyAgeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public boolean isNumeric(String plaintext) {
		String regex = "\\d+";
		return ((plaintext == null || plaintext.equals("")) ? false : plaintext.matches(regex));
	}
	
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
      
	  String returnValue = "error";
      String userAgeText = request.getParameter("userAge").trim();
      boolean numeric = isNumeric(userAgeText);
      int userAge;

      // check if input is valid, else provide default value
      if (numeric) {
    	  userAge = Integer.parseInt(userAgeText);
    	  if (userAge >= 18) {
    		  returnValue = "true";
    	  } else {
    		  returnValue = "false";
    	  }
      }

 	 response.setContentType("text/plain");
     response.getWriter().write(returnValue);

   }
}
