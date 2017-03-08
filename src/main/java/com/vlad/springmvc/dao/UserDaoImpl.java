package com.vlad.springmvc.dao;

import com.vlad.springmvc.model.User;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {


    @Override
    public User findById(int id) {
        return getByKey(id);
    }

    @Override
    public void saveUser(User user) {
        persist(user);
    }

    @Override
    public void deleteUserByName(String name) {
        Query query = getSession().createSQLQuery("delete from test where name = :name");
        query.setString("name", name);
        query.executeUpdate();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> findAllUsers() {
        Criteria criteria = createEntityCriteria();
        return (List<User>) criteria.list();
    }

    @Override
    public User findUserByName(String name) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("name", name));
        return (User) criteria.uniqueResult();
    }

    /*Maybe contains bugs*/
    @Override
    @SuppressWarnings("unchecked")
    public List<User> findUsersByName(String name) {
        SQLQuery query = getSession().createSQLQuery("SELECT {usr.*} from test usr where usr.name = :name");
        query.setParameter("name", name);
        query.addEntity("usr", User.class);

        return (List<User>) query.list();
    }

    @Override
    public PagedListHolder<User> pagedListUsers(int page) {
        Criteria criteria = createEntityCriteria();
        List<User> list = criteria.list();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(list);
        pagedListHolder.setPageSize(10);
        pagedListHolder.setPage(page);
        return pagedListHolder;

    }
    /*Maybe contains bugs*/
}


