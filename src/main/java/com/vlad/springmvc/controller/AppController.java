package com.vlad.springmvc.controller;

import com.vlad.springmvc.model.User;
import com.vlad.springmvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;
import java.util.Locale;

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

    /*Test field can remove*/
    @RequestMapping(value = {"findUserByName/"}, method = RequestMethod.POST)
    public String findUserByName(@RequestParam("name") String name, ModelMap model) {
        if (service.findUserByName(name) != null) {
            model.addAttribute("usersByName", service.findUsersByName(name));
        }

        return "findUserByName";
    }

    @RequestMapping(value = "findUserById/", method = RequestMethod.POST)
    public String findUserById(@RequestParam("id") int id, ModelMap model){
        model.addAttribute("user", service.findById(id));
        return "findUserById";
    }
    /*Test field can remove*/


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
                           ModelMap model) {

        if (result.hasErrors()) {
            return "registration";
        }

        if (!service.isUserNameUnique(user.getId(), user.getName())) {
            FieldError nameError = new FieldError("user", "name", messageSource.getMessage("non.unique.name", new String[] {user.getName()}, Locale.getDefault()));
            result.addError(nameError);
            return "registration";
        }

        service.saveUser(user);

        model.addAttribute("success", "User " + user.getName() + " updated successfully");
        return "success";
    }

    /*
     * This method will provide the medium to update an existing user.
     */
    @RequestMapping(value = { "/edit-{name}-user" }, method = RequestMethod.GET)
    public String editUser(@PathVariable String name, ModelMap model) {
        User user = service.findUserByName(name);
        model.addAttribute("user", user);
        model.addAttribute("edit", true);
        return "registration";
    }

    /*
     * This method will be called on form submission, handling POST request for
     * updating employee in database. It also validates the user input
     */
    @RequestMapping(value = { "/edit-{name}-user" }, method = RequestMethod.POST)
    public String updateUser(@Valid User user, BindingResult result,
                                 ModelMap model, @PathVariable String name) {

        if (result.hasErrors()) {
            return "registration";
        }

        if(!service.isUserNameUnique(user.getId(), user.getName())){
            FieldError nameError =new FieldError("user","name",
                    messageSource.getMessage("non.unique.name", new String[]{user.getName()}, Locale.getDefault()));
            result.addError(nameError);
            return "registration";
        }

        service.updateUser(user);

        model.addAttribute("success", "User " + user.getName()  + " updated successfully");
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
