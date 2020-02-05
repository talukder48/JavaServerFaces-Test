<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>

<script type="text/javascript">
	function init() {
		document.getElementById("MF:usrname").value = "";
		document.getElementById("MF:password").value = "";
		document.getElementById("MF:usrname").focus();
	}
	function preventDefult() {
		$(document).ready(function() {
			$(window).keydown(function(event) {
				if (event.keyCode == 13) {
					event.preventDefault();
					return false;
				}
			});
		});
	}

	function validateUserId() {
		if (event.keyCode == 13 || event.which == 13) {
			alert("validateUserId");
			document.getElementById("MF:password").focus();
			return true;
		}		
	}
	function ValidatePassword() {
		if (event.keyCode == 13 || event.which == 13) {
			alert("ValidatePassword");
			document.getElementById("MF:Submit").focus();
			return true;
		}		
	}
</script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>
<body onload="init()">
<h1 style="color:green; font-family:impact"><center>Bangladesh House Building Finance Corporation</center></h1></td>

	<f:view>
		<h:form id="MF" onkeypress="return event.keyCode != 13;" style="top:200px">		
		<center>
				<div id="form">
					<h:panelGrid columns="2" frame="none">
						<h:outputLabel for="usrname" value="User Name"></h:outputLabel>						
						<h:inputText id="usrname" value="#{LogInBean.usrname}" onkeypress="validateUserId()">   </h:inputText>
						
						<h:outputLabel for="password" value="Password"></h:outputLabel>
						<h:inputText id="password" value="#{LogInBean.password}" onkeypress="ValidatePassword()"> </h:inputText>												
					</h:panelGrid>				
				</div>
				<div id="save">
					<table border="0" cellspacing="4" cellpadding="1">
						<h:commandButton id="Submit" action="#{LogInBean.Update}" value="LogIn"/>
						<h:commandButton id="Cancel"  value="Forgot password? "/>
					</table>
				</div>
			
		</center>
	  </h:form>
	</f:view>
</body>
</html>