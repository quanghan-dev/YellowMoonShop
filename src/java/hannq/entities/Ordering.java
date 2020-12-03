/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hannq.entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Han Quang
 */
@Entity
@Table(name = "tblOrdering", catalog = "YellowMoonShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ordering.findAll", query = "SELECT o FROM Ordering o"),
    @NamedQuery(name = "Ordering.findByOrderID", query = "SELECT o FROM Ordering o WHERE o.orderID = :orderID"),
    @NamedQuery(name = "Ordering.findByOrderDate", query = "SELECT o FROM Ordering o WHERE o.orderDate = :orderDate"),
    @NamedQuery(name = "Ordering.findByName", query = "SELECT o FROM Ordering o WHERE o.name = :name"),
    @NamedQuery(name = "Ordering.findByPhoneNum", query = "SELECT o FROM Ordering o WHERE o.phoneNum = :phoneNum"),
    @NamedQuery(name = "Ordering.findByShippingAddress", query = "SELECT o FROM Ordering o WHERE o.shippingAddress = :shippingAddress"),
    @NamedQuery(name = "Ordering.findByTotal", query = "SELECT o FROM Ordering o WHERE o.total = :total"),
    @NamedQuery(name = "Ordering.findByOrderStatus", query = "SELECT o FROM Ordering o WHERE o.orderStatus = :orderStatus"),
    @NamedQuery(name = "Ordering.findByPaymentMethod", query = "SELECT o FROM Ordering o WHERE o.paymentMethod = :paymentMethod"),
    @NamedQuery(name = "Ordering.findByPaymentStatus", query = "SELECT o FROM Ordering o WHERE o.paymentStatus = :paymentStatus")})
public class Ordering implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "orderID", nullable = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderID;
    @Basic(optional = false)
    @Column(name = "orderDate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    @Basic(optional = false)
    @Column(name = "name", nullable = false, length = 100)
    private String name;
    @Basic(optional = false)
    @Column(name = "phoneNum", nullable = false, length = 20)
    private String phoneNum;
    @Basic(optional = false)
    @Column(name = "shippingAddress", nullable = false, length = 1073741823)
    private String shippingAddress;
    @Basic(optional = false)
    @Column(name = "total", nullable = false)
    private double total;
    @Basic(optional = false)
    @Column(name = "orderStatus", nullable = false, length = 10)
    private String orderStatus;
    @Basic(optional = false)
    @Column(name = "paymentMethod", nullable = false, length = 100)
    private String paymentMethod;
    @Basic(optional = false)
    @Column(name = "paymentStatus", nullable = false, length = 10)
    private String paymentStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderID")
    private Collection<OrderDetail> orderDetailCollection;
    @JoinColumn(name = "userEmail", referencedColumnName = "userEmail")
    @ManyToOne
    private User userEmail;

    public Ordering() {
    }

    public Ordering(Integer orderID) {
        this.orderID = orderID;
    }

    public Ordering(User user, Date orderDate, String name, String phoneNum, String shippingAddress, double total, String orderStatus, String paymentMethod, String paymentStatus) {
        this.userEmail = user;
        this.orderID = null;
        this.orderDate = orderDate;
        this.name = name;
        this.phoneNum = phoneNum;
        this.shippingAddress = shippingAddress;
        this.total = total;
        this.orderStatus = orderStatus;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    @XmlTransient
    public Collection<OrderDetail> getOrderDetailCollection() {
        return orderDetailCollection;
    }

    public void setOrderDetailCollection(Collection<OrderDetail> orderDetailCollection) {
        this.orderDetailCollection = orderDetailCollection;
    }

    public User getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(User userEmail) {
        this.userEmail = userEmail;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderID != null ? orderID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ordering)) {
            return false;
        }
        Ordering other = (Ordering) object;
        if ((this.orderID == null && other.orderID != null) || (this.orderID != null && !this.orderID.equals(other.orderID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "hannq.entities.Ordering[ orderID=" + orderID + " ]";
    }
    
}
