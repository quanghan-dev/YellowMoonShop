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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
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
@Table(name = "tblCake", catalog = "YellowMoonShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cake.findAll", query = "SELECT c FROM Cake c"),
    @NamedQuery(name = "Cake.findByCakeID", query = "SELECT c FROM Cake c WHERE c.cakeID = :cakeID And c.status = 'Active'"),
    @NamedQuery(name = "Cake.findByName", query = "SELECT c FROM Cake c WHERE c.name = :name"),
    @NamedQuery(name = "Cake.findByPicture", query = "SELECT c FROM Cake c WHERE c.picture = :picture"),
    @NamedQuery(name = "Cake.findByPrice", query = "SELECT c FROM Cake c WHERE c.price = :price"),
    @NamedQuery(name = "Cake.findByQuantity", query = "SELECT c FROM Cake c WHERE c.quantity = :quantity"),
    @NamedQuery(name = "Cake.findByCreateDate", query = "SELECT c FROM Cake c WHERE c.createDate = :createDate"),
    @NamedQuery(name = "Cake.findByExpirationDate", query = "SELECT c FROM Cake c WHERE c.expirationDate = :expirationDate"),
    @NamedQuery(name = "Cake.findByLastUpdatedDate", query = "SELECT c FROM Cake c WHERE c.lastUpdatedDate = :lastUpdatedDate"),
    @NamedQuery(name = "Cake.findByStatus", query = "SELECT c FROM Cake c WHERE c.status = :status")})
public class Cake implements Serializable {

    @Basic(optional = false)
    @Lob
    @Column(name = "description", nullable = false, length = 2147483647)
    private String description;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cakeID")
    private Collection<OrderDetail> orderDetailCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "cakeID", nullable = false)
    private Integer cakeID;
    @Basic(optional = false)
    @Column(name = "name", nullable = false, length = 100)
    private String name;
    @Column(name = "picture", length = 500)
    private String picture;
    @Basic(optional = false)
    @Column(name = "price", nullable = false)
    private double price;
    @Basic(optional = false)
    @Column(name = "quantity", nullable = false)
    private int quantity;
    @Basic(optional = false)
    @Column(name = "createDate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Basic(optional = false)
    @Column(name = "expirationDate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date expirationDate;
    @Basic(optional = false)
    @Column(name = "lastUpdatedDate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastUpdatedDate;
    @Basic(optional = false)
    @Column(name = "status", nullable = false, length = 10)
    private String status;
    @JoinColumn(name = "categoryID", referencedColumnName = "categoryID", nullable = false)
    @ManyToOne(optional = false)
    private Category categoryID;
    @JoinColumn(name = "userEmail", referencedColumnName = "userEmail", nullable = false)
    @ManyToOne(optional = false)
    private User userEmail;

    public Cake() {
    }

    public Cake(Integer cakeID) {
        this.cakeID = cakeID;
    }

    public Cake(Integer cakeID, String name, double price, String description, int quantity, Date createDate, Date expirationDate, Date lastUpdatedDate, String status) {
        this.cakeID = cakeID;
        this.name = name;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.createDate = createDate;
        this.expirationDate = expirationDate;
        this.lastUpdatedDate = lastUpdatedDate;
        this.status = status;
    }

    public Integer getCakeID() {
        return cakeID;
    }

    public void setCakeID(Integer cakeID) {
        this.cakeID = cakeID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Date getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(Date lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Category getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(Category categoryID) {
        this.categoryID = categoryID;
    }

    public User getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(User userEmail) {
        this.userEmail = userEmail;
    }

    @XmlTransient
    public Collection<OrderDetail> getOderDetailCollection() {
        return orderDetailCollection;
    }

    public void setOderDetailCollection(Collection<OrderDetail> orderDetailCollection) {
        this.orderDetailCollection = orderDetailCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cakeID != null ? cakeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cake)) {
            return false;
        }
        Cake other = (Cake) object;
        if ((this.cakeID == null && other.cakeID != null) || (this.cakeID != null && !this.cakeID.equals(other.cakeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "hannq.entities.Cake[ cakeID=" + cakeID + " ]";
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
