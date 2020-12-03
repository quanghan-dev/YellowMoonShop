package hannq.controllers;

import hannq.blos.CakeBLO;
import hannq.entities.Cake;
import hannq.models.ShoppingCart;
import hannq.utils.PropertiesUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Han Quang
 */
public class UpdateCartController extends HttpServlet {

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
        PropertiesUtils properties = new PropertiesUtils();
        String url = properties.getProperties("SEARCH");
        try {
            String type = request.getParameter("type");
            HttpSession session = request.getSession();
            int cakeID = Integer.parseInt(request.getParameter("cakeID"));
            CakeBLO cakeBLO = new CakeBLO();
            Cake cake = cakeBLO.findByCakeID(cakeID);
            ShoppingCart cart = (ShoppingCart) session.getAttribute("CART");
            switch (type) {
                case "Delete":
                    cart.remove(cake);
                    session.setAttribute("TOTAL", cart.getTotal());
                    session.setAttribute("CART", cart);
                    request.setAttribute("VIEW_LIST", "viewList");
                    break;
                case "Quantity":
                    int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                    if (quantity > cake.getQuantity()) {
                        request.setAttribute("QUANTITY_ERR", "The quantity you had input is greater than what is in stock.");
                        request.setAttribute("VIEW_LIST", "viewList");
                    } else {
                        if (cart.updateCart(cake, quantity)) {
                            session.setAttribute("CART", cart);
                            session.setAttribute("TOTAL", cart.getTotal());
                            request.setAttribute("VIEW_LIST", "viewList");
                        }
                    }
                    break;
            }
        } catch (Exception e) {
            log("ERROR at UpdateCartController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
