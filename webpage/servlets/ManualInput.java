
import java.io.*;
import javax.servlet.*;             
import javax.servlet.http.*;        
import javax.servlet.annotation.*; 


@WebServlet("/ManualInput")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class ManualInput extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int lotterySequence[];
	
	public boolean isNumeric(String plaintext) {
		String regex = "\\d+";
		return ((plaintext == null || plaintext.equals("")) ? false : plaintext.matches(regex));
	}
	

   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {

	   HttpSession session=request.getSession(false);
	   boolean sessionExists = (session != null) && (session.getAttribute("plays") != null);
	   String values[] = new String[7];
	   boolean correct[] = new boolean[7];
	   boolean allCorrect = true;
	   String returnValue = "";
	   
	   if (sessionExists && ((int) session.getAttribute("playsRemaining") > 0)) {
		   values[0] = request.getParameter("num1").trim();
		   values[1] = request.getParameter("num2").trim();
		   values[2] = request.getParameter("num3").trim();
		   values[3] = request.getParameter("num4").trim();
		   values[4] = request.getParameter("num5").trim();
		   values[5] = request.getParameter("num6").trim();
		   values[6] = request.getParameter("num7").trim();
		  
		   lotterySequence = LotteryNumber.getLotteryNumber();
		   
		   for (int i=0; i<7; i++) {
			   boolean numeric = isNumeric(values[i]);
			   if (!numeric) { returnValue = "error"; break;}
			   if (Integer.parseInt(values[i]) != lotterySequence[i]) {
				   allCorrect = false;
				   correct[i] = false;
				   returnValue += (false+",");
			   } else {
				   correct[i] = true;
				   returnValue += (true+",");
			   }
		   }
		   
		   if (!returnValue.equals("error")) {
			   if (allCorrect) {
				   SessionServlet.destroySession(session);
				   new File("winningNumbers.txt").delete();
				   returnValue += "true";
			   } else {
				   
				   int playsRemaining = (Integer) session.getAttribute("playsRemaining");
				   playsRemaining -= 1;
				   session.setAttribute("playsRemaining", playsRemaining);
				   
				   returnValue += "false";
			   }  
		   } else {
			   System.out.println("ERROR");
		   }
	   }
	  
     response.setContentType("text/plain");
     response.getWriter().write(returnValue);
     
   }
}
