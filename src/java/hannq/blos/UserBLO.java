package hannq.blos;

import hannq.entities.User;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/*
package hannq.blos;

/**
 *
 * @author Han Quang
 */
public class UserBLO implements Serializable{

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
    
    public User checkLogin(String userEmail, String password) throws Exception {
        User user = null;
        EntityManager em = emf.createEntityManager();
        String jpql = "SELECT u FROM User u WHERE u.userEmail = :userEmail And u.password = :password";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setParameter("userEmail", userEmail);
        query.setParameter("password", password);
        try {
            user = query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
        return user;
    }
}
