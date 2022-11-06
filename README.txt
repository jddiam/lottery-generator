README

Lottery Generator

Single Page Application (SPA) for a lottery game system.

System allows users to access the index page (index.jsp) from an updated Google Chrome or Firefox browser.
Each lottery game starts with a randomly generated winning number. From the index, the user inputs their age, number of times to play, and the series of numbers they wish to play.
Invalid input will not be processed further and instead display an error.

Players MUST be older than 18.
Players may play a MAXIMUM of 5 numbers per day. Players must then wait 24 hours before they can play again.
Numbers must be between 1 and 49 inclusive.
A winning number displays a congratulatory message and resets the lottery system.

Frontend - HTML, CSS, JavaScript
  index.jsp
  
Backend - JAVA EE, JDK 11, Apache Tomcat 8.5 webserver 
  root/webpage/servlets/
  
Possible enhancements:
  Display a list of previous winners on the webpage.
  
Code and files uploaded from my desktop.
Deployed using AWS Beanstalk: http://app2-env.eba-eyfkiqm3.us-west-1.elasticbeanstalk.com/
