package com.nyist.ssm.domain;

/**
 * Created with IntelliJ IDEA.
 * User: 子玉
 * Date: 2017-11-20
 * Time: 20:04
 * Description:添加人员信息
 */
public class Person {
    private Integer id ;
    private String name ;
    private String phone  ;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}