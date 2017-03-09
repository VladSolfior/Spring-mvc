package com.vlad.springmvc.service;

import com.vlad.springmvc.dao.UserDao;
import com.vlad.springmvc.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by vlad on 03-Mar-17.
 */

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;


    @Override
    public User findById(int id) {
        return dao.findById(id);
    }

    @Override
    public void saveUser(User user) {
        dao.saveUser(user);
    }

    /*
     * Since the method is running with Transaction, No need to call hibernate update explicitly.
     * Just fetch the entity from db and update it with proper values within transaction.
     * It will be updated in db once transaction ends.
     */
    @Override
    public void updateUser(User user) {
        User entity = dao.findById(user.getId());
        if (entity != null) {
            entity.setName(user.getName());
            entity.setCreatedDate(user.getCreatedDate());
            entity.setAge(user.getAge());
            entity.setAdmin(user.isAdmin());
        }
    }

    @Override
    public void deleteUserById(int id) {
        dao.deleteUserById(id);

    }

    @Override
    public List<User> findAllUsers() {
        return dao.findAllUsers();
    }

    @Override
    public User findUserByName(String name) {
        return dao.findUserByName(name);
    }

    @Override
    public List<User> findUsersByName(String name) {
        return dao.findUsersByName(name);
    }

    @Override
    public PagedListHolder<User> pagedListUsers(int page) {
        return dao.pagedListUsers(page);
    }
}
