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
//DB연결 정보를 담을 변수 생성
Connection conn = null;

//SQL문을 실행시킬 작업 공간을 생성
PreparedStatement pstate = null;

//실행시킬 SQL구문을 변수에 저장해 놓는다.
String sql = "select * from members where id = ?";

//오라클 DBMS에 접속할 때 사용할 드라이버 지정
Class.forName("oracle.jdbc.OracleDriver");

//접속할 DBMS(오라클)에 대한 필수 정보 지정
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String db_id = "test";
String db_pwd = "1234";

//드디어 위에서 미리 준비해놓은 정보를 이용하여 DBMS에 접속한다.
//conn이라는 변수에(Connection객체) 연결정보가 담겨진다.
conn  = DriverManager.getConnection(url, db_id, db_pwd);

//sql이라는 변수에 저장된 SQL구문을 실행시킬 준비를 한다.
pstate = conn.prepareStatement(sql);
pstate.setString(1, id1);

//select문을 실행시키고 반환되는 record들을 rs1에 담는다.
ResultSet rs1 = pstate.executeQuery();

rs1.next();
String id = rs1.getString("id");
String pwd = rs1.getString("pwd");
String email = rs1.getString("email");
String phone = rs1.getString("phone");
%>

<form method="post" action="update_ok.jsp" >
아이디: <%=id %>
<input type="hidden" name="id" value="<%=id%>">
비번
<input type="text" name="pwd" value="<%=pwd%>">
이메일
<input type="text" name="email" value="<%=email%>">
전화번호
<input type="text" name="phone" value="<%=phone%>">
<input type="submit" value="수정">
<input type="reset" value="취소">
</form>
</body>
</html>