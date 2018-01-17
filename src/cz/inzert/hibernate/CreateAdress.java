package cz.inzert.hibernate;

import cz.inzert.hibernate.entity.Adress;
import cz.inzert.hibernate.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class CreateAdress {

    public static void main(String[] args){
        //create session factory
        SessionFactory factory = new org.hibernate.cfg.Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(User.class)
                .buildSessionFactory();
        //create session
        Session session = factory.getCurrentSession();

        try {
        Adress tmpAdress = new Adress("54101", "Trutnov", "Zamecnicka");
        session.beginTransaction();
        //save tr
        System.out.println("Saving adress...");
        session.save(tmpAdress);
        //commit tr
        session.getTransaction().commit();
        System.out.println("hotovo");
    } finally {
        factory.close();
    }
    }
}
