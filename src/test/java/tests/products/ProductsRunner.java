package tests.products;

import com.intuit.karate.junit5.Karate;

public class ProductsRunner {
    @Karate.Test
    Karate getProducts(){
        return Karate.run("products-get").relativeTo(getClass());
    }
    @Karate.Test
    Karate postProducts() {
        return Karate.run("products-post").relativeTo(getClass());
    }
    @Karate.Test
    Karate putUser() {
        return Karate.run("user-put").relativeTo(getClass());
    }
    @Karate.Test
    Karate deleteUser() {
        return Karate.run("user-delete").relativeTo(getClass());
    }
}

