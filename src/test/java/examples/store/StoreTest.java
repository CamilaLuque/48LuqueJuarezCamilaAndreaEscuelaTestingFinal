package examples.store;

import com.intuit.karate.junit5.Karate;

class StoreTest {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("src/test/java/features/store.feature").relativeTo(getClass());
    }

}