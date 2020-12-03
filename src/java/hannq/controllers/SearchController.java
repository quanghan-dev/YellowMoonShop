package hannq.controllers;

import hannq.blos.CakeBLO;
import hannq.blos.CategoryBLO;
import hannq.entities.Cake;
import hannq.entities.Category;
import hannq.utils.PropertiesUtils;
import java.io.IOException;
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
public class SearchController extends HttpServlet {

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
        String url = properties.getProperties("INDEX_PAGE");
        try {
            int pageSize = 20;
            int currentPage = 1;
            int amountOfCake = 0;
            if (request.getParameter("pageID") != null) {
                currentPage = Integer.parseInt(request.getParameter("pageID"));
            }
            CakeBLO cakeBLO = new CakeBLO();
            List<Cake> listCake = null;
            HttpSession session = request.getSession();
            if (request.getAttribute("VIEW_LIST") != null || request.getParameter("searchType").equals("name")) { //first search and search by name
                String search = request.getParameter("txtSearch");
                if (search == null) {
                    search = "";
                }
                if (session.isNew()) {
                    CategoryBLO ctgrBLO = new CategoryBLO();
                    List<Category> listCategory = ctgrBLO.getCategories();
                    session.setAttribute("LIST_CATEGORY", listCategory);
                }
                listCake = cakeBLO.searchByLikeName(search, currentPage, pageSize);
                amountOfCake = cakeBLO.getAmountOfFindByLikeName(search, pageSize);
                request.setAttribute("SEARCH_TYPE", "name");
                request.setAttribute("TXT_SEARCH", search);
            } else if (request.getParameter("searchType").equals("price")) { //search by price
                int from = Integer.parseInt(request.getParameter("From"));
                int to = Integer.parseInt(request.getParameter("To"));
                listCake = cakeBLO.searchByPrice(from, to, currentPage, pageSize);
                amountOfCake = cakeBLO.getAmountOfFindByPrice(from, to, pageSize);
                request.setAttribute("CHECK_PRICE", 3);
                request.setAttribute("FROM", from);
                request.setAttribute("TO", to);
                request.setAttribute("SEARCH_TYPE", "price");
            } else { //search by category
                int categoryID = Integer.parseInt(request.getParameter("searchByCategory"));
                CategoryBLO ctgrBLO = new CategoryBLO();
                Category category = ctgrBLO.getCategoryByCategoryID(categoryID);
                listCake = (List<Cake>) category.getCakeCollection();
                amountOfCake = cakeBLO.getAmountOfFindByCategory(categoryID, pageSize);
                request.setAttribute("SEARCH_TYPE", "category");
                request.setAttribute("CATEGORY", category);
            }
            request.setAttribute("LIST_CAKE", listCake);
            request.setAttribute("CURRENT_PAGE", currentPage);
            request.setAttribute("CAKE_COUNT", amountOfCake);
        } catch (Exception e) {
            log("ERROR at SearchController: " + e.getMessage());
//            e.printStackTrace();
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
