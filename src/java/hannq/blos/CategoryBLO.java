package hannq.blos;

import hannq.entities.Category;
import java.io.Serializable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Han Quang
 */
public class CategoryBLO implements Serializable{

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("YellowMoonShopPU");

    public void persist(Object object) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }
    
    public List<Category> getCategories(){
        EntityManager em = emf.createEntityManager();
        Query query = em.createNamedQuery("Category.findAll");
        return query.getResultList();
    }
    
    public Category getCategoryByCategoryID(int categoryID){
        EntityManager em = emf.createEntityManager();
        Query query = em.createNamedQuery("Category.findByCategoryID");
        query.setParameter("categoryID", categoryID);
        return (Category)query.getSingleResult();
    }
}
