package hannq.controllers;

import hannq.blos.CakeBLO;
import hannq.blos.OrderingBLO;
import hannq.entities.Cake;
import hannq.entities.OrderDetail;
import hannq.entities.Ordering;
import hannq.entities.User;
import hannq.models.ShoppingCart;
import hannq.utils.PropertiesUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Han Quang
 */
public class SaveCartController extends HttpServlet {

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
            HttpSession session = request.getSession();
            CakeBLO cakeBLO = new CakeBLO();
            String name = request.getParameter("txtNameCart");
            String phoneNum = request.getParameter("txtPhone");
            String shippingAddress = request.getParameter("txtAddress");
            String payment = request.getParameter("payment");
            List<OrderDetail> listOrderDetail = null;
            ShoppingCart cart = (ShoppingCart)session.getAttribute("CART");
            if(cart != null){
                listOrderDetail = new ArrayList<>();
                Ordering ordering = new Ordering((User)session.getAttribute("USER"), new Date(), name, phoneNum, shippingAddress, (double) session.getAttribute("TOTAL"), "Pending", payment, "Unpaid");
                for (Cake cake : cart.getCart().keySet()) {
                    OrderDetail detail = new OrderDetail(ordering, cake, cake.getPrice(), cart.getQuantity(cake));
                    listOrderDetail.add(detail);
                    cakeBLO.updateCake(cake.getQuantity() - cart.getQuantity(cake), cake);
                }
                ordering.setOrderDetailCollection(listOrderDetail);
                OrderingBLO orderingBLO = new OrderingBLO();
                orderingBLO.addOrder(ordering);
                request.setAttribute("SAVE_CART_MESSAGE", "Your orderID: " + ordering.getOrderID());
                request.setAttribute("VIEW_LIST", "viewList");
                session.removeAttribute("CART");
                session.removeAttribute("TOTAL");
            }
        } catch (Exception e) {
            log("ERROR at SaveCartController: " + e.getMessage());
//            e.printStackTrace();
        } finally{
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
