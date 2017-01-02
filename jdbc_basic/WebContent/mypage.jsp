<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String error ="Login First!!";
Cookie [] cookies  = request.getCookies();
for(int i=0; i<cookies.length; i++ ){
	System.out.println("cookie[" + i + "]=" + cookies[i].getName());
	System.out.println("cookie[" + i + "]=" + cookies[i].getValue());
	if(cookies[i].getName().equals("sessToken")){
		%><%=cookies[i].getValue() %><%
	}
}
%>


</body>
</html>