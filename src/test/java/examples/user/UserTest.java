package examples.user;

import com.intuit.karate.junit5.Karate;

class UserTest {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("src/test/java/features/user.feature").relativeTo(getClass());
    }    

}
