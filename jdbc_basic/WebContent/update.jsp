<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String id1= request.getParameter("id") + "         ";
//DB���� ������ ���� ���� ����
Connection conn = null;

//SQL���� �����ų �۾� ������ ����
PreparedStatement pstate = null;

//�����ų SQL������ ������ ������ ���´�.
String sql = "select * from members where id = ?";

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
pstate.setString(1, id1);

//select���� �����Ű�� ��ȯ�Ǵ� record���� rs1�� ��´�.
ResultSet rs1 = pstate.executeQuery();

rs1.next();
String id = rs1.getString("id");
String pwd = rs1.getString("pwd");
String email = rs1.getString("email");
String phone = rs1.getString("phone");
%>

<form method="post" action="update_ok.jsp" >
���̵�: <%=id %>
<input type="hidden" name="id" value="<%=id%>">
���
<input type="text" name="pwd" value="<%=pwd%>">
�̸���
<input type="text" name="email" value="<%=email%>">
��ȭ��ȣ
<input type="text" name="phone" value="<%=phone%>">
<input type="submit" value="����">
<input type="reset" value="���">
</form>
</body>
</html>