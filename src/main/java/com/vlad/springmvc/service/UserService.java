package com.vlad.springmvc.service;

import com.vlad.springmvc.model.User;

import java.util.List;

/**
 * Created by vlad on 03-Mar-17.
 */

public interface UserService {

    User findById(int id);

    void saveUser(User user);

    void updateUser(User user);

    void deleteUserByName(String name);

    List<User> findAllUsers();

    User findUserByName(String name);

    List<User> findUsersByName(String name);

    boolean isUserNameUnique(Integer id, String name);

}
