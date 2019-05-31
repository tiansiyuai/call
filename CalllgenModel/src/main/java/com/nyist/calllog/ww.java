package com.nyist.calllog;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Properties;

public class ww {


    public static void main(String[] args) {
                   Properties prop = new Properties();
                   try{
                       InputStream in = new BufferedInputStream (new FileInputStream("E:\\idea-project\\calllog\\CalllgenModel\\src\\main\\resources\\a.properties"));
                       prop.load(in);
                       ///加载属性列表

                       Enumeration en =prop.propertyNames();
                       while(en.hasMoreElements()) {
                                        String strKey = (String) en.nextElement();
                                        String strValue = prop.getProperty(strKey);
                                        System.out.println(strKey + "=" + strValue);
                                    }
                       in.close();

                       ///保存属性到b.properties文件
                       FileOutputStream oFile = new FileOutputStream("E:\\idea-project\\calllog\\CalllgenModel\\src\\main\\resources\\b.properties", true);//true表示追加打开
                       prop.setProperty("phone", "10086");
                       prop.store(oFile, "The New properties file");
                       oFile.close();
                   } catch(Exception e){
                       System.out.println(e);
                         }
                 }
 }

