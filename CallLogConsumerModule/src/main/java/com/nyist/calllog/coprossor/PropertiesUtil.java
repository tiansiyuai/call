package com.nyist.calllog.coprossor;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * User: 子玉
 * Date: 2017-11-17
 * Time: 15:34
 * Description:
 */
public class PropertiesUtil {
    public static Properties props ;
    static{
        try {
            //加载外部属性文件
            InputStream in = ClassLoader.getSystemResourceAsStream("kafka.properties");
            props = new Properties();
            props.load(in);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getProp(String key)
    {
        return props.getProperty(key) ;
    }
}
