package ee.mrts;

import com.codeborne.selenide.Configuration;

public final class TestConfiguration {

    public static void configure() {
        Configuration.browser = "chrome";
    }

}
