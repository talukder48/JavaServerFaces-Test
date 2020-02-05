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
<title>Accounting Setup</title>
</head>
<body>
	<h1 style="color: green; font-family: impact">
		<center>Bangladesh House Building Finance Corporation</center>
	</h1>
	</td>
	<center>
		<h1>GL Setup</h1>

		<f:view>
			<h:form id="MF" onkeypress="return event.keyCode != 13;"
				style="top:200px">
				<center>
					<div id="form">
						<h:panelGrid columns="2" frame="none">
							<h:outputLabel for="glCode" value="GL Code"></h:outputLabel>
							<h:inputText id="glCode"
								value="#{GLSetupBean.glCode}"
								onkeypress="validateUserId()">
							</h:inputText>

							<h:outputLabel for="glName" value="GL Name"></h:outputLabel>
							<h:inputText id="glName"
								value="#{GLSetupBean.glName}"
								onkeypress="ValidatePassword()">
							</h:inputText>

							<h:outputLabel for="glDescription"
								value="GL Description"></h:outputLabel>
							<h:inputTextarea id="glDescription"
								value="#{GLSetupBean.glDescription}"
								onkeypress="ValidatePassword()">
							</h:inputTextarea>

						</h:panelGrid>
					</div>
					<div id="save">
						<table border="0" cellspacing="4" cellpadding="1">
							<h:commandButton id="Submit"
								action="#{GLSetupBean.Update}" value="Save" />
						</table>
					</div>

				</center>
			</h:form>

		</f:view>
	</center>

</body>
</html>