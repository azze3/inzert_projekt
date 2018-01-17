import cz.inzert.User;
import org.hibernate.HibernateException;
import org.hibernate.Metamodel;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.persistence.metamodel.EntityType;

import java.util.Map;

public class Main {
    private static final SessionFactory ourSessionFactory;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.configure();

            ourSessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession() throws HibernateException {
        return ourSessionFactory.openSession();
    }

    public static void main(final String[] args) throws Exception {
        final Session session = getSession();
        try {
            System.out.println("querying all the managed entities...");
            final Metamodel metamodel = session.getSessionFactory().getMetamodel();
            for (EntityType<?> entityType : metamodel.getEntities()) {
                final String entityName = entityType.getName();
                final Query query = session.createQuery("from " + entityName);
                System.out.println("executing: " + query.getQueryString());
                for (Object o : query.list()) {
                    System.out.println("  " + o);
                }
            }
        } finally {
            session.close();
        }
    }


   /* public static void main(String[] args){
        SessionFactory factory = new org.hibernate.cfg.Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(User.class)
                .buildSessionFactory();
        Session session = factory.getCurrentSession();

        try {
            //crt object
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
        }*/
}