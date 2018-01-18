package cz.inzert.hibernate;

import cz.inzert.hibernate.entity.Adress;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;

public class CreateAdress {

    public static void main(String[] args) {
        //create session factory
        SessionFactory factory = new org.hibernate.cfg.Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Adress.class)
                .buildSessionFactory();
        //create session
        Session session = factory.getCurrentSession();

        try {
            //
            // save to db
            //
            Adress tmpAdress = new Adress("541014d", "Trutnovvvvv", "Zamecnickva");
            session.beginTransaction();
            //save tr
            System.out.println("Saving adress...");
            session.save(tmpAdress);
            //commit tr
            session.getTransaction().commit();

            //
            // get obj from db
            //
            session = factory.getCurrentSession();
            session.beginTransaction();
            Adress myAdress = session.get(Adress.class, 1);
            System.out.println("Město z db s id 1 je: " + myAdress.getCity());
            session.getTransaction().commit();
            //
            // get obj(s) with query
            //
            session = factory.getCurrentSession();
            session.beginTransaction();
            List<Adress> adresses = (List<Adress>) session.createNativeQuery("SELECT * FROM adress a WHERE 1", Adress.class)
                    .getResultList();
            for (Adress a : adresses) {
                System.out.println(a.getCity());
            }
            session.getTransaction().commit();


        } finally {
            factory.close();
        }
    }
}
