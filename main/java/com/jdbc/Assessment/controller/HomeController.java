package com.jdbc.Assessment.controller;
import com.test.models.UserregistrationEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

//import org.hibernate.cfg.AnnotationConfiguration;

@Controller
public class HomeController {
    @RequestMapping("/")
    public ModelAndView helloWorld()
    {
        return new
                //the type is model and view which brings together model and view
                ModelAndView("register","","");
    }
    @RequestMapping("/admin")
    public ModelAndView admin()
    {
        return new
                //the type is model and view which brings together model and view
                ModelAndView("admin","","");
    }
    @RequestMapping("/addUserSuccess")
    public String addNewUser(@RequestParam("firstName") String firstName,
                             @RequestParam("lastName") String lastName,
                             @RequestParam("address1") String address1,
                             @RequestParam("address2") String address2,
                             @RequestParam("city") String city,
                             @RequestParam("state") String state,
                             @RequestParam("zipCode") String zipCode,
                             @RequestParam("country") String country, Model model) {
        //ADDED A TRY CATCH
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

//        LocalDate currentDate = LocalDate.now();
//        Calendar cal = Calendar.getInstance();
//        java.sql.Date currentDate = java.sql.Date.valueOf(
//                cal.get(cal.YEAR) + ":" +
//                        cal.get(cal.MONTH) + ":" +
//                        cal.get(cal.DATE) );
//
//
       // resgistration.setDate(date);
        session.save(resgistration);
        tx.commit();
        session.close();

            model.addAttribute("registeredUsers", resgistration);
        return "confirmation";
    }
    private ArrayList<UserregistrationEntity> getAllUsers() {
        // Configuration allows app to specify properties & mapping documents
        // to use when creating the SessionFactory
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session selectCustomers = sessionFact.openSession();

        selectCustomers.beginTransaction();


        // Criteria is used to create the query
        Criteria c = selectCustomers.createCriteria(UserregistrationEntity.class);

        // results are returned as list and cast to an ArrayList
        return (ArrayList<UserregistrationEntity>) c.list();
    }
//    @RequestMapping("/listUsers")
//    public ModelAndView listCustomer() {
//        ArrayList<UserregistrationEntity> users = getAllUsers();
//        return new ModelAndView("admin", "userList", users);
//    }
}
