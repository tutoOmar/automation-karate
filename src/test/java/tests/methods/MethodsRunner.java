package tests.methods;

import com.intuit.karate.junit5.Karate;

public class MethodsRunner {
    @Karate.Test
    Karate getMethods(){
        return Karate.run("methods-get").relativeTo(getClass());
    }
    @Karate.Test
    Karate postMethods() {
        return Karate.run("methods-post").relativeTo(getClass());
    }
    @Karate.Test
    Karate putMethod() {
        return Karate.run("method-put").relativeTo(getClass());
    }
    @Karate.Test
    Karate deleteMethod() {
        return Karate.run("method-delete").relativeTo(getClass());
    }
}

