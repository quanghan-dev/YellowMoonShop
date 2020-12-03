package hannq.models;

import hannq.entities.Cake;
import hannq.entities.User;
import java.io.Serializable;
import java.util.HashMap;

/**
 *
 * @author Han Quang
 */
public class ShoppingCart implements Serializable{
    private User user;
    private HashMap<Cake, Integer> cart;
    
    public ShoppingCart() {
        this.cart = new HashMap<>();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public HashMap<Cake, Integer> getCart() {
        return cart;
    }

    public void setCart(HashMap<Cake, Integer> cart) {
        this.cart = cart;
    }
    
    public void addToCart(Cake cake) throws Exception{
        int quantity = 1;
        if(this.cart.containsKey(cake)){
            quantity = this.cart.get(cake) + 1;
        }
        this.cart.put(cake, quantity);
    }
    
    public void remove(Cake cake) throws Exception {
        if(this.cart.containsKey(cake))
            this.cart.remove(cake);
    }
    
    public boolean updateCart(Cake cake, int quantity) throws Exception{
        if(this.cart.containsKey(cake)){
            this.cart.put(cake, quantity);
            return true;
        }
        return false;
    }
    
    public int getQuantity(Cake cake) throws Exception{
        if(this.cart.containsKey(cake)){
            return this.cart.get(cake);
        }
        return 0;
    }
    
    public double getTotal(){
        double total = 0;
        for (Cake cake : cart.keySet()) {
            total += cake.getPrice() * cart.get(cake);
        }
        return total;
    }
}
