package cz.inzert.hibernate;

import cz.inzert.hibernate.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class CreateUser {

    public static void main(String[] args){
        //create session factory
        SessionFactory factory = new org.hibernate.cfg.Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(User.class)
                .buildSessionFactory();
        //create session
        Session session = factory.getCurrentSession();

        try {
            //crt object
            System.out.println("Creating user obj");
            User tmpUser = new User();
            tmpUser.setFirstName("Martin");
            tmpUser.setLastName("Capek");
            tmpUser.setLogin("capekma1");
            tmpUser.setEmail("elbane303@gmail.com");
            tmpUser.setAdress(1);
            tmpUser.setPhoneNumber("1111");
            tmpUser.setRating(1);
            tmpUser.setPrivileges(1);
            //start transaction
            session.beginTransaction();

            //save tr
            System.out.println("Saving user...");
            session.save(tmpUser);
            //commit tr
            session.getTransaction().commit();
            System.out.println("hotovo");
        } finally {
            factory.close();
        }
    }
}
