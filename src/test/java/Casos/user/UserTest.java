package Casos.user;

import com.intuit.karate.junit5.Karate;

class UserTest {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("user").relativeTo(getClass());
    }

}
