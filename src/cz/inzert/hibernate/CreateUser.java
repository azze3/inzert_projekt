package cz.inzert.hibernate;

import cz.inzert.hibernate.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

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
            System.out.println("Creating new user ");
            //todo sifrovat heslo??
            User tmpUser = new User(
                    "Martin",
                    "Capek",
                    "capekma1",
                    "heslo",
                    "elbane303@gmail.com",
                    "1111111111",
                    0,
                    0);

            //start transaction
            session.beginTransaction();
            //save tr
            System.out.println("Saving user...");
            session.save(tmpUser);
            //commit tr
            session.getTransaction().commit();


            // get obj from db
            session = factory.getCurrentSession();
            session.beginTransaction();
            User user = session.get(User.class, 1);
            System.out.println("user z db s id 1 je: " + user.getId() + " " + user.getFirstName());
            session.getTransaction().commit();

            // get obj(s) with query
            session = factory.getCurrentSession();
            session.beginTransaction();
            //SELECT id, firstName, lastName, login, password, phoneNumber, email, rating FROM inzert.user
            String sql = "SELECT id, firstName, lastName, login, password, phoneNumber, email, rating FROM inzert.user";

            List<User> users = (List<User>) session.createNativeQuery(sql, User.class).getResultList();
            //Query query = session.createQuery(sql);
            //List users = query.list();


            for (User u : users) {
                System.out.println(u.getFirstName());
            }
            session.getTransaction().commit();


        } finally {
            factory.close();
        }


    }
}
