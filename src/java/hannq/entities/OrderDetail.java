package hannq.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Han Quang
 */
@Entity
@Table(name = "tblOrderDetail", catalog = "YellowMoonShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetail.findAll", query = "SELECT o FROM OrderDetail o"),
    @NamedQuery(name = "OrderDetail.findByDetailID", query = "SELECT o FROM OrderDetail o WHERE o.detailID = :detailID"),
    @NamedQuery(name = "OrderDetail.findByPrice", query = "SELECT o FROM OrderDetail o WHERE o.price = :price"),
    @NamedQuery(name = "OrderDetail.findByQuantity", query = "SELECT o FROM OrderDetail o WHERE o.quantity = :quantity")})
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "detailID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer detailID;
    @Basic(optional = false)
    @Column(name = "price", nullable = false)
    private double price;
    @Basic(optional = false)
    @Column(name = "quantity", nullable = false)
    private int quantity;
    @JoinColumn(name = "cakeID", referencedColumnName = "cakeID", nullable = false)
    @ManyToOne(optional = false)
    private Cake cakeID;
    @JoinColumn(name = "orderID", referencedColumnName = "orderID", nullable = false)
    @ManyToOne(optional = false)
    private Ordering orderID;

    public OrderDetail() {
    }

    public OrderDetail(Integer detailID) {
        this.detailID = detailID;
    }

    public OrderDetail(Ordering orderID, Cake cakeID, double price, int quantity) {
        this.detailID = null;
        this.orderID = orderID;
        this.cakeID = cakeID;
        this.price = price;
        this.quantity = quantity;
    }

    public Integer getDetailID() {
        return detailID;
    }

    public void setDetailID(Integer detailID) {
        this.detailID = detailID;
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

    public Cake getCakeID() {
        return cakeID;
    }

    public void setCakeID(Cake cakeID) {
        this.cakeID = cakeID;
    }

    public Ordering getOrderID() {
        return orderID;
    }

    public void setOrderID(Ordering orderID) {
        this.orderID = orderID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (detailID != null ? detailID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetail)) {
            return false;
        }
        OrderDetail other = (OrderDetail) object;
        if ((this.detailID == null && other.detailID != null) || (this.detailID != null && !this.detailID.equals(other.detailID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "hannq.entities.OrderDetail[ detailID=" + detailID + " ]";
    }
    
}
