<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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

//DB���� ������ ���� ���� ����
Connection conn = null;

//SQL���� �����ų �۾� ������ ����
PreparedStatement pstate = null;

//�����ų SQL������ ������ ������ ���´�.
String sql = "select * from members where id=?";

//����Ŭ DBMS�� ������ �� ����� ����̹� ����
Class.forName("oracle.jdbc.OracleDriver");

//������ DBMS(����Ŭ)�� ���� �ʼ� ���� ����
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String db_id = "test";
String db_pwd = "1234";

//���� ������ �̸� �غ��س��� ������ �̿��Ͽ� DBMS�� �����Ѵ�.
//conn�̶�� ������(Connection��ü) ���������� �������.
conn  = DriverManager.getConnection(url, db_id, db_pwd);

//sql�̶�� ������ ����� SQL������ �����ų �غ� �Ѵ�.
pstate = conn.prepareStatement(sql);
pstate.setString(1, sessTokenId);

//select���� �����Ű�� ��ȯ�Ǵ� record���� rs1�� ��´�.
ResultSet rs1 = pstate.executeQuery();

String result;
rs1.next();
String name = rs1.getString("name");



%> <%=name %>


</body>
</html>