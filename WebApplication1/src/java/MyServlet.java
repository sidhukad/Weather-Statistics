import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author sidhu
 */
public class MyServlet extends HttpServlet {
    
    private Connection con;
    private Statement stmt; 
    private final String driverName = "org.apache.hadoop.hive.jdbc.HiveDriver";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
      
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection("jdbc:hive://localhost:10000/default", "hive", "");
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
            System.exit(1);
        }
        /*
        stmt = con.createStatement();
        String sql = "show tables";
        System.out.println("Running: " + sql);
        ResultSet res = stmt.executeQuery(sql);
        if (res.next()) {
            System.out.println(res.getString(1));
        }
        */
        try (PrintWriter out = response.getWriter()) {
            //out.println("Searching and formating the data absed on your search..");
            String select1 = request.getParameter("sel1");
            String select2 = request.getParameter("sel2");
            String crt = "";
            if("year".equals(select2)) {
                crt = request.getParameter("crt");
		stmt = con.createStatement();
                //String sql = "insert overwrite local directory '/src/java/hiveOutput' select MAX("+select1+") as MAX, state as STATE from climate1 where year='"+crt+"' group by state";
                if("temp".equals(select1)) {
                    String sql = "insert overwrite local directory '/Users/sidhu/NetBeansProjects/WebApplication1/web/output' row format delimited fields terminated by ',' stored as textfile select MAX(max_temp) as max_value,MIN(min_temp) as min_value, state as state from climate1 where year='"+crt+"' group by state";
                    stmt.execute(sql);
                } else {
                    String sql = "insert overwrite local directory '/Users/sidhu/NetBeansProjects/WebApplication1/web/output' row format delimited fields terminated by ',' stored as textfile select MAX("+select1+") as max_value,MIN("+select1+") as min_value, state as state from climate1 where year='"+crt+"' group by state";
                    stmt.execute(sql);
                }
            }
            if("state".equals(select2)) {
                crt = request.getParameter("crt");
		stmt = con.createStatement();
                //String sql = "insert overwrite local directory '/src/java/hiveOutput' select MAX("+select1+") as MAX, year as YEAR from climate1 where state ='"+crt+"' group by year";
                if("temp".equals(select1)) {
                    String sql = "insert overwrite local directory '/Users/sidhu/NetBeansProjects/WebApplication1/web/output' row format delimited fields terminated by ',' stored as textfiel select MAX(max_temp) as MAX,MIN(min_temp)as min_value, year as YEAR from climate1 where state ='"+crt+"' group by year";
                    stmt.execute(sql);
                } else {
                    String sql = "insert overwrite local directory '/Users/sidhu/NetBeansProjects/WebApplication1/web/output' row format delimited fields terminated by ',' stored as textfiel select MAX("+select1+") as MAX,MIN("+select1+")as min_value, year as YEAR from climate1 where state ='"+crt+"' group by year";
                    stmt.execute(sql);
                }
            }
             /*
             ServletContext ctxt = getServletContext();
             RequestDispatcher view = ctxt.getRequestDispatcher("/new.html");
             //if("year".equals(select2)) {
                //out.println("Maximum and Minimum statistics of "+select1+" for all states in year "+crt);
                view.forward(request, response);
             *///}
             //if("state".equals(select1)) {
              //  out.println("Maximum and Minimum statistics of "+select1+" for "+crt+" from 2012 to 2014");
               // view.include(request, response);
            // }
            response.sendRedirect("new.html");
        } finally {
            stmt.close();
            con.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(MyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(MyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
