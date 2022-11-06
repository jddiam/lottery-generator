import java.io.*;
import javax.servlet.*;             
import javax.servlet.http.*;        
import javax.servlet.annotation.*;  
 
@WebServlet("/SessionServlet")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected static void destroySession(HttpSession session) {
		   session.removeAttribute("plays");
		   session.removeAttribute("playsRemaining");
		   session.invalidate();		
	}
	
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
      
      String returnValue = "null";
      HttpSession session=request.getSession(false);
      long timeNow = System.currentTimeMillis();
      boolean sessionActive = (session != null) && (session.getAttribute("plays") != null) && ((timeNow-session.getCreationTime())/1000l/60l) < 1440l;
      
      
      
      if (sessionActive) {
    	  boolean invalidationReq = request.getParameter("invalidate") != null;
    	  boolean sessionExpired = (((timeNow-session.getCreationTime())/1000l/60l) >= 1440l);

    	  if (sessionExpired || invalidationReq) {
    		  destroySession(session);
    		  
    	  } else {
    	 
	         String playsData = String.valueOf(session.getAttribute("plays"));
	         String playsRemainingData = String.valueOf(session.getAttribute("playsRemaining"));
	         returnValue = playsRemainingData + "," + playsData + ",";
	         
	         int[] lotteryNumbers = LotteryNumber.getLotteryNumber();
	         for (int i : lotteryNumbers) {
	        	 returnValue += (i + ",");
	         }
	         
	         response.setContentType("text/plain");
	         response.getWriter().write(returnValue);
    	  }
      }

   }
}
