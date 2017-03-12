package com.vlad.springmvc.dao;

import com.vlad.springmvc.model.User;
import org.springframework.beans.support.PagedListHolder;

import java.util.List;

public interface UserDao {

    User findById(int id);

    void saveUser(User user);

    void deleteUserById(int id);

    List<User> findAllUsers();

//    User findUserByName(String name);

    List<User> findUsersByName(String name);

    PagedListHolder<User> pagedListUsers(int page);

}
