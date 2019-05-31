package com.nyist.ssm.service;

import com.nyist.ssm.domain.Person;

import java.util.List;

/**
 *
 */
public interface PersonService extends BaseService<Person> {
    public String selectNameByPhone(String phone);
}
