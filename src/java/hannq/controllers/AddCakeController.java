package hannq.controllers;

import hannq.blos.CakeBLO;
import hannq.entities.Cake;
import hannq.entities.User;
import hannq.utils.PropertiesUtils;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Han Quang
 */
public class AddCakeController extends HttpServlet {

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
        boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
        if (isMultiPart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            HttpSession session = request.getSession();
            CakeBLO cakeBLO = new CakeBLO();
            try {
                items = upload.parseRequest(request);
                Iterator iter = items.iterator();
                Hashtable params = new Hashtable();
                FileItem fi = null;
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        params.put(item.getFieldName(), item.getString());
                    } else {
                        fi = item;
                    }
                }
                String name = (String) params.get("txtName");
                double price = Double.parseDouble((String) params.get("txtPrice"));
                int quantity = Integer.parseInt((String) params.get("txtQuantity"));
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date expirationDate = dateFormat.parse((String) params.get("txtExDate"));
                Date createDate = dateFormat.parse((String) params.get("txtCreateDate"));
                int categoryID = Integer.parseInt((String) params.get("category"));
                String description = (String) params.get("txtDescription");
                String filename = fi.getName();
                User currentUser = (User) session.getAttribute("USER");
                if (expirationDate.after(createDate)) {
                    if (cakeBLO.insert(name, filename, description, price, quantity, createDate, expirationDate, categoryID, currentUser.getUserEmail(), "Active")) {
                        if (filename != null) {
                            String realPath = getServletContext().getRealPath("/") + "images\\" + filename;
                            File file = new File(realPath);
                            fi.write(file);
                        }
                    }
                    request.setAttribute("VIEW_LIST", "viewList");
                } else {
                    request.setAttribute("INVALID_DATE", "Expiration Date must be after Created Date.");
                    request.setAttribute("VIEW_LIST", "viewList");
                    Cake cake = new Cake(null, name, price, description, quantity, createDate, expirationDate, createDate, "Active");
                    request.setAttribute("CAKE", cake);
                }

            } catch (Exception e) {
                if (e.getMessage().contains("already exists")) {
                    request.setAttribute("VIEW_LIST", "viewList");
                } else {
                    log("ERROR at AddCakeController: " + e.getMessage());
                }
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
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
