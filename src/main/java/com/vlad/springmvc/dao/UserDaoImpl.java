package com.vlad.springmvc.dao;

import com.vlad.springmvc.model.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository("userDao")
@Transactional(readOnly = true)
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

    private static final int PAGE_SIZE = 10;


    @Override
    public User findById(int id) {
        return getByKey(id);
    }

    @Override
    @Transactional
    public void saveUser(User user) {
        persist(user);
    }

    @Override
    @Transactional
    public void deleteUserById(int id) {
        Query query = getSession().createSQLQuery("delete from test where id = :id");
        query.setInteger("id", id);
        query.executeUpdate();
    }

    /*Maybe contains bugs*/
    @Override
    @SuppressWarnings("unchecked")
    public List<User> findUsersByName(String name) {
        SQLQuery query = getSession().createSQLQuery("SELECT * FROM test.test WHERE name = :name");
        query.setParameter("name", name);
        query.addEntity(User.class);

        return (List<User>) query.list();
    }

    @Override
    public PagedListHolder<User> pagedListUsers(int page) {
        Criteria criteria = createEntityCriteria();
        List<User> list = criteria.list();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(list);
        pagedListHolder.setPageSize(PAGE_SIZE);
        pagedListHolder.setPage(page);
        return pagedListHolder;

    }
    /*Maybe contains bugs*/
}


