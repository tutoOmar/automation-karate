package examples.products;

import com.intuit.karate.junit5.Karate;

public class ProductsRunner {
    @Karate.Test
    Karate getProducts(){
        return Karate.run("products").relativeTo(getClass());
    }
}
