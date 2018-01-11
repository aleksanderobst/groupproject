package com.websystique.springmvc.controller;

import com.websystique.springmvc.model.Pet;
import com.websystique.springmvc.model.Task;
import com.websystique.springmvc.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
//który będzie się zajmował obsługą zapytań na adres (/pets/)

public class PetController {

    @Autowired
    PetService service;

    // i w domyślnej metodzie GET
    @RequestMapping(value = {"/listing"}, method = RequestMethod.GET)
    public String showPet(ModelMap model) {
        return "PetsView";
    }

    @RequestMapping(value = {"/pettest"}, method = RequestMethod.GET)
    public String testPet(ModelMap model) {
        Pet zwierzak = new Pet();
        model.addAttribute("pet", zwierzak);

        return "PetsTestView";
    }

    @RequestMapping(value = {"/petdbtest"}, method = RequestMethod.GET)
    public String testPetDatabase(ModelMap model) {
        Pet zwierzak = new Pet();

        try {
            service.savePet(zwierzak);
        } catch (Exception e) {
            Logger.getLogger(PetController.class.getName())
                    .log(Level.WARNING, "error: " + e.getMessage());
            e.printStackTrace();
            return "error";
        }
        return "success";
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)

    public String PetsList(ModelMap model) {
        List<Pet> pets = service.findAllPets();
        model.addAttribute("pets", pets);

        return "PetsListing";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String PetsForm(ModelMap model) {
        Pet pet = new Pet();
        model.addAttribute("pet", pet);
        return "PetsForm";
    }

    @RequestMapping(value = {"/new2"}, method = RequestMethod.GET)
    public String TaskForm(ModelMap model) {
        Task task = new Task();
        model.addAttribute("task", task);
        return "index";
    }

    @RequestMapping(value = {"/delete.jsp"}, method = RequestMethod.GET)
    public String Delete(ModelMap model) {
        Task task = new Task();
        model.addAttribute("task", task);
        return "delete";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String savePet(@Valid Pet pet, BindingResult result,
                          ModelMap model) {

        if (result.hasErrors()) {
            return "registration";
        }

        service.savePet(pet);

        model.addAttribute("success", "Zadanie " + pet.getName() + " zostalo dodane");
        return "success";
    }

    @RequestMapping(value = {"/copy"}, method = RequestMethod.GET)
    public String Copy(ModelMap model) {

        return "showTasks";
    }}






