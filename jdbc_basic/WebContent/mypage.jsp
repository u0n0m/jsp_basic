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
String sessTokenId = "no";
Cookie [] cookies  = request.getCookies();
boolean token_not_found = false;
boolean token_found = false;
for(int i=0; i<cookies.length; i++ ){
	System.out.println("cookie[" + i + "]=" + cookies[i].getName());
	System.out.println("cookie[" + i + "]=" + cookies[i].getValue());
	if(cookies[i].getName().equals("sessToken")){
		%><%=cookies[i].getValue() %><%
		token_found = true;
		sessTokenId = cookies[i].getValue();
	}
	else {
		token_not_found = false;  //sessToken�� �� ã�Ҵ�...
	}
}
if(token_found == false) {
		// jsp�� ������Ų��. or �α����������� ���𷺼�
		response.sendRedirect("login.jsp"); //�α��� �������� ���𷺼�
}

%> <%=sessTokenId %>


</body>
</html>