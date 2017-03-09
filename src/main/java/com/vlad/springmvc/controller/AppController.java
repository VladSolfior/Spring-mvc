package com.vlad.springmvc.controller;

import com.vlad.springmvc.model.User;
import com.vlad.springmvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class AppController {

    @Autowired
    UserService service;

    @Autowired
    MessageSource messageSource;

    @RequestMapping(value = {"users/{page}", "/"},method = RequestMethod.GET)
    public String pagedListUsers(@PathVariable("page") int page, ModelMap model) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", service.pagedListUsers(page-1));
        return "users";
    }


    @RequestMapping(value = {"findUserByName/"}, method = RequestMethod.POST)
    public String findUserByName(@RequestParam("name") String name, ModelMap model) {
        if (service.findUsersByName(name) != null) {
            model.addAttribute("usersByName", service.findUsersByName(name));
        }

        return "findUserByName";
    }

    @RequestMapping(value = "findUserById/", method = RequestMethod.POST)
    public String findUserById(@RequestParam("id") int id, ModelMap model){
        model.addAttribute("user", service.findById(id));
        return "findUserById";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "registration";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result,
                           ModelMap model) {

        if (result.hasErrors()) {
            return "registration";
        }


        service.saveUser(user);

        model.addAttribute("success", "User " + user.getName() + " updated successfully");
        return "success";
    }


    @RequestMapping(value = { "/edit-{id}-user" }, method = RequestMethod.GET)
    public String editUser(@PathVariable Integer id, ModelMap model) {
        User user = service.findById(id);
        model.addAttribute("user", user);
        model.addAttribute("edit", true);
        return "registration";
    }


    @RequestMapping(value = { "/edit-{id}-user" }, method = RequestMethod.POST)
    public String updateUser(@Valid User user, BindingResult result,
                                 ModelMap model, @PathVariable Integer id) {

        if (result.hasErrors()) {
            return "registration";
        }


        service.updateUser(user);

        model.addAttribute("success", "User " + user.getName()  + " updated successfully");
        return "success";
    }

    @RequestMapping(value = {"/delete-{id}-user"}, method = RequestMethod.GET)
    public String deleteUser(@PathVariable Integer id) {

        service.deleteUserById(id);
        return "redirect:/users/1";
    }



}
