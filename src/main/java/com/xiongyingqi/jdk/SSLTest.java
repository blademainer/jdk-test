package com.xiongyingqi.jdk;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;

public class SSLTest {
    public static void main(String[] args) throws IOException {
        URL url = new URL("https://www.baidu.com");
        URLConnection connection = url.openConnection();
        connection.connect();
        InputStream inputStream = connection.getInputStream();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        for (String s = bufferedReader.readLine(); s != null; s = bufferedReader.readLine()) {
            System.out.println(s);
        }
    }
}
