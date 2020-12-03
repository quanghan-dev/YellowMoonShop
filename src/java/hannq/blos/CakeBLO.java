package hannq.blos;

import hannq.entities.Cake;
import java.io.Serializable;
import java.util.Date;
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
public class CakeBLO implements Serializable {

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
    
    public Cake findByCakeID(int cakeID){
        EntityManager em = emf.createEntityManager();
        Query query = em.createNamedQuery("Cake.findByCakeID");
        query.setParameter("cakeID", cakeID);
        return (Cake) query.getSingleResult();
    }

    public boolean insert(String name, String picture, String description, double price, int quantity, Date createDate, Date expirationDate, int categoryID, String email, String status) {
        EntityManager em = emf.createEntityManager();
        boolean check;
        String sql = "Insert Into tblCake(name, picture, description, price, quantity, createDate, expirationDate, categoryID, lastUpdatedDate, userEmail, status)"
                + " Values (?,?,?,?,?,?,?,?,?,?,?)";
        Query query = em.createNativeQuery(sql);
        em.getTransaction().begin();
        query.setParameter("1", name);
        query.setParameter("2", picture);
        query.setParameter("3", description);
        query.setParameter("4", price);
        query.setParameter("5", quantity);
        query.setParameter("6", createDate);
        query.setParameter("7", expirationDate);
        query.setParameter("8", categoryID);
        query.setParameter("9", createDate);
        query.setParameter("10", email);
        query.setParameter("11", status);
        check = query.executeUpdate() > 0;
        em.getTransaction().commit();
        return check;
    }

    public List<Cake> searchByLikeName(String name, int pageNumber, int pageSize) {
        EntityManager em = emf.createEntityManager();
        String jpql = "SELECT c FROM Cake c\n"
                + "WHERE c.name LIKE :name AND c.status='Active' AND c.quantity > 0\n"
                + "ORDER BY c.createDate DESC";
        Query query = em.createQuery(jpql);
        query.setParameter("name", "%" + name + "%");
        query.setFirstResult((pageNumber - 1) * pageSize);
        query.setMaxResults(pageSize);
        List result = query.getResultList();
        return result;
    }

    public int getAmountOfFindByLikeName(String name, int pageSize) throws Exception{
        int amount = 0;
        EntityManager em = emf.createEntityManager();
        String sql = "SELECT COUNT(cakeID) FROM tblCake WHERE name LIKE ? AND status='Active' AND quantity > 0";
        Query query = em.createNativeQuery(sql);
        em.getTransaction().begin();
        query.setParameter("1", "%" + name + "%");
        amount = (int)query.getSingleResult();
        em.getTransaction().commit();
        if(amount % pageSize == 0)
            return amount / pageSize;
        return amount / pageSize + 1;
    }
    
    public List<Cake> searchByPrice(int priceFrom, int priceTo, int pageNumber, int pageSize) {
        EntityManager em = emf.createEntityManager();
        String jpql = "SELECT c FROM Cake c\n"
                + "WHERE c.price > ?1 AND c.price < ?2 AND c.status='Active' AND c.quantity > 0\n"
                + "ORDER BY c.createDate DESC";
        Query query = em.createQuery(jpql);
        query.setParameter("1", priceFrom);
        query.setParameter("2", priceTo);
        query.setFirstResult((pageNumber - 1) * pageSize);
        query.setMaxResults(pageSize);
        List result = query.getResultList();
        return result;
    }
    
    public int getAmountOfFindByPrice(int from, int to, int pageSize) throws Exception{
        int amount = 0;
        EntityManager em = emf.createEntityManager();
        String sql = "SELECT COUNT(cakeID) FROM tblCake WHERE price > ? AND price < ? AND status='Active' AND quantity > 0";
        Query query = em.createNativeQuery(sql);
        em.getTransaction().begin();
        query.setParameter("1", from);
        query.setParameter("2", to);
        amount = (int)query.getSingleResult();
        em.getTransaction().commit();
        if(amount % pageSize == 0)
            return amount / pageSize;
        return amount / pageSize + 1;
    }
    public int getAmountOfFindByCategory(int categoryID, int pageSize) throws Exception{
        int amount = 0;
        EntityManager em = emf.createEntityManager();
        String sql = "SELECT COUNT(cakeID) FROM tblCake WHERE categoryID = ? AND status='Active' AND quantity > 0";
        Query query = em.createNativeQuery(sql);
        em.getTransaction().begin();
        query.setParameter("1", categoryID);
        amount = (int)query.getSingleResult();
        em.getTransaction().commit();
        if(amount % pageSize == 0)
            return amount / pageSize;
        return amount / pageSize + 1;
    }
    
    public void updateCake(int quantity, Cake cake) throws Exception{
        EntityManager em = emf.createEntityManager();
        cake.setQuantity(quantity);
        em.getTransaction().begin();
        em.merge(cake);
        em.getTransaction().commit();
    }
}
