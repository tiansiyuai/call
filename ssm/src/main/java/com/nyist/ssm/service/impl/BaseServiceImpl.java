package com.nyist.ssm.service.impl;

import com.nyist.ssm.dao.BaseDao;
import com.nyist.ssm.service.BaseService;

import java.util.List;

/**
 * Created by Administrator on 2017/11/17
 * @author z
 */
public abstract class BaseServiceImpl<T> implements BaseService<T> {

    private BaseDao<T> dao ;

    public void setDao(BaseDao<T> dao) {
        this.dao = dao;
    }

    public BaseDao<T> getDao() {
        return dao;
    }

    @Override
    public void insert(T t) {
        dao.insert(t);
    }

    @Override
    public void update(T t) {
        dao.update(t);
    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public T selectOne(Integer id) {
        return dao.selectOne(id);
    }

    @Override
    public List<T> selectAll() {
        return dao.selectAll();
    }

    /**
     * 分页查询
     */
    @Override
    public List<T> selectPage(int offset, int len){
        return dao.selectPage(offset,len);
    }

    @Override
    public int selectCount() {
        return dao.selectCount();
    }
}
