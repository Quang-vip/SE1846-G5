/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.ApartmentTypeDAO;
import model.ApartmentType;

/**
 *
 * @author Admin
 */
@WebServlet(name="UpdateApartmentType", urlPatterns={"/UpdateApartmentType"})
public class UpdateApartmentType extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateApartmentType</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateApartmentType at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String typeIDStr = request.getParameter("typeID");
        String size = request.getParameter("size");
        String baseRentStr = request.getParameter("baseRent");

        int typeID = 0;
        double baseRent = 0;
        boolean hasError = false;

        if (typeIDStr == null || typeIDStr.isEmpty()) {
            request.setAttribute("typeIDError", "Type ID is required.");
            hasError = true;
        } else {
            typeID = Integer.parseInt(typeIDStr);
        }

        if (size == null || size.isEmpty()) {
            request.setAttribute("sizeError", "Size is required.");
            hasError = true;
        }

        if (baseRentStr == null || baseRentStr.isEmpty()) {
            request.setAttribute("baseRentError", "Base rent is required.");
            hasError = true;
        } else {
            baseRent = Double.parseDouble(baseRentStr);
            if (baseRent <= 0) {
                request.setAttribute("baseRentError", "Base rent must be greater than 0.");
                hasError = true;
            }
        }

        if (hasError) {
            request.getRequestDispatcher("landlord.jsp").forward(request, response);
        } else {
            ApartmentType apartmentType = new ApartmentType(typeID, size, baseRent);
            ApartmentTypeDAO apartmentTypeDAO = new ApartmentTypeDAO();
            apartmentTypeDAO.updateApartmentType(apartmentType);
            response.sendRedirect("landlord.jsp?typeID=" + typeID);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
