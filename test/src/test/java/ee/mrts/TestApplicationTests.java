package ee.mrts;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static com.codeborne.selenide.Condition.text;
import static com.codeborne.selenide.Condition.visible;
import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.open;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestApplicationTests {

    @BeforeClass
    public static void setUp() {
        TestConfiguration.configure();
    }

    @Test
    public void searchSelenideInGoogle() {
        open("http://google.com/ncr");
        $(By.name("q")).val("selenide").pressEnter();
        $("#ires .g").shouldBe(visible).shouldHave(text("Selenide: concise UI tests in Java"));
    }

}
