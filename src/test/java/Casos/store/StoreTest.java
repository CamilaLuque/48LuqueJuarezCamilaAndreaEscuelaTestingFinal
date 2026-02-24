package Casos.store;

import com.intuit.karate.junit5.Karate;

class StoreTest {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("store").relativeTo(getClass());
    }

}