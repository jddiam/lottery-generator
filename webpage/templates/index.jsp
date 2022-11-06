<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="ISO-8859-1"> 
    <head> 
        <title>Lottery</title> 
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
		<link rel="manifest" href="/site.webmanifest">
        <style>
            .page_logo {
                display:block;
                padding: 0;
                margin: 0;
                overflow-wrap: normal;
                font-size: 3em;
                font-family: tahoma;
                color: blue;
            }

            [class*="_form"] {
                display:none;
                margin: 0em auto 3em;
                padding: 1em auto;
            }

            [class*="_form"] legend {
                display:block;
                text-align: center;
                margin: 1em auto;

                font-family: arial;
                font-size: 1em;
                overflow-wrap: break-word;
            }

            [class*="_form"] fieldset {
                position: block;
                margin: 0;
                padding: 0;
                border: 0;
            }

            [class*="_form"] input[type="submit"] {
                display: block;
                width: 200px;
                height: 50px;
                margin: 20px auto;
                
                background-color: #183EFA;
                color: white;
                font-size: 1em;
                border-radius: 8px;
                transition-duration: 0.4s;
                border: none;
            }
            
            .invalidate_button {
                display: none;
                width: 100px;
                height: 25px;
                margin: 20px auto;
                
                background-color: rgb(255,255,255,0);
                color: red;
                font-size: 70%;
                border-radius: 8px;
                transition-duration: 0.4s;
                border: none;
            }

            input[type="submit"]:active {
                transform: scale(.93);
            }

			.invalidate_button:active {
                transform: scale(.93);
            }

            .age_input {
                display:block;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }

            .number_input {
                display:block;
                margin-left: auto;
                margin-right: auto;
            }

            .number_select {
                display:block;
                margin-left: auto;
                margin-right: auto;
            }

            .number_field {
                margin: .2em;
                padding: 8px 0 4px;
                width: 2em;
                height: 2em;

                font-size: 100%;
                text-align: center;
                font-family: arial;
                color: blue;

                appearance: textfield;
                border: 2px solid #BBBBFF;
                border-radius: 4px;
            }

			.tab {
			  margin: 0 auto 0;
			  width:30%;
			  display: flex;
			  overflow: hidden;
			  justify-content:space-around;
			  align-items: center;
			}
			
			.tab button {
			  background-color: rgb(220,220,220,0);
			  float: left;
			  border: none;
			  outline: none;
			  cursor: pointer;
			  padding: 14px 16px;
			  transition: 0.3s;
			}
			
			.tab button:hover {
			  background-color: rgb(100,100,100, .3);
			}
			
			/* Create an active/current tablink class */
			.tab button.active {
			  background-color: #ccc;
			}
			
            .lftabcontent {
            	display: none;
            	text-align: center;
            }	
			
            .manual_content {
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .generated_content {
            	margin: .5em auto;
            	text-align: center;
            	font-size: 2em;
            	font-family: arial;
            	color: blue;
            	min-width: 10em;
            }
            
            .error_msg {
                margin: 0 auto 0;
                padding: 0;
                text-align: center;
                font-family: arial;
                color: red;
            }
            
            input::-webkit-outer-spin-button,
			input::-webkit-inner-spin-button {
			  -webkit-appearance: none;
			  margin: 0;
			}
            
			 html {
			  height:100%;
			}
			
			body {
			  margin:0;
			}
			
			.bg {
			  animation:slide 3s ease-in-out infinite alternate;
			  background-image: linear-gradient(-60deg, blue 50%, white 50%);
			  bottom:0;
			  left:-50%;
			  opacity:.5;
			  position:fixed;
			  right:-50%;
			  top:0;
			  z-index:-1;
			}
			
			.bg2 {
			  animation-direction:alternate-reverse;
			  animation-duration:4s;
			}
			
			.bg3 {
			  animation-duration:5s;
			}
			
			.content {
			  background-color:rgba(255,255,255,.8);
			  border-radius:.25em;
			  box-shadow:0 0 .25em rgba(0,0,0,.25);
			  box-sizing:border-box;
			  left:50%;
			  padding:10vmin;
			  position:fixed;
			  text-align:center;
			  top:50%;
			  transform:translate(-50%, -50%);
			}
			
			h1 {
			  font-family:monospace;
			}
			
			@keyframes slide {
			  0% {
			    transform:translateX(-25%);
			  }
			  100% {
			    transform:translateX(25%);
			  }
			}
            
        </style>
    </head>
    <body>
    	<img id="splash" src="<%=request.getContextPath()%>/splash.jpg" width="500vw" height="25%" style="display:block; margin: 5vh auto 0;">
    	
    	<div class="bg"></div>
		<div class="bg bg2"></div>
		<div class="bg bg3"></div>
		<div class="content" id="hidediv" style="display: none;">
	        <a class='page_logo' href="index.jsp" style="text-decoration: none; text-align: center; margin: 0 auto 1em" id="logo">
	            Lottery Generator 
	        </a>
	
	        <form class="age_form" id="ageform" name="ageform" action="">
	            <fieldset>
	                <legend> Enter your age below: </legend>
	                <input class="age_input" name="userage" type="text" id="userage" >
	                <div class="error_msg" id="ageerror"> </div>
	                <input name="submitage" id="submitage" type="submit" value="Submit"  >
	            </fieldset>
	        </form>
	
	        <form class="number_of_plays_form" id ="numplaysform" name="number-of-plays">
	            <fieldset>
	                <legend> How many times would you like to play? Maximum is 5. </legend>
	                <select class="number_select" name="plays" id="plays" style="background-color: white;">
	                    <option value="1" selected="selected">1</option>
	                    <option value="2">2</option>
	                    <option value="3">3</option>
	                    <option value="4">4</option>
	                    <option value="5">5</option>
	                </select>
	                <div class="error_msg" id="numplayserror"> </div>
	                <input type="submit" value="Submit" >
	            </fieldset>
	        </form> 
	
	        <form class="lottery_form" id = "lotteryform" name="lottery">
	            <fieldset>
	                <legend id = "gamenumber" style="margin:0 auto 0;"> Game: 1/5 </legend>
	                
	                
	                <div class="tab" style="display: flex; width: 100%; justify-content:space-around; margin: 0 auto 0;" >
						 <button class="tablinks" id="generatetab" onclick="showGenerate(event)">Generate</button>
						 <button class="tablinks" id="manualtab" onclick="showManual(event)">Manual Input</button>
					</div>
	                <div style="display:flex; justify-content:space-around; align-items: center; width:50%; margin: 0 auto 0;">
		                <div class='lftabcontent' id='generated'>
		                	<legend> Auto-generate </legend>
			                <div class = "generated_content" id="generated_content">
			                    1 1 1 1 1 1 1
			                </div>
			                <div style="display: flex;">
				                <input type="submit" id="requestgenerate" value="Generate" style="margin: 0 2em 0;">
				                <input type="submit" id="submitgenerated" value="Submit" style="margin: 0 2em 0;">
			                </div>
		                </div>
		                <div class='lftabcontent' id='manual'>
		                	<legend> Manual Input </legend>
							<div class = "manual_content" id="manual_content">
							    <input class='number_field' type="number" min="1" max="49" id="num1" required>
							    <input class='number_field' type="number" min="1" max="49" id="num2" required>
							    <input class='number_field' type="number" min="1" max="49" id="num3" required>
							    <input class='number_field' type="number" min="1" max="49" id="num4" required>
							    <input class='number_field' type="number" min="1" max="49" id="num5" required>
							    <input class='number_field' type="number" min="1" max="49" id="num6" required>
							    <input class='number_field' type="number" min="1" max="49" id="num7" required>
							</div>
							<input type="submit" id="submitmanual" value="Submit">
						</div>
					</div>
	                
	                <div class='error_msg' id="lotterymsg" style="margin:.5em auto 0;"> </div> 
	
	            </fieldset>           
	        </form>
	        <button class='invalidate_button' id='invalidate'> Invalidate session </button>
        </div>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript">
        
        	var plays;
        	var playsRemaining;

            function formSubmitted(elementId) {
                const element = document.getElementById(elementId);
                element.remove(); // Remove element
                if (element.id == 'ageform') {
                    showElement('numplaysform');
                } else if (element.id == 'numplaysform') {
                	updateLotteryForm();
                    showElement('lotteryform');
                }
            }

            function showElement(elementId) {
                const element = document.getElementById(elementId);
                if (elementId=='lotteryform') {showElement('manual');}
                element.style.display = "block";
            }

            function hideElement(elementId) {
                const element = document.getElementById(elementId);
                element.style.display = "none";
            }
            
            function showGenerate (event) {
            	event.preventDefault();
            	document.getElementById('manual').style.display = 'none';
            	document.getElementById('generated').style.display = 'block'
            }
            
            function showManual (event) {
            	event.preventDefault();
            	document.getElementById('manual').style.display = 'block';
            	document.getElementById('generated').style.display = 'none'
            }
            
            function writeError (elementid, msg) {
            	const el = document.getElementById(elementid);
            	el.style.color = "red";
            	el.innerHTML = msg;
            }
            
            function writeMsg (elementid, msg) {
            	const el = document.getElementById(elementid);
            	el.style.color = "blue";
            	el.innerHTML = msg;
            }
            
            
            function setPlays(val) {
            	if (typeof(val) == 'string') {
            		plays = parseInt(val);
            	} else if (typeof(val) == 'number') {
            		plays = val;
            	}
            }
            
            function setPlaysRemaining(val) {
            	if (typeof(val) == 'string') {
            		playsRemaining = parseInt(val);
            	} else if (typeof(val) == 'number') {
            		playsRemaining = val;
            	}
            }
          
            function updateLotteryForm(winner=false) {
            	if (playsRemaining == 0) {
            		document.getElementById('gamenumber').innerHTML = "Game: " + plays + "/" + plays;
            		removeLotteryFormButtons();
            		
            		if (winner) {
            			writeMsg('lotterymsg', "Congratulations! You are a winner!");
            		} else {
            			writeMsg('lotterymsg', "Sorry, you are not a winner. Please try again tomorrow.");
            		}
            		document.getElementById('invalidate').style.display = "block";
            	} else {
            		document.getElementById('gamenumber').innerHTML = "Game: " + (plays-(playsRemaining-1)).toString() + "/" + plays;
            		if (winner) {removeLotteryFormButtons();}
            	}
            }
            
            function removeLotteryFormButtons() {
        		document.getElementById('submitmanual').remove();
        		document.getElementById('submitgenerated').remove();
        		document.getElementById('requestgenerate').remove();
            }
			
            /**
            * A utility method that translates DOM elements over a period of time.
            * Adapted from Jared W.'s article, "Moving an object with JavaScript, Part1"
            * Article found here:
            * https://medium.com/@theredwillows/moving-an-element-with-javascript-part-1-765c6a083d45
            */
            function move(element, direction, distance=20, duration=1000) {
            	   var topOrLeft = (direction=="left" || direction=="right") ? "left" : "top";
            	   var isNegated = (direction=="up" || direction=="left");
            	   if (isNegated) { distance *= -1; }   var elStyle = window.getComputedStyle(element);
            	   var value = elStyle.getPropertyValue(topOrLeft).replace("px", "");
            	   var destination = Number(value) + distance;
            	   var frameDistance = distance / (duration / 10);   function moveAFrame() {
            	      elStyle = window.getComputedStyle(element);
            	      value = elStyle.getPropertyValue(topOrLeft).replace("px", "");
            	      var newLocation = Number(value) + frameDistance;
            	      var beyondDestination = ( (!isNegated && newLocation>=destination) || (isNegated && newLocation<=destination) );
            	      if (beyondDestination) {
            	         element.style[topOrLeft] = destination + "px";
            	         clearInterval(movingFrames);
            	      }
            	      else {
            	         element.style[topOrLeft] = newLocation + "px";
            	      }
            	   }
            	   var movingFrames = setInterval(moveAFrame, 10);
            	}


            $(document).ready(function () {
               
        	    var img = new Image();
        	    img.src = "/test/example.jpg";
            	
            	document.getElementById("splash").style.position = "absolute";
            	document.getElementById("splash").style.left = "37.5%"
            	document.getElementById("splash").style.height = "85%";
            	
           		setTimeout(function() {
           			move(document.getElementById("splash"), "up", 1500);
           			document.getElementById("hidediv").style.display = "block";
           			}, 4000);
           		
           		setTimeout(function() {
           			document.getElementById("splash").remove();
           		}, 5000)
				
                $.ajax({
                    url : 'SessionServlet',
                    data : {},
                    success : function(returnValue) {
                        if (returnValue != "") {
                         	const data = returnValue.split(',');
                         	setPlaysRemaining(data[0]);
                         	setPlays(data[1]);
                            formSubmitted('numplaysform');
                            
                            var winningNum = "For the professor: ";
                            for (var i=2; i<9; i++) {
                            	winningNum = winningNum + (data[i] + " ");
                            }
                            console.log(winningNum.trim());
                        } else {
                        	showElement('ageform');
                        }
                    },
                  	error : function(req, err) {writeError('ageerror', err);}
            	});
                
                

                $('#ageform').submit(function(event) {
                    event.preventDefault();

                    $.ajax({
                        url : 'VerifyAgeServlet',
                        data : {
                            userAge : $("#userage").val()
                        },
                        success : function(returnValue) {
                            if (returnValue == "true") {
                                formSubmitted("ageform");
                            } else if (returnValue == "false") {
                                writeError('ageerror',"Sorry you must be 18 or older to play.");
                            } else {
                            	writeError('ageerror', "An error occurred. Please try again");	
                            }
                        }
                    }); 
                });


                $('#numplaysform').submit(function(event) {
                    event.preventDefault();
					
                 	var val = $("#plays").val();
                    $.ajax({
                        url : 'PlaysServlet',
                        data : {
                            plays : val
                        },
                        success : function(returnValue) {
                        	var valid = (returnValue != null && returnValue != "");
                            if (valid) {
                            	setPlaysRemaining(val);
                            	setPlays(val);
                            	hideElement('numplaysform');
                            	showElement('lotteryform');
                            	
                            	var play = (plays-(playsRemaining-1)).toString();
                            	var total = plays.toString();
                            	
                            	document.getElementById('gamenumber').innerHTML = "Game: " + play + "/" + total;
                            	document.getElementById('numplaysform').remove();
                            	showElement('lotteryform');
                                
                            } else {
                            	writeError('numplayserror',"Error ...");
                            }
                        }
                    }); 
                });
                
                $('#submitmanual').click(function(event) {
                    event.preventDefault();
                    
                    $.ajax({
                        url : 'ManualInput',
                        data : {
                            num1 : $("#num1").val(),
                            num2 : $("#num2").val(),
                            num3 : $("#num3").val(),
                            num4 : $("#num4").val(),
                            num5 : $("#num5").val(),
                            num6 : $("#num6").val(),
                            num7 : $("#num7").val()
                        },
                        success : function(returnValue) {
                        	
                        	const isValid = (returnValue != null) && (returnValue != "error") && (returnValue != "");
                        	var data;
                        	if (isValid) {
                        		data = returnValue.split(',');
                        		for (var i=0; i<7; i++) {
                        			if (data[i]=='true') {
                        				document.getElementById('num'+(i+1)).style.borderColor = "coral";
                        			}
                        		}
                        		
	                            if (data[7] == "true") {
	                            	writeMsg('lotterymsg', "Congratulations! You are a winner!");
	                            } else if (data[7] == "false") {
	                            	writeMsg('lotterymsg', "Sorry, you are not a winner. :(");
	                            }
	                            
	                            setPlaysRemaining(playsRemaining-1);
	                            updateLotteryForm(data[7]=="true");

                            } else {
                            	writeError('lotterymsg', "An error occurred.. Please try again.");
                            }
                        	
                        	
                        }
                    }); 
                });
                    
                    
                $('#submitgenerated').click(function(event) {
                    event.preventDefault();
                    
                    var numbers = $("#generated_content").text();
                    var nArr = numbers.trim().split(' ');
                    
                    $.ajax({
                        url : 'ManualInput',
                        data : {
                            num1 : nArr[0],
                            num2 : nArr[1],
                            num3 : nArr[2],
                            num4 : nArr[3],
                            num5 : nArr[4],
                            num6 : nArr[5],
                            num7 : nArr[6]
                        },
                        success : function(returnValue) {
                        	
                        	const isValid = (returnValue != null) && (returnValue != "error") && (returnValue != "");
                        	var data;
                        	if (isValid) {
                        		data = returnValue.split(',');
                        		
                        		// Highlight correct generated numbers
                        		var nv = "";
                        		for (var i=0; i<7; i++) {
                        			if (data[i]=='true') {
                        				nv += "<span style='color:coral'>"+nArr[i]+"</span> ";
                        			} else {
                        				nv += nArr[i]+" ";
                        			}
                        		}
                        		$("#generated_content").html(nv);
								// ---
								
	                            if (data[7] == "true") {
	                            	removeLotteryFormButtons();
	                            	writeMsg('lotterymsg', "Congratulations! You are a winner!");
	                            } else if (data[7] == "false") {
	                            	writeMsg('lotterymsg', "Sorry, you are not a winner. &#128542;");
	                            }
	                            
	                            setPlaysRemaining(playsRemaining-1);
	                            updateLotteryForm();

                            } else {
                            	writeError('lotterymsg', "An error occurred.. Please try again.");
                            }
                        	
                        	
                        }
                    }); 
                });
                    
                $('#requestgenerate').click(function(event) {
                	event.preventDefault();
                	$.ajax({
                		url : 'AutoGenerateServlet',
                		data : {},
                		success : function(returnValue) {
                				document.getElementById('generated_content').innerHTML = returnValue;
                			}
                	});
                });
                
                $('#invalidate').click(function(event) {
                	event.preventDefault();
                	
                	$.ajax({
                		url : 'SessionServlet',
                		data : {
                			invalidate : "true"
                		},
                		success : function() {
                			location.replace("index.jsp");
                		}
                	});
                });
                    
                    
            	// Catch when input value is greater than max.
                $('input[type="number"]').on('keyup',function(){
                    v = parseInt($(this).val());
                    min = parseInt($(this).attr('min'));
                    max = parseInt($(this).attr('max'));

                    if (v > max){
                        $(this).val(max);
                    } else if (v < min) {
                    	$(this).val(min);
                    }
                })
                
            });  
        </script>

    </body>
</html>
