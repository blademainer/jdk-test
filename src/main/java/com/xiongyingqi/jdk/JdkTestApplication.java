package com.xiongyingqi.jdk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;


@SpringBootApplication
public class JdkTestApplication {

    public static void main(String[] args) throws IOException {
        SpringApplication.run(JdkTestApplication.class, args);
        SSLTest.main(args);
    }

}

//public class SSLTest {
//    public static void main(String[] args) throws IOException {
//        OkHttpClient okHttpClient = new OkHttpClient();
//        Request request = new Request.Builder().get().url("https://www.baidu.com").build();
//        Response response = okHttpClient.newCall(request).execute();
//        ResponseBody body = response.body();
//        System.out.println(body.string());
//
////        URL url = new URL("https://www.baidu.com");
////        URLConnection connection = url.openConnection();
////        InputStream inputStream = connection.getInputStream();
////        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
////        for (String s = bufferedReader.readLine(); s != null; s = bufferedReader.readLine()) {
////            System.out.println(s);
////        }
//    }
//}
