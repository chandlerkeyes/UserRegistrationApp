package com.jdbc.Assessment.controller;

import com.test.models.UserregistrationEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @RequestMapping(value = "/")
    public ModelAndView helloWorld() {
        return new
                //displays the registration page
                ModelAndView("register", "", "");
    }

    @RequestMapping(value = "/admin")
    public ModelAndView admin() {
        return new
                ModelAndView("admin", "", "");
    }

    @RequestMapping(value = "/addUserSuccess")
    public String addNewUser(@RequestParam("firstName") String firstName,
                             @RequestParam("lastName") String lastName,
                             @RequestParam("address1") String address1,
                             @RequestParam("address2") String address2,
                             @RequestParam("city") String city,
                             @RequestParam("state") String state,
                             @RequestParam("zipCode") String zipCode,
                             @RequestParam("country") String country, Model model) {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();

        UserregistrationEntity resgistration = new UserregistrationEntity();
        resgistration.setFirstName(firstName);
        resgistration.setLastName(lastName);
        resgistration.setAddress1(address1);
        resgistration.setAddress2(address2);
        resgistration.setCity(city);
        resgistration.setState(state);
        resgistration.setZip(zipCode);
        resgistration.setCountry(country);
        session.save(resgistration);
        tx.commit();
        session.close();

        return "confirmation";
    }
}
