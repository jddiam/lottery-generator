

import java.io.IOException;
import java.util.Random;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AutoGenerateServlet")
public class AutoGenerateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	   @Override
	   public void doGet(HttpServletRequest request, HttpServletResponse response)
	         throws IOException, ServletException {
	      
	        List<Integer> autoNumbers2 = new ArrayList<>();
	        Random rand = new Random();
	        String returnValue = "";

	        // GENERATES THE AUTO NUMBERS
	        for (int i = 0; i < 7; i++) {
	        	int autoNumber1;
	            while (true) {
	            	autoNumber1 = rand.nextInt(49) + 1;
	                if (!autoNumbers2.contains(autoNumber1)) {
	                    autoNumbers2.add(autoNumber1);
	                    break;
	                }
	            }
	            returnValue += autoNumber1 + " ";
	        }

	      response.setContentType("text/plain");
	      response.getWriter().write(returnValue.strip());
	   }

}
