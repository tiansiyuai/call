package com.nyist.ssm.service.impl;

import com.nyist.ssm.dao.BaseDao;
import com.nyist.ssm.dao.impl.PersonDaoImpl;
import com.nyist.ssm.domain.Person;
import com.nyist.ssm.service.PersonService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 *
 */
@Service("personService")
public class PersonServiceImpl extends BaseServiceImpl<Person> implements PersonService{

    @Override
    @Resource(name="personDao")
    public void setDao(BaseDao<Person> dao) {
        super.setDao(dao);
    }

    @Override
    public String selectNameByPhone(String phone){
        return ((PersonDaoImpl)getDao()).selectNameByPhone(phone) ;
    }
}