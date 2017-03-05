package com.vlad.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;
import java.util.Locale;
import com.vlad.springmvc.model.User;
import com.vlad.springmvc.service.UserService;

/**
 * Created by vlad on 03-Mar-17.
 */

@Controller
@RequestMapping("/")
public class AppController {

    @Autowired
    UserService service;

    @Autowired
    MessageSource messageSource;

    /*This method will list all existing Users*/
    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        List<User> users = service.findAllUsers();
        model.addAttribute("users", users);
        return "allusers";
    }

    /*This method will provide the medium to add a new User*/
    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "registration";
    }

    /*
     * This method will be called on form submission, handling POST request for
     * saving Users in database. It also validates the user input
     */
    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result,
                           ModelMap model, @PathVariable String name) {
        if (result.hasErrors()) {
            return "registration";
        }

        if (!service.isUserNameUnique(user.getId(), user.getName())) {
            FieldError nameError = new FieldError("user", "name", messageSource.getMessage("non.unique.name", new String[] {user.getName()}, Locale.getDefault()));
            result.addError(nameError);
            return "registration";
        }

        service.updateUser(user);

        model.addAttribute("success", "User " + user.getName() + " updated successfully");
        return "success";
    }

    /*
     * This method will delete an user by it's Name value.
     *
     */
    @RequestMapping(value = {"/delete-{name}-user"}, method = RequestMethod.GET)
    public String deleteUser(@PathVariable String name) {
        service.deleteUserByName(name);
        return "redirect:/list";
    }



}
