package jdbc_basic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FormEx
 */
@WebServlet("/FormEx")
public class FormEx extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormEx() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
      System.out.println("doPost");
   
      
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      System.out.println("id="+id);
      String[] hobbys = request.getParameterValues("hobby");
      String major = request.getParameter("major");
      String protocol = request.getParameter("protocol");
      
      PrintWriter writer =response.getWriter();
      response.setCharacterEncoding("EUC-KR");
      response.setContentType("text/html; charset=EUC-KR");
      String test ="아이디:";
      System.out.println("test="+test);
      writer.println("<html><head></head><body>");
      writer.println(test + id + "<br/>");
      writer.println("비밀번호:" + pw + "<br/>");
      writer.println("취미:" + Arrays.toString(hobbys) + "<br/>");
      writer.println("전공:" + major + "<br/>");
      writer.println("프로토콜:" + protocol);
      writer.println("</body></html>");
      
      writer.close();
      
      
   }

}
