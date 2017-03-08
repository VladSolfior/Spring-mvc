package com.vlad.springmvc.dao;

import com.vlad.springmvc.model.User;

import java.util.List;

public interface UserDao {

    User findById(int id);

    void saveUser(User user);

    void deleteUserByName(String name);

    List<User> findAllUsers();

    User findUserByName(String name);

    List<User> findUsersByName(String name);

}
