/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/enviarpedido"})
public class enviarpedido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            Persistencia base = new Persistencia();
            
            request.setCharacterEncoding("UTF-8");

            int lineas = base.insertSQL("insert into pedidos (nombre, apellido, "
                    + "usuario, mail, lugarentrega, localidad, provincia, codpostal, "
                    + "formadepago, tarjtitular, tarjnumero, tarjvto, tarjclave) values ('"
                    + request.getParameter("firstName") + "', '"
                    + request.getParameter("lastName") + "', '"
                    + request.getParameter("username") + "', '"
                    + request.getParameter("email") + "', '"
                    + request.getParameter("address") + "', ("
                    + "select idlocalidad from localidades where nombre = '"
                    + request.getParameter("city") + "'), ("
                    + "select idprovincia from provincias where nombre = '"
                    + request.getParameter("state") + "'), '"
                    + request.getParameter("zip") + "', '"
                    + request.getParameter("paymentMethod") + "', '"
                    + request.getParameter("cc-name") + "', '"
                    + request.getParameter("cc-number") + "', '"
                    + request.getParameter("cc-expiration") + "', "
                    + request.getParameter("cc-cvv") + ")");
            
            if (lineas != 0){
                out.println("El pedido ha sido ingresado correctamente.");
            } else {
                out.println("Ha ocurrido un error al ingresar el pedido, intente nuevamente.");
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
