package com.nyist.ssm.dao.impl;

/**
 * Created with IntelliJ IDEA.
 * User: 子玉
 * Date: 2017-11-20
 * Time: 20:07
 * Description:
 */
import com.nyist.ssm.dao.BaseDao;
import com.nyist.ssm.domain.Person;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 */
@Repository("personDao")
public class PersonDaoImpl extends SqlSessionDaoSupport implements BaseDao<Person> {
    @Override
    public void insert(Person person) {
        getSqlSession().insert("persons.insert",person) ;
    }

    @Override
    public void update(Person person) {

    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public Person selectOne(Integer id) {
        return null;
    }

    @Override
    public List<Person> selectAll() {
        return getSqlSession().selectList("persons.selectAll");
    }

    @Override
    public List<Person> selectPage(int offset, int len) {
        return null;
    }

    @Override
    public int selectCount() {
        return 0;
    }

    //按照号码查询用户
    public String selectNameByPhone(String phone){
        return getSqlSession().selectOne("persons.selectNameByPhone",phone);
    }
}