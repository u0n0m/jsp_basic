<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
���̵� ��й�ȣ �̸��� ��ȭ��ȣ

<%
//DB���� ������ ���� ���� ����
Connection conn = null;

//SQL���� �����ų �۾� ������ ����
PreparedStatement pstate = null;

//�����ų SQL������ ������ ������ ���´�.
String sql = "select * from members";

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

//select���� �����Ű�� ��ȯ�Ǵ� record���� rs1�� ��´�.
ResultSet rs1 = pstate.executeQuery();

while(rs1.next() ){
	String id = rs1.getString("id");
	String pwd = rs1.getString("pwd");
	String email = rs1.getString("email");
	String phone = rs1.getString("phone");
%>
<br><br>
<tr>
<td><%=id%> </td>
<td><%=pwd%></td>
<td><%=email%></td>
<td><%=phone%></td>
</tr>
<%
}
%>

</body>
</html>